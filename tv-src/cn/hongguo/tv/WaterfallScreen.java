package cn.hongguo.tv;

import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;

/** Xiaomi-精选-style waterfall for TV/投影.
 *  Data comes from the ORIGINAL home() pipeline via FamilyTvActivity.renderCards
 *  (StandaloneApi only serves /health and /episodes — catalog must go through
 *  the original Catalog/PublicCategories path, same as the official app).
 *  Tabs: 推荐(=首页) / 漫剧 / AI剧 / 收藏 / 历史. Cards fill the shortest column,
 *  focus moves the content, LEFT on the first column returns to the tab row. */
public class WaterfallScreen {
 public interface JsonDone { void run(JSONObject data, String error); }

 static final int COLS = 3;
 static final int PAGE = 18;
 static final String[] TABS = {"推荐", "漫剧", "AI剧", "收藏", "历史"};

 final FamilyTvActivity a;
 LinearLayout root;
 LinearLayout tabRow;
 LinearLayout flowRow;
 TextView heading;
 final ArrayList<LinearLayout> columns = new ArrayList<>();
 final ArrayList<JSONObject> items = new ArrayList<>();
 final int[] colHeight = new int[COLS];
 final int[] focusSlot = new int[TABS.length];
 int tabIndex = 0;
 int focusIndex = -1;

 public WaterfallScreen(FamilyTvActivity a) { this.a = a; }

 boolean isNetworkTab() { return tabIndex <= 2; }

 /** Cover the original home screen; the pipeline underneath keeps running. */
 public void attach() {
  if (root == null) build();
  if (root.getParent() instanceof ViewGroup) ((ViewGroup) root.getParent()).removeView(root);
  // Do not attach yet: the original home screen must finish its own layout and
  // deliver the first catalog page; showing early would bump `generation` and
  // silently discard that request. We surface on first ingest().
  tabIndex = 0;
  clearCards();
 }

 void surface() {
  if (root == null) return;
  try { a.show(root, TABS[tabIndex], focusSlot[tabIndex] >= 0 ? null : null, false); } catch (Throwable t) {}
 }

 void bringToFront() {
  if (root != null) root.bringToFront();
 }

 void build() {
  MainActivity m = a;
  root = m.column();
  root.setBackgroundColor(0xff0f0f12);

  tabRow = m.row();
  tabRow.setPadding(m.dp(10), m.dp(10), m.dp(10), m.dp(8));
  for (int i = 0; i < TABS.length; i++) {
   final int idx = i;
   android.widget.Button b = m.button(TABS[i], () -> { if (tabIndex != idx) switchTab(idx); }, false);
   b.setTextSize(17);
   LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, m.dp(44), 1);
   lp.setMargins(m.dp(4), 0, m.dp(4), 0);
   tabRow.addView(b, lp);
  }
  root.addView(tabRow, new LinearLayout.LayoutParams(-1, -2));

  heading = m.text("", 18, m.muted());
  heading.setPadding(m.dp(14), m.dp(2), m.dp(14), m.dp(4));
  root.addView(heading, new LinearLayout.LayoutParams(-1, -2));

  flowRow = m.row();
  flowRow.setPadding(m.dp(10), m.dp(4), m.dp(10), m.dp(10));
  for (int c = 0; c < COLS; c++) {
   LinearLayout col = m.column();
   LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1, 1);
   lp.setMargins(m.dp(5), 0, m.dp(5), 0);
   flowRow.addView(col, lp);
   columns.add(col);
  }
  root.addView(flowRow, new LinearLayout.LayoutParams(-1, 0, 1));
 }

 // ---------------------------------------------------------------- tabs

 void switchTab(int idx) {
  tabIndex = idx;
  clearCards();
  if (idx >= 3) {
   loadHistoryOrFav(idx == 3);
   return;
  }
  String title = idx == 0 ? "首页" : TABS[idx];
  try { a.home(title, null); } catch (Throwable t) { heading.setText("目录加载失败"); }
 }

 void clearCards() {
  items.clear();
  for (LinearLayout col : columns) col.removeAllViews();
  java.util.Arrays.fill(colHeight, 0);
  focusIndex = -1;
  heading.setText("");
 }

 void loadHistoryOrFav(boolean fav) {
  JSONObject b = a.bucket(fav ? "favorites" : "history");
  ArrayList<JSONObject> list = new ArrayList<>();
  java.util.Iterator<String> it = b.keys();
  while (it.hasNext()) {
   JSONObject o = b.optJSONObject(it.next());
   if (o != null) list.add(o);
  }
  java.util.Collections.reverse(list);
  items.addAll(list);
  if (items.isEmpty()) heading.setText(fav ? "还没有收藏" : "还没有观看记录");
  renderMore();
 }

 // ---------------------------------------------------------------- data from renderCards

 /** Original pipeline delivered a catalog page: absorb it for the active tab. */
 public void ingest(JSONArray arr) {
  if (arr == null || !isNetworkTab()) return;
  boolean added = false;
  for (int i = 0; i < arr.length(); i++) {
   JSONObject o = arr.optJSONObject(i);
   if (o == null || o.optString("id").isEmpty()) continue;
   if (indexOfId(o.optString("id")) >= 0) continue;
   items.add(o);
   added = true;
  }
  if (added) a.runOnUiThread(() -> {
   renderMore();
   surface();
  });
 }

 int indexOfId(String id) {
  for (int i = 0; i < items.size(); i++)
   if (id.equals(items.get(i).optString("id"))) return i;
  return -1;
 }

 // ---------------------------------------------------------------- render

 void renderMore() {
  a.runOnUiThread(() -> {
   int start = countCards();
   int end = Math.min(items.size(), start + PAGE);
   for (int i = start; i < end; i++) addCard(i);
  });
 }

 int countCards() {
  int n = 0;
  for (LinearLayout col : columns) n += col.getChildCount();
  return n;
 }

 int shortestColumn() {
  int best = 0;
  for (int c = 1; c < COLS; c++) if (colHeight[c] < colHeight[best]) best = c;
  return best;
 }

 void addCard(int index) {
  MainActivity m = a;
  JSONObject item = items.get(index);
  int col = shortestColumn();
  LinearLayout card = m.column();
  card.setPadding(m.dp(6), m.dp(6), m.dp(6), m.dp(8));
  ImageView poster = new ImageView(a);
  poster.setScaleType(ImageView.ScaleType.CENTER_CROP);
  int w = (a.getWindow().getDecorView().getWidth() - m.dp(60)) / COLS;
  int h = Math.round(w * 1.38f);
  card.addView(poster, new LinearLayout.LayoutParams(-1, h));
  TextView title = m.text(opt(item, "title", "name"), 15, m.ink());
  title.setSingleLine(true);
  LinearLayout.LayoutParams tlp = new LinearLayout.LayoutParams(-1, -2);
  tlp.setMargins(0, m.dp(6), 0, 0);
  card.addView(title, tlp);
  String sub = opt(item, "sub", "category", "intro");
  if (sub.length() > 0) {
   TextView st = m.text(sub, 12, m.muted());
   st.setSingleLine(true);
   card.addView(st, new LinearLayout.LayoutParams(-1, -2));
  }
  card.setTag("wcard:" + index);
  card.setFocusable(true);
  card.setFocusableInTouchMode(true);
  card.setOnClickListener(v -> playAt(index));
  card.setOnFocusChangeListener((v, has) -> {
   v.setScaleX(has ? 1.06f : 1f);
   v.setScaleY(has ? 1.06f : 1f);
   v.setAlpha(has ? 1f : 0.88f);
   if (has) onFocusCard(index);
  });
  card.setOnKeyListener((v, keyCode, ev) -> {
   if (ev.getAction() != KeyEvent.ACTION_DOWN) return false;
   if (keyCode == KeyEvent.KEYCODE_DPAD_LEFT && isLeftmost(index)) {
    focusTab(tabIndex);
    return true;
   }
   return false;
  });
  columns.get(col).addView(card, new LinearLayout.LayoutParams(-1, -2));
  colHeight[col] += 4;
  String cover = opt(item, "cover", "poster", "image");
  if (cover.length() > 0) a.loadCover(cover, poster);
 }

 boolean isLeftmost(int index) {
  for (int c = 0; c < COLS; c++) {
   LinearLayout col = columns.get(c);
   for (int i = 0; i < col.getChildCount(); i++)
    if (("wcard:" + index).equals(col.getChildAt(i).getTag())) return c == 0;
  }
  return false;
 }

 void focusTab(int idx) {
  if (tabRow != null && idx < tabRow.getChildCount()) tabRow.getChildAt(idx).requestFocusFromTouch();
 }

 String opt(JSONObject o, String... keys) {
  for (String k : keys) {
   String v = o.optString(k, "");
   if (v.length() > 0) return v;
  }
  return "";
 }

 // ---------------------------------------------------------------- focus & playback

 void onFocusCard(int index) {
  focusIndex = index;
  focusSlot[tabIndex] = index;
  if (index >= items.size() - 6) renderMore();
 }

 public void playFromWaterfallPublic(JSONObject item) { playAt(indexOfId(item.optString("id"))); }

 void playAt(int index) {
  if (index < 0 || index >= items.size()) return;
  a.playSeries(items.get(index));
 }
}
