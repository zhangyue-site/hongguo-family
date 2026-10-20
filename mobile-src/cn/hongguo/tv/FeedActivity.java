package cn.hongguo.tv;

import android.app.AlertDialog;
import android.content.pm.ActivityInfo;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaPlayer;
import android.os.Build;
import android.text.TextUtils;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.OvershootInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

import cn.hongguo.douyin.FeedPager;

/** 0.6.0 单层信息流架构（参考 DouyinDemo 的页面层级）：
 *  整个 App = 一条"单集信息流"。每页 = 一集，进页静音自动播；
 *  上下滑 = 上一集/下一集（本剧播完自动接下一部剧），不再有浏览层/播放层模式切换。
 *  页面层级：视频(引擎 SurfaceView) → 封面(首帧占位,起播后淡出) → 底部信息 → 右侧操作栏 → 心形特效。
 *  手势：单击=开声音/切控制栏；长按=2x；双击=点赞心形。 */
public class FeedActivity extends MainActivity {
    // 尺寸系统
    private int PAD_TOP, PAD_BOTTOM, PAD_SIDE;

    private FeedPager feed;
    private FrameLayout feedRoot;
    private LinearLayout topBar;

    private final ArrayList<JSONObject> seriesList = new ArrayList<>();
    private final ArrayList<Entry> entries = new ArrayList<>();
    private final HashMap<String, JSONArray> epsCache = new HashMap<>();
    private int expandedSeries = -1;
    private int current = -1;
    private boolean engineStarted = false;
    private boolean muted = true;
    private boolean overlaysVisible = true;

    private GestureDetector gesture;
    private android.os.Handler ui2;
    private Runnable muteTask;
    private Runnable hideChromeTask;
    private boolean speedBoost = false;
    private Runnable orientProbe;

    private static final class Entry {
        final JSONObject series;
        final JSONArray eps;
        final int seriesIdx;
        final int ep1;          // 1-based
        Entry(JSONObject s, JSONArray e, int si, int ep) { series = s; eps = e; seriesIdx = si; ep1 = ep; }
    }

    // ---------------------------------------------------------------- lifecycle

    @Override public void onCreate(android.os.Bundle saved) {
        super.onCreate(saved);
        int sb = statusBarHeight();
        int nb = navBarHeight();
        PAD_TOP = sb + dp(8);
        PAD_BOTTOM = nb + dp(18);
        PAD_SIDE = dp(14);
        ui2 = new android.os.Handler(android.os.Looper.getMainLooper());
        gesture = new GestureDetector(this, new GestureDetector.SimpleOnGestureListener() {
            @Override public boolean onDown(MotionEvent e) { return true; }
            @Override public boolean onSingleTapConfirmed(MotionEvent e) {
                onTap();
                return true;
            }
            @Override public boolean onDoubleTap(MotionEvent e) {
                onDoubleTapAt(e.getX(), e.getY());
                return true;
            }
            @Override public void onLongPress(MotionEvent e) { setSpeed(2f); }
        });
    }

    private int navBarHeight() {
        int id = getResources().getIdentifier("navigation_bar_height", "dimen", "android");
        return id > 0 ? getResources().getDimensionPixelSize(id) : dp(48);
    }

    private int statusBarHeight() {
        int id = getResources().getIdentifier("status_bar_height", "dimen", "android");
        return id > 0 ? getResources().getDimensionPixelSize(id) : dp(24);
    }

    @Override public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) pinImmersive();
    }

    protected void pinImmersive() {
        getWindow().getDecorView().setSystemUiVisibility(
            View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
            | View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
            | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
        getWindow().setStatusBarColor(0x00000000);
    }

    // ---------------------------------------------------------------- entry points

    @Override public void show(View view, String title, View focus, boolean push) {
        if ("首页".equals(title) && player == null) {
            super.show(view, title, focus, push);
            attachFeedRoot();
            return;
        }
        super.show(view, title, focus, push);
        pinImmersive();
        if (playback != null && view == playback) {
            // 引擎会 host.removeAllViews()，把我们的信息流压回最上层（视频在其下方）
            if (feedRoot != null) {
                if (feedRoot.getParent() instanceof ViewGroup) ((ViewGroup) feedRoot.getParent()).removeView(feedRoot);
                host.addView(feedRoot, new FrameLayout.LayoutParams(-1, -1));
            }
            hideChromeLoop();
        }
    }

    @Override void restore() {
        super.restore();
        if (screen != null && "首页".equals(screen.name) && player == null) attachFeedRoot();
    }

    /** HomeFeed.ranked() (smali-patched) 提供剧集池 */
    public void feedCatalog(ArrayList<JSONObject> items) {
        if (items == null || items.isEmpty()) return;
        int added = 0;
        for (JSONObject it : items) {
            if (it == null || it.optString("id").isEmpty()) continue;
            if (indexOfSeries(it.optString("id")) >= 0) continue;
            seriesList.add(it);
            added++;
        }
        if (added == 0) return;
        android.util.Log.d("DyFeed", "feedCatalog +" + added + " total=" + seriesList.size());
        runOnUiThread(() -> { if (expandedSeries < 0) expandSeries(0); });
    }

    private int indexOfSeries(String id) {
        for (int i = 0; i < seriesList.size(); i++)
            if (id.equals(seriesList.get(i).optString("id"))) return i;
        return -1;
    }

    // ---------------------------------------------------------------- feed root

    private void attachFeedRoot() {
        hideRail();
        if (feedRoot == null) feedRoot = buildFeedRoot();
        if (feedRoot.getParent() instanceof ViewGroup) ((ViewGroup) feedRoot.getParent()).removeView(feedRoot);
        if (feed.getParent() != feedRoot) {
            if (feed.getParent() instanceof ViewGroup) ((ViewGroup) feed.getParent()).removeView(feed);
            feedRoot.addView(feed, 0, new FrameLayout.LayoutParams(-1, -1));
        }
        host.addView(feedRoot, new FrameLayout.LayoutParams(-1, -1));
        engineStarted = false; // 引擎容器已销毁，下次进页重新 startPlayer
        pinImmersive();
    }

    private void attachFeedToPlayback() {
        // 0.6.0: 不再把信息流挪进播放容器；由 show() 重新压回 host 顶层
    }

    private FrameLayout buildFeedRoot() {
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(0x00000000);

        feed = new FeedPager(this);
        feed.setListener(this::onSettled);
        feed.setTouchObserver(this::onTouchFlow);
        root.addView(feed, new FrameLayout.LayoutParams(-1, -1));

        // 顶栏：只留「搜索 / 我的」，悬浮，带状态栏安全区
        topBar = new LinearLayout(this);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        topBar.setPadding(PAD_SIDE, PAD_TOP, PAD_SIDE, dp(4));
        View stretch = new View(this);
        topBar.addView(stretch, new LinearLayout.LayoutParams(0, 1, 1f));
        topBar.addView(ghostBtn("搜索", super::search));
        topBar.addView(ghostBtn("我的", this::openMine));
        root.addView(topBar, new FrameLayout.LayoutParams(-1, -2, Gravity.TOP));
        return root;
    }

    private TextView ghostBtn(String label, Runnable action) {
        TextView b = text(label, 13, 1);
        b.setTextColor(0xccffffff);
        b.setPadding(dp(12), dp(6), dp(12), dp(6));
        GradientDrawable g = new GradientDrawable();
        g.setColor(0x33000000);
        g.setCornerRadius(dp(14));
        b.setBackground(g);
        b.setOnClickListener(v -> action.run());
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2);
        lp.leftMargin = dp(8);
        b.setLayoutParams(lp);
        return b;
    }

    private void hideRail() {
        try {
            for (int i = 0; i < host.getChildCount(); i++) {
                View c = host.getChildAt(i);
                if (c instanceof ViewGroup) {
                    ViewGroup g = (ViewGroup) c;
                    for (int j = 0; j < g.getChildCount(); j++) {
                        View gc = g.getChildAt(j);
                        if (gc instanceof LinearLayout && gc.getWidth() > 0 && gc.getWidth() <= dp(120))
                            gc.setVisibility(View.GONE);
                    }
                }
                if (c instanceof LinearLayout && c.getWidth() > 0 && c.getWidth() <= dp(120))
                    c.setVisibility(View.GONE);
            }
        } catch (Throwable ignored) {}
    }

    private void openMine() {
        String ver = "";
        try { ver = getPackageManager().getPackageInfo(getPackageName(), 0).versionName; } catch (Throwable ignored) {}
        new AlertDialog.Builder(this)
            .setItems(new String[]{"我的收藏", "观看历史", "设置", "检查更新（当前 " + ver + "）"}, (d, w) -> {
                if (w == 0) super.manageSaved("favorites");
                else if (w == 1) super.manageSaved("history");
                else if (w == 2) super.settings();
                else checkUpdate();
            }).show();
    }

    /** 手动检查更新：走家族 OTA（含签名/哈希校验），有新版会弹下载框 */
    private void checkUpdate() {
        try {
            FamilyOta.check(this, true);
        } catch (Throwable t) {
            android.widget.Toast.makeText(this, "检查更新失败：" + t.getMessage(), android.widget.Toast.LENGTH_LONG).show();
        }
    }

    // ---------------------------------------------------------------- data expansion

    /** 逐部剧展开成"单集页"，本剧播完自动接下一部 */
    private void expandSeries(final int seriesIdx) {
        if (seriesIdx < 0 || seriesIdx >= seriesList.size()) return;
        if (seriesIdx <= expandedSeries) return;
        final JSONObject series = seriesList.get(seriesIdx);
        final String key = series.optString("id");
        if (epsCache.containsKey(key)) { appendSeriesEntries(seriesIdx, series, epsCache.get(key)); return; }
        try {
            String path = "/episodes?id=" + android.net.Uri.encode(series.optString("id"));
            request(path, quiet(), data -> {
                JSONArray eps = data.optJSONArray("episodes");
                if (eps == null || eps.length() == 0) return;
                epsCache.put(key, eps);
                runOnUiThread(() -> appendSeriesEntries(seriesIdx, mergeSeries(data.optJSONObject("series"), series), eps));
            });
        } catch (Exception e) {
            android.util.Log.e("DyFeed", "expandSeries failed", e);
        }
    }

    private TextView quiet() { TextView v = new TextView(this); v.setVisibility(View.GONE); return v; }

    private JSONObject mergeSeries(JSONObject series, JSONObject item) {
        if (series == null) series = new JSONObject();
        java.util.Iterator<String> it = item.keys();
        while (it.hasNext()) {
            String k = it.next();
            if (!series.has(k)) { try { series.put(k, item.opt(k)); } catch (Exception ignored) {} }
        }
        return series;
    }

    private void appendSeriesEntries(int seriesIdx, JSONObject series, JSONArray eps) {
        if (seriesIdx <= expandedSeries) return;
        expandedSeries = seriesIdx;
        int startSize = entries.size();
        ArrayList<View> batch = new ArrayList<>();
        for (int i = 0; i < eps.length(); i++) {
            Entry e = new Entry(series, eps, seriesIdx, i + 1);
            entries.add(e);
            batch.add(buildEntryPage(e));
        }
        feed.appendPages(batch);
        android.util.Log.d("DyFeed", "series " + seriesIdx + " expanded +" + eps.length() + " entries=" + entries.size());
        if (startSize == 0 && entries.size() > 0) ui2.post(() -> feed.jumpTo(0));
    }

    // ---------------------------------------------------------------- page

    private View buildEntryPage(final Entry entry) {
        FrameLayout page = new FrameLayout(this);
        page.setBackgroundColor(0x00000000);

        ImageView cover = new ImageView(this);
        cover.setTag("cover");
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        page.addView(cover, new FrameLayout.LayoutParams(-1, -1));
        loadCover(entry.series.optString("id"), cover);

        View scrim = new View(this);
        scrim.setBackground(new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP,
            new int[]{0xee000000, 0x88000000, 0x00000000}));
        page.addView(scrim, new FrameLayout.LayoutParams(-1, dp(230), Gravity.BOTTOM));

        // 底部信息（左下，抖音布局）
        LinearLayout info = new LinearLayout(this);
        info.setTag("info");
        info.setOrientation(LinearLayout.VERTICAL);
        info.setPadding(PAD_SIDE, 0, dp(84), PAD_BOTTOM);
        info.setGravity(Gravity.BOTTOM);
        TextView title = text(entry.series.optString("title", "未命名"), 18, 1);
        title.setTextColor(0xffffffff);
        title.setMaxLines(1);
        title.setEllipsize(TextUtils.TruncateAt.END);
        info.addView(title);
        TextView meta = text("第 " + entry.ep1 + " 集 · 全 " + entry.eps.length() + " 集", 12, 0);
        meta.setTextColor(0xccffffff);
        meta.setPadding(0, dp(3), 0, 0);
        info.addView(meta);
        String intro = entry.series.optString("intro", "");
        if (!intro.isEmpty()) {
            TextView desc = text(intro, 12, 0);
            desc.setTextColor(0x99ffffff);
            desc.setMaxLines(1);
            desc.setEllipsize(TextUtils.TruncateAt.END);
            desc.setPadding(0, dp(4), 0, 0);
            info.addView(desc);
        }
        TextView muteHint = text("🔇 轻点开启声音 · 画面加载中…", 11, 0);
        muteHint.setTag("mute-hint");
        muteHint.setTextColor(0x99ffffff);
        muteHint.setPadding(0, dp(6), 0, 0);
        info.addView(muteHint);
        page.addView(info, new FrameLayout.LayoutParams(-1, -2, Gravity.BOTTOM));

        // 右侧操作栏（图标+数字，参考 DouyinDemo）
        LinearLayout rail = new LinearLayout(this);
        rail.setTag("rail");
        rail.setOrientation(LinearLayout.VERTICAL);
        rail.setGravity(Gravity.BOTTOM | Gravity.END);
        rail.setPadding(0, 0, PAD_SIDE, PAD_BOTTOM);
        rail.addView(railItem("♥", entry.series.optString("cnt", ""), () -> toggleFav(entry, page)));
        rail.addView(railItem("☰", "", () -> openPicker(entry)));
        rail.addView(railItem("i", "", () -> showIntro(entry)));
        page.addView(rail, new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.END));

        return page;
    }

    private LinearLayout railItem(String icon, String count, Runnable action) {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.CENTER_HORIZONTAL);
        TextView ic = text(icon, 26, 0);
        ic.setTextColor(0xffffffff);
        ic.setGravity(Gravity.CENTER);
        ic.setShadowLayer(dp(4), 0, dp(1), 0x99000000);
        box.addView(ic, new LinearLayout.LayoutParams(dp(46), dp(46)));
        if (count != null && !count.isEmpty()) {
            TextView c = text(count, 11, 1);
            c.setTextColor(0xffffffff);
            c.setGravity(Gravity.CENTER);
            box.addView(c);
        }
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2);
        lp.topMargin = dp(6);
        box.setLayoutParams(lp);
        box.setOnClickListener(v -> action.run());
        return box;
    }

    // ---------------------------------------------------------------- playback

    private void onSettled(int index) {
        if (index < 0 || index >= entries.size()) return;
        int prev = current;
        current = index;
        if (prev >= 0 && prev != index) fadeCover(prev, false);
        Entry e = entries.get(index);
        ensurePlayback(e);
        updateMuteHint(index);
        // 预展开: 滑到本剧最后一集时，自动接下一部
        if (index == entries.size() - 1 && e.seriesIdx + 1 < seriesList.size()) expandSeries(e.seriesIdx + 1);
    }

    private void ensurePlayback(Entry e) {
        if (!engineStarted) {
            engineStarted = true;
            super.startPlayer(e.series, e.eps, e.ep1, 0L);
            scheduleOrientationProbe();
        } else {
            try { super.playEpisode(e.ep1, 0L); } catch (Throwable t) { android.util.Log.e("DyFeed", "playEpisode", t); }
        }
        applyMute();
        hideChromeLoop();
        // 兜底：起播 2.5s 后无论如何淡出封面（首帧检测正常时会更早淡出）
        final int idx = current;
        ui2.postDelayed(() -> fadeCover(idx, true), 2500);
        // 再兜底：5s 后仍无视频尺寸 => 重新拉起该集（修复"只有声音没画面"）
        ui2.postDelayed(() -> {
            MediaPlayer p = player;
            int w = 0;
            try { w = p == null ? 0 : p.getVideoWidth(); } catch (Throwable ignored) {}
            if (w == 0 && idx == current && engineStarted) {
                android.util.Log.w("DyFeed", "no video frame in 5s, replay ep=" + e.ep1);
                try { super.playEpisode(e.ep1, 0L); } catch (Throwable ignored) {}
            }
        }, 5000);
    }

    /** 引擎的 TV 控制条/失败条会反复探出，持续压住 */
    private void hideChromeLoop() {
        if (hideChromeTask != null) ui2.removeCallbacks(hideChromeTask);
        hideChromeTask = new Runnable() {
            int ticks = 0;
            @Override public void run() {
                try { if (chrome != null && chrome.getVisibility() != View.GONE) { chrome.setVisibility(View.GONE); controlsVisible = false; } } catch (Throwable ignored) {}
                if (++ticks < 40 && engineStarted) ui2.postDelayed(this, 500);
            }
        };
        ui2.post(hideChromeTask);
    }

    /** 起播后封面淡出露出视频；离开该页时恢复封面 */
    private void fadeCover(int index, boolean hide) {
        View page = feed != null ? feed.pageAt(index) : null;
        if (page == null) return;
        View cover = page.findViewWithTag("cover");
        if (cover == null) return;
        cover.animate().cancel();
        cover.animate().alpha(hide ? 0f : 1f).setDuration(220).start();
    }

    private void applyMute() {
        if (muteTask != null) ui2.removeCallbacks(muteTask);
        muteTask = () -> {
            MediaPlayer p = player;
            if (p == null) { ui2.postDelayed(muteTask, 300); return; }
            try { p.setVolume(muted ? 0f : 1f, muted ? 0f : 1f); } catch (Throwable ignored) {}
            if (muted) ui2.postDelayed(muteTask, 1200); // 引擎重置音量时再压一次
        };
        ui2.post(muteTask);
    }

    private void updateMuteHint(int index) {
        View page = feed.pageAt(index);
        if (page == null) return;
        View hint = page.findViewWithTag("mute-hint");
        if (hint != null) hint.setVisibility(muted ? View.VISIBLE : View.GONE);
    }

    private void scheduleOrientationProbe() {
        if (orientProbe != null) ui2.removeCallbacks(orientProbe);
        orientProbe = () -> {
            MediaPlayer p = player;
            if (p == null) return;
            int w = 0, h = 0;
            try { w = p.getVideoWidth(); h = p.getVideoHeight(); } catch (Throwable t) {}
            if (w > 0 && h > 0) {
                setRequestedOrientation(w > h ? ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                    : ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                fadeCover(current, true);   // 首帧就绪才淡出封面，避免黑屏
                return;
            }
            ui2.postDelayed(orientProbe, 400);
        };
        ui2.postDelayed(orientProbe, 600);
    }

    private void hideChromeNow() {
        ui2.postDelayed(() -> { if (chrome != null) { chrome.setVisibility(View.GONE); controlsVisible = false; } }, 200);
    }

    // ---------------------------------------------------------------- gestures

    private void onTouchFlow(MotionEvent ev) {
        if (gesture != null) gesture.onTouchEvent(ev);
        int a = ev.getActionMasked();
        if (a == MotionEvent.ACTION_UP || a == MotionEvent.ACTION_CANCEL) setSpeed(1f);
    }

    private void onTap() {
        if (muted) {           // 第一次点：开声音
            muted = false;
            applyMute();
            updateMuteHint(current);
            return;
        }
        overlaysVisible = !overlaysVisible;
        View page = feed.pageAt(current);
        if (page instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) page;
            View info = g.findViewWithTag("info");
            View rail = g.findViewWithTag("rail");
            if (info != null) info.setVisibility(overlaysVisible ? View.VISIBLE : View.GONE);
            if (rail != null) rail.setVisibility(overlaysVisible ? View.VISIBLE : View.GONE);
            if (topBar != null) topBar.setVisibility(overlaysVisible ? View.VISIBLE : View.GONE);
        }
    }

    private void onDoubleTapAt(float x, float y) {
        Entry e = current >= 0 && current < entries.size() ? entries.get(current) : null;
        if (e != null) toggleFav(e, feed.pageAt(current));
        View page = feed.pageAt(current);
        if (page instanceof FrameLayout) heart((FrameLayout) page, x, y);
    }

    private void heart(FrameLayout page, float x, float y) {
        final TextView h = text("❤", 64, 0);
        h.setTextColor(0xffff2d55);
        h.setAlpha(0f);
        h.setScaleX(0.4f);
        h.setScaleY(0.4f);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -2);
        lp.leftMargin = Math.max(0, (int) x - dp(32));
        lp.topMargin = Math.max(0, (int) y - dp(32));
        page.addView(h, lp);
        h.animate().alpha(1f).scaleX(1.2f).scaleY(1.2f).translationY(-dp(60))
            .setDuration(260).setInterpolator(new OvershootInterpolator(2f))
            .withEndAction(() -> h.animate().alpha(0f).translationY(-dp(120)).setDuration(260)
                .withEndAction(() -> { try { page.removeView(h); } catch (Throwable ignored) {} }).start())
            .start();
    }

    private void setSpeed(float s) {
        // 关键：没有真正切换倍速时绝不调用 setPlaybackParams —— 部分机型每次调用都会打断
        // 视频渲染（表现为"有声音没画面"）。只在 1x<->2x 真正变化时调一次。
        if (s > 1f == speedBoost) return;
        speedBoost = s > 1f;
        MediaPlayer p = player;
        if (p != null && Build.VERSION.SDK_INT >= 23) {
            try { p.setPlaybackParams(new android.media.PlaybackParams().setSpeed(s)); } catch (Throwable ignored) {}
        }
    }

    // ---------------------------------------------------------------- actions

    private void toggleFav(Entry e, View page) {
        String id = e.series.optString("id");
        if (id.isEmpty()) return;
        JSONObject favs = bucket("favorites");
        try {
            boolean now;
            if (favs.has(id)) { favs.remove(id); now = false; }
            else { favs.put(id, e.series); now = true; }
            prefs.edit().putString("favorites", favs.toString()).apply();
            android.widget.Toast.makeText(this, now ? "已收藏" : "已取消收藏", android.widget.Toast.LENGTH_SHORT).show();
        } catch (Exception ignored) {}
    }

    private void openPicker(Entry e) {
        try { super.playerEpisodes(); } catch (Throwable ignored) {}
    }

    private void showIntro(Entry e) {
        String intro = e.series.optString("intro", "");
        new AlertDialog.Builder(this)
            .setTitle(e.series.optString("title", "简介"))
            .setMessage(intro.isEmpty() ? "暂无简介" : intro)
            .setPositiveButton("知道了", null).show();
    }

    @Override public void onBackPressed() {
        if (playback != null && (playback.findViewWithTag("settings-overlay") != null
            || playback.findViewWithTag("episode-overlay") != null)) {
            super.onBackPressed();
            return;
        }
        super.onBackPressed();
    }
}
