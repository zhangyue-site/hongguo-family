package cn.hongguo.tv;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/** Family OTA v2 — the original TvUpdater etiquette, re-pointed at the family
 *  NAS manifest. Once-a-day auto check, reminder only on idle browse screens,
 *  ignore-this-version, cancelable download into .part + atomic rename, full
 *  verify chain, unknown-source flow continued from onActivityResult, self
 *  cleanup after a successful update. Static singleton; smali lifecycle hooks
 *  call the attach/resume/pause/destroy/focus/screenChanged/activityResult
 *  entry points. */
public final class FamilyOta {
 static final String BASE = "https://nas.zhangyue.site/hongguo-ota/";
 static final String CERT = "b5aaac0eb0369165d34ee3bae1cddd637eaa2bc3566adf9e3f2dc2f5a1a473e4";
 static final int SOURCE_PERMISSION = 8260, INSTALL = 8261;
 static final long DAY = 4 * 3600000L;  // 0.5.0: 24h -> 4h, faster pickup of new builds
 static final String[] IDLE_SCREENS = {"首页","漫剧","AI剧","红果短剧"};

 public static final FamilyOta SELF = new FamilyOta();
 final ThreadPoolExecutor worker = new ThreadPoolExecutor(0,1,15,TimeUnit.SECONDS,new ArrayBlockingQueue<Runnable>(1));
 final AtomicBoolean checking = new AtomicBoolean();
 final Handler ui = new Handler(Looper.getMainLooper());
 volatile Future<?> job;
 volatile FamilyOtaClient client;
 volatile boolean destroyed;
 volatile boolean busy, downloading, pendingInstall;
 int serial, percent;
 volatile Activity activity;
 FamilyOtaRelease latest;
 UpdatePage page;

 // ---------- shared helpers ----------
 static String hex(byte[] b) { StringBuilder s = new StringBuilder(); for(byte x : b) s.append(String.format("%02x", x & 255)); return s.toString(); }
 static boolean signed(PackageInfo p) throws Exception {
  if(p == null) return false;
  byte[] cert;
  if(Build.VERSION.SDK_INT >= 28 && p.signingInfo != null) {
   android.content.pm.Signature[] s = p.signingInfo.hasMultipleSigners()
    ? p.signingInfo.getApkContentsSigners() : p.signingInfo.getSigningCertificateHistory();
   if(s == null || s.length != 1) return false;
   cert = s[0].toByteArray();
  } else {
   if(p.signatures == null || p.signatures.length != 1) return false;
   cert = p.signatures[0].toByteArray();
  }
  return CERT.equals(hex(MessageDigest.getInstance("SHA-256").digest(cert)));
 }
 static long codeOf(PackageInfo p) { return Build.VERSION.SDK_INT >= 28 ? p.getLongVersionCode() : p.versionCode; }
 public static boolean knownFamily(Activity a) {
  try{return signed(a.getPackageManager().getPackageInfo(a.getPackageName(),PackageManager.GET_SIGNATURES | (Build.VERSION.SDK_INT>=28?PackageManager.GET_SIGNING_CERTIFICATES:0)));}
  catch(Exception e){return false;}
 }
 static long codeOf(Activity a) {
  try { return codeOf(a.getPackageManager().getPackageInfo(a.getPackageName(), 0)); }
  catch(Exception e) { return 0; }
 }
 static String channel(Context c) { return c.getPackageName().endsWith(".mobile") ? "mobile" : "tv"; }
 static SharedPreferences prefs(Context c) { return c.getSharedPreferences("hongguo-tv", 0); }
 static String version(Activity a) {
  try { return a.getPackageManager().getPackageInfo(a.getPackageName(), 0).versionName.split("-",2)[0]; }
  catch(Exception e) { return "0.0.0"; }
 }
 static String mb(long bytes) { return String.format(java.util.Locale.ROOT,"%.2f MB", bytes/1000000.0); }
 static String brief(String s) { if(s == null) return ""; return s.length() > 450 ? s.substring(0,450)+"…" : s; }
 static String safeError(Throwable e) {
  String m = e.getMessage();
  if(m == null || m.length() >= 100 || m.contains("://") || m.contains("/")) return "下载失败，请检查网络后重试";
  for(int i = 0; i < m.length(); i++) if(m.charAt(i) >= 0x4E00 && m.charAt(i) <= 0x9FFF) return m;
  return "下载失败，请检查网络后重试";
 }

 // ---------- lifecycle entry points (called from smali) ----------
 /** MainActivity.onCreate — restore state, drop stale files after an update. */
 public static void attach(Activity a) {
  SELF.activity = a;
  SELF.destroyed = false;
  SELF.cleanupIfUpdated(a);
  // 0.5.0: a fresh install/upgrade should check for updates right away
  try {
   long now = codeOf(a);
   SharedPreferences p = prefs(a);
   if(p.getLong("ota_version_seen", -1) != now) {
    p.edit().putLong("ota_version_seen", now).putLong("ota_attempt_at", 0L).apply();
   }
  } catch(Exception ignored) {}
 }

 /** onResume / restore() — daily-gated auto check, then reminder. */
 public static void resume() {
  if(SELF.destroyed) return;
  SELF.ui.postDelayed(new Runnable() { public void run() {
   if(SELF.destroyed) return;
   Activity a1 = SELF.activity;
   if(a1 != null) SELF.check(a1, false);
   SELF.maybeRemind();
  }}, 6000L);
 }

 /** onPause — stop an in-flight download so we never install while backgrounded. */
 public static void pause() { if(SELF.downloading) SELF.cancelWork(); }

 /** onDestroy. */
 public static void destroy() {
  SELF.destroyed = true;
  SELF.serial++;
  SELF.cancelWork();
  SELF.page = null;
  SELF.activity = null;
 }

 /** onWindowFocusChanged(true) — reminder needs window focus. */
 public static void focus() { SELF.maybeRemind(); }

 /** MainActivity.show() — reminder may fire when landing on an idle screen. */
 public static void screenChanged() { SELF.maybeRemind(); }

 /** MainActivity.onActivityResult — unknown-source grant continues install. */
 public static void activityResult(int requestCode, int resultCode) {
  final Activity a = SELF.activity;
  if(a == null) return;
  if(requestCode == SOURCE_PERMISSION && SELF.pendingInstall) {
   SELF.pendingInstall = false;
   if(SELF.installAllowed()) SELF.download();
   else SELF.status("尚未允许安装，更新包已保留，可稍后重试");
  } else if(requestCode == INSTALL) {
   SELF.status(resultCode == 0 ? "安装尚未完成，可点击安装更新重试" : "请以系统安装结果为准");
  }
 }

 // ---------- check ----------
 public static void check(final Activity a, final boolean manual) {
  if(a == null || a.isFinishing()) return;
  SELF.activity = a;
  if(!SELF.checking.compareAndSet(false,true)) {
   if(manual) toast(a,"正在检查或下载更新");
   return;
  }
  if(!manual && !SELF.dueCheck(System.currentTimeMillis())) { SELF.checking.set(false); return; }
  SELF.busy = true;
  if(manual) toast(a,"正在检查更新…");
  final int s = ++SELF.serial;
  SELF.job = SELF.worker.submit(new Runnable() { public void run() {
   FamilyOtaRelease r = null;
   try {
    String host = new URL(BASE).getHost();
    JSONObject j = new JSONObject(new String(FamilyOtaClient.read(BASE + channel(a) + "/latest.json"), "UTF-8"));
    r = new FamilyOtaRelease(j, channel(a), a.getPackageName(), host);
    // stamp only on success: a failed check should retry on next launch
    prefs(a).edit().putLong("ota_attempt_at", System.currentTimeMillis()).apply();
   } catch(Exception e) { r = null; }
   final FamilyOtaRelease rel = r;
   SELF.ui.post(new Runnable() { public void run() { SELF.checked(s, rel, manual); } });
  }});
 }

 void checked(int s, FamilyOtaRelease r, boolean manual) {
  if(destroyed || s != serial) return;
  checking.set(false);
  busy = false;
  final Activity a = activity;
  if(a == null) return;
  if(r == null) {
   boolean keep = newer();
   status("检查失败，请检查网络后重试" + (keep ? "；保留上次发现的版本 " + latest.versionName : ""));
   return;
  }
  latest = r;
  try { prefs(a).edit().putString("ota_release", r.saved()).putLong("ota_checked_at", System.currentTimeMillis()).apply(); }
  catch(Exception e) {}
  status(newer() ? "发现新版本 " + r.versionName : "已是当前最新版本");
  if(newer() && manual) openPage();
  else maybeRemind();
 }

 boolean newer() {
  try { return latest != null && activity != null && latest.versionCode > codeOf(activity); }
  catch(Exception e) { return false; }
 }

 boolean dueCheck(long now) {
  long at = prefs(activity).getLong("ota_attempt_at", 0L);
  return at <= 0 || now < at || now - at >= DAY;
 }

 boolean dueReminder(long now) {
  SharedPreferences p = prefs(activity);
  if(!newer() || latest.versionName.equals(p.getString("ota_ignored",""))) return false;
  long at = p.getLong("ota_reminded_at", 0L);
  return !latest.versionName.equals(p.getString("ota_reminded_version","")) || now < at || now - at >= DAY;
 }

 // ---------- reminder etiquette ----------
 void maybeRemind() {
  final Activity a = activity;
  if(destroyed || busy || a == null || a.isFinishing() || a.isDestroyed() || !a.hasWindowFocus()) return;
  if(page != null && page.attached) return;
  if(!prefs(a).getBoolean("update_reminders", true)) return;
  boolean mobile = a.getPackageName().endsWith(".mobile");
  if(mobile) {
   // douyin-style UX: any non-playback surface is idle browse (feed screens
   // replace the old home grid); playback silence is what matters.
   try { if(((MainActivity)a).player != null) return; } catch(Throwable t) {}
  } else {
   String screen = screenName(a);
   boolean idle = false;
   for(String s : IDLE_SCREENS) if(s.equals(screen)) { idle = true; break; }
   if(!idle) return;
  }
  final FamilyOtaRelease r = latest;
  if(r == null || !dueReminder(System.currentTimeMillis())) return;
  prefs(a).edit().putString("ota_reminded_version", r.versionName).putLong("ota_reminded_at", System.currentTimeMillis()).apply();
  try {
   new AlertDialog.Builder(a)
    .setTitle("发现新版本 " + r.versionName)
    .setMessage("当前 " + version(a) + " → " + r.versionName + "\n安装包 " + mb(r.bytes) + "\n" + brief(r.notes) + "\n\n覆盖安装保留收藏、历史和设置。")
    .setPositiveButton("查看更新", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) { openPage(); } })
    .setNegativeButton("稍后提醒", null)
    .setNeutralButton("忽略此版本", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) { prefs(a).edit().putString("ota_ignored", r.versionName).apply(); } })
    .show();
  } catch(Exception e) {}
 }

 static String screenName(Activity a) {
  try {
   if(a instanceof MainActivity) {
    MainActivity m = (MainActivity)a;
    if(m.screen != null) return m.screen.name;
   }
  } catch(Throwable t) {}
  return "";
 }

 // ---------- download ----------
 void download() {
  final Activity a = activity;
  if(busy || destroyed || a == null || a.isFinishing() || !newer()) return;
  final FamilyOtaRelease r = latest;
  final int s = ++serial;
  busy = true; downloading = true; percent = 0;
  status("正在下载 " + r.versionName + "…");
  final FamilyOtaClient c = new FamilyOtaClient();
  client = c;
  job = worker.submit(new Runnable() { public void run() {
   try {
    c.download(a, r, new FamilyOtaClient.Progress() { public void changed(int p) {
     ui.post(new Runnable() { public void run() {
      if(destroyed || s != serial) return;
      percent = p;
      status(p < 100 ? "正在下载 " + p + "%" : "正在校验安装包…");
     }});
    }});
    ui.post(new Runnable() { public void run() {
     if(destroyed || s != serial) return;
     busy = false; downloading = false; client = null;
     prefs(a).edit().putString("ota_download_version", r.versionName).apply();
     status("下载和校验完成，可以安装");
     requestInstall(a);
    }});
   } catch(Exception e) {
    FamilyOtaClient.part(a).delete();
    final String msg = c.cancelled ? "已取消下载" : safeError(e);
    ui.post(new Runnable() { public void run() {
     if(destroyed || s != serial) return;
     busy = false; downloading = false; client = null;
     status(msg);
    }});
   }
  }});
 }

 void cancelWork() {
  serial++;
  Future<?> j = job;
  if(j != null) j.cancel(true);
  FamilyOtaClient c = client;
  if(c != null) c.cancel();
  worker.purge();
 }

 void status(String s) {
  if(page != null) { page.statusText = s; page.render(); }
 }

 boolean installAllowed() {
  Activity a = activity;
  return a != null && (Build.VERSION.SDK_INT < 26 || a.getPackageManager().canRequestPackageInstalls());
 }

 void requestInstall(final Activity a) {
  if(a.isFinishing() || a.isDestroyed() || !FamilyOtaClient.apk(a).isFile()) return;
  if(!installAllowed()) {
   try {
    new AlertDialog.Builder(a)
     .setTitle("允许安装更新")
     .setMessage("请在系统页面允许本应用安装更新，返回后继续安装。本操作不会卸载或清除观看记录。")
     .setNegativeButton("稍后", null)
     .setPositiveButton("去设置", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) {
      try {
       pendingInstall = true;
       a.startActivityForResult(new Intent(android.provider.Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:"+a.getPackageName())), SOURCE_PERMISSION);
      } catch(Exception e) {
       pendingInstall = false;
       status("无法打开授权页，请在系统设置中允许本应用安装更新");
      }
     }}).show();
   } catch(Exception e) {}
   return;
  }
  try {
   Uri u = Uri.parse("content://" + a.getPackageName() + ".family-update/apk");
   Intent i = new Intent(Intent.ACTION_VIEW).setDataAndType(u,"application/vnd.android.package-archive").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
   i.setClipData(ClipData.newRawUri("更新安装包", u));
   a.startActivityForResult(i, INSTALL);
   status("已打开系统安装器，请确认安装");
  } catch(Exception e) { status("系统未提供安装入口，可从个人云手动安装同签名更新包"); }
 }

 // ---------- update page ----------
 public void openPage() {
  final Activity a = activity;
  if(a == null || a.isFinishing() || a.isDestroyed()) return;
  if(page == null) page = new UpdatePage(a);
  page.show();
 }

 static void toast(final Activity a, final String s) {
  if(a == null) return;
  ui_self().post(new Runnable() { public void run() {
   if(!a.isFinishing() && !a.isDestroyed()) Toast.makeText(a, s, Toast.LENGTH_LONG).show();
  }});
 }
 static Handler ui_self() { return SELF.ui; }

 // ---------- self cleanup ----------
 void cleanupIfUpdated(Activity a) {
  try {
   SharedPreferences p = prefs(a);
   String v = p.getString("ota_download_version","");
   if(!v.isEmpty()) {
    String cur = a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
    if(cur.equals(v) || currentAtLeast(cur, v)) {
     FamilyOtaClient.part(a).delete();
     FamilyOtaClient.apk(a).delete();
     p.edit().remove("ota_download_version").remove("ota_release").apply();
     latest = null;
    }
   }
   String saved = p.getString("ota_release","");
   if(!saved.isEmpty()) {
    try {
     FamilyOtaRelease r = FamilyOtaRelease.restore(saved);
     if(r.versionCode <= codeOf(a)) { p.edit().remove("ota_release").apply(); latest = null; }
     else latest = r;
    } catch(Exception e) { p.edit().remove("ota_release").apply(); }
   }
   File stale = FamilyOtaClient.part(a);
   if(stale.isFile() && !downloading) stale.delete();
  } catch(Exception e) {}
 }

 static boolean currentAtLeast(String cur, String dl) {
  try {
   long a = Long.parseLong(cur.replaceAll("[^0-9].*$",""));
   long b = Long.parseLong(dl.replaceAll("[^0-9].*$",""));
   return a >= b;
  } catch(Exception e) { return false; }
 }

 // ---------- update page (original TvUpdater.page shape) ----------
 class UpdatePage {
  final Activity a;
  LinearLayout shell;
  TextView info, notes;
  ProgressBar progress;
  Button checkBtn, downloadBtn, cancelBtn, remindersBtn;
  boolean attached;
  String statusText = "尚未检查更新";

  UpdatePage(Activity a) { this.a = a; }

  void build() {
   MainActivity m = (MainActivity)a;
   shell = m.shell("应用更新");
   LinearLayout body = m.body(shell);
   info = m.text("", 17, m.ink());
   body.addView(info);
   progress = new ProgressBar(a, null, android.R.attr.progressBarStyleHorizontal);
   progress.setMax(100);
   body.addView(progress, new LinearLayout.LayoutParams(-1, m.dp(12f)));
   LinearLayout row = m.row();
   checkBtn = m.button("检查更新", new Runnable() { public void run() { FamilyOta.check(a, true); } }, false);
   downloadBtn = m.button("下载并安装", new Runnable() { public void run() { download(); } }, false);
   cancelBtn = m.button("取消下载", new Runnable() { public void run() {
    if(busy) {
     serial++;
     Future<?> j = job; if(j != null) j.cancel(true);
     FamilyOtaClient c = client; if(c != null) c.cancel();
     worker.purge();
     busy = false; downloading = false;
     statusText = "已取消下载，可重新尝试";
     render();
    }
   }}, false);
   m.addButton(row, checkBtn); m.addButton(row, downloadBtn); m.addButton(row, cancelBtn);
   body.addView(row);
   remindersBtn = m.button("", new Runnable() { public void run() {
    SharedPreferences p = prefs(a);
    p.edit().putBoolean("update_reminders", !p.getBoolean("update_reminders", true)).apply();
    render();
   }}, false);
   body.addView(remindersBtn);
   android.widget.ScrollView sv = new android.widget.ScrollView(a);
   sv.setFocusable(true);
   sv.setContentDescription("更新说明，上下键滚动");
   notes = m.text("", 15, m.muted());
   sv.addView(notes);
   body.addView(sv, new LinearLayout.LayoutParams(-1, 0, 1f));
  }

  void show() {
   if(shell == null) build();
   attached = true;
   ((MainActivity)a).show(shell, "应用更新", checkBtn, true);
   render();
  }

  void render() {
   if(a.isFinishing() || a.isDestroyed()) return;
   boolean has = FamilyOta.this.newer();
   info.setText("当前版本 " + version(a) + "\n" + statusText);
   progress.setVisibility(downloading ? View.VISIBLE : View.GONE);
   progress.setProgress(percent);
   checkBtn.setEnabled(!busy);
   downloadBtn.setEnabled(!busy && has);
   downloadBtn.setText(FamilyOtaClient.apk(a).isFile() ? "安装更新" : "下载并安装");
   cancelBtn.setVisibility(downloading ? View.VISIBLE : View.GONE);
   remindersBtn.setText("新版本提醒：" + (prefs(a).getBoolean("update_reminders", true) ? "开" : "关"));
   notes.setText(has
    ? "新版本 " + latest.versionName + " · " + mb(latest.bytes) + "\n\n" + latest.notes + "\n\n下载后核验家族签名，安装需在系统界面确认。"
    : "每天打开应用时自动检查一次，仅在浏览页提醒，播放时暂缓。\n\n更新来自家族NAS更新源；覆盖安装保留记录。");
  }
 }
}
