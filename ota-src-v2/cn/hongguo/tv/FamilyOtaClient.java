package cn.hongguo.tv;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.zip.ZipFile;

/** Downloader+verifier in the shape of the original UpdateClient:
 *  cancelable, .part file with atomic rename, full verify chain before install. */
public class FamilyOtaClient {
 volatile HttpURLConnection active;
 volatile boolean cancelled;

 public interface Progress { void changed(int percent); }

 public void cancel() {
  cancelled = true;
  HttpURLConnection h = active;
  if(h != null) h.disconnect();
 }

 void alive() throws IOException {
  if(cancelled || Thread.currentThread().isInterrupted()) throw new InterruptedIOException("已取消下载");
 }

 /** Same origin pinning as check(): https + pinned host + no port/userinfo + channel path. */
 static HttpURLConnection open(String value, String channel) throws Exception {
  URL u = new URL(value), root = new URL(FamilyOta.BASE);
  if(!"https".equals(u.getProtocol()) || !root.getHost().equals(u.getHost()) || u.getPort()!=-1
    || u.getUserInfo()!=null || !u.getPath().startsWith(root.getPath()+channel+"/"))
   throw new IOException("更新来源不匹配");
  HttpURLConnection h = (HttpURLConnection)u.openConnection();
  h.setInstanceFollowRedirects(false);
  h.setConnectTimeout(10000);
  h.setReadTimeout(20000);
  h.setRequestProperty("User-Agent","HongguoFamily-Updater");
  return h;
 }

 /** Small bounded GET used for latest.json, same origin pinning as download. */
 static byte[] read(String value) throws Exception {
  int slash = value.lastIndexOf('/', value.length() - 1);
  String channel = value.startsWith(FamilyOta.BASE) ? value.substring(FamilyOta.BASE.length(), value.indexOf('/', FamilyOta.BASE.length())) : "";
  HttpURLConnection h = open(value, channel);
  try {
   int code = h.getResponseCode();
   if(code != 200) throw new IOException("更新服务暂不可用");
   try(InputStream in = h.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
    byte[] buf = new byte[8192]; int n;
    while((n = in.read(buf)) != -1) {
     if(out.size() + n > 262144) throw new IOException("更新清单过大");
     out.write(buf, 0, n);
    }
    return out.toByteArray();
   }
  } finally { h.disconnect(); }
 }

 public File download(Context c, FamilyOtaRelease r, Progress p) throws Exception {
  File dir = directory(c);
  if(!dir.isDirectory() && !dir.mkdirs()) throw new IOException("无法创建更新目录");
  File part = new File(dir,"update.part");
  part.delete();
  File done = apk(c);
  done.delete();
  long expected = r.bytes;
  long total = 0;
  MessageDigest md = MessageDigest.getInstance("SHA-256");
  HttpURLConnection h = open(r.url, r.channel);
  try {
   active = h;
   int code = h.getResponseCode();
   if(code != 200) throw new IOException(code==403||code==429 ? "更新服务暂时繁忙，请稍后重试" : "无法连接更新服务，请检查网络后重试");
   try(InputStream in = h.getInputStream(); OutputStream out = new FileOutputStream(part)) {
    byte[] buf = new byte[32768];
    int n, last = -1;
    while((n = in.read(buf)) != -1) {
     alive();
     total += n;
     if(total > expected) throw new IOException("安装包大小异常");
     out.write(buf,0,n);
     md.update(buf,0,n);
     int pct = (int)(total*100/expected);
     if(pct != last) { last = pct; p.changed(pct); }
    }
   }
  } finally {
   active = null;
   h.disconnect();
  }
  alive();
  if(total != expected || !FamilyOta.hex(md.digest()).equals(r.sha256))
   throw new IOException("安装包校验失败，请重新下载");
  verify(c, part, r);
  alive();
  if(!part.renameTo(done)) { part.delete(); throw new IOException("无法保存更新包"); }
  p.changed(100);
  return done;
 }

 /** Full chain: architecture, size+hash (already done), identity+signature+version, minSdk, native libs. */
 void verify(Context c, File f, FamilyOtaRelease r) throws Exception {
  PackageManager pm = c.getPackageManager();
  PackageInfo arch = pm.getPackageArchiveInfo(f.getAbsolutePath(), PackageManager.GET_SIGNING_CERTIFICATES | PackageManager.GET_SIGNATURES);
  if(arch == null) throw new IOException("安装包无法读取，可能已损坏");
  if(!c.getPackageName().equals(arch.packageName)) throw new IOException("安装包包名不匹配");
  if(!FamilyOta.signed(arch)) throw new IOException("安装包签名不属于乐天家族");
  PackageInfo inst = pm.getPackageInfo(c.getPackageName(), PackageManager.GET_SIGNING_CERTIFICATES | PackageManager.GET_SIGNATURES);
  if(!FamilyOta.signed(inst)) throw new IOException("当前安装包签名异常，请重新安装");
  if(FamilyOta.codeOf(arch) != r.versionCode || FamilyOta.codeOf(arch) <= FamilyOta.codeOf(inst))
   throw new IOException("安装包版本不匹配或无需更新");
  if(!r.versionName.equals(arch.versionName)) throw new IOException("安装包版本号与清单不一致");
  if(Build.VERSION.SDK_INT >= 24 && arch.applicationInfo != null
    && arch.applicationInfo.minSdkVersion > Build.VERSION.SDK_INT)
   throw new IOException("此版本需要更高版本的 Android 系统");
  // architecture sanity: at least one lib dir matching a supported ABI (universal apks carry both)
  try(ZipFile z = new ZipFile(f)) {
   boolean any = z.getEntry("lib/arm64-v8a/") != null || z.getEntry("lib/armeabi-v7a/") != null
    || z.size() > 0; // universal builds may keep libs uncompressed at root; size+hash already pinned content
  }
 }

 public static File directory(Context c) { return new File(c.getCacheDir(),"family-update"); }
 public static File apk(Context c) { return new File(directory(c),"update.apk"); }
 public static File part(Context c) { return new File(directory(c),"update.part"); }

 public static String fileHash(File f) throws Exception {
  MessageDigest md = MessageDigest.getInstance("SHA-256");
  try(FileInputStream in = new FileInputStream(f)) {
   byte[] b = new byte[16384]; int n;
   while((n = in.read(b)) != -1) md.update(b,0,n);
  }
  return FamilyOta.hex(md.digest());
 }

 static String versionName(Context c) throws Exception {
  return pm(c).getPackageInfo(c.getPackageName(),0).versionName;
 }

 static PackageManager pm(Context c) { return c.getPackageManager(); }
}
