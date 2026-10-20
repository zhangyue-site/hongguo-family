package cn.hongguo.tv;

import android.app.AlertDialog;
import android.app.UiModeManager;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.Future;

/** Shared touch/remote browser. Only the inherited SurfaceView owns video rendering. */
public class UnifiedActivity extends MainActivity {
 static final int BG=0xff121316, PANEL=0xff202126, INK=0xfff7f7f8, SUB=0xffa7a7b1, RED=0xffff526e;
 boolean tv, ready, dead;
 String section="推荐", mode="short", genre="全部", query="";
 final ArrayList<JSONObject> items=new ArrayList<>();
 LinearLayout browser, list, header;
 ScrollView scroll;
 TextView notice;
 View returnFocus;
 Future<?> catalogJob;
 int ticket, videoW, videoH;
 float downX,downY;
 boolean dragging;
 boolean browserLayoutDirty;
 android.widget.FrameLayout loadingCover;
 TextView loadingText,episodeLabel;
 ProgressBar loadingSpinner;
 int coverEpisode;
 final java.util.concurrent.ConcurrentHashMap<String,String> coverAddresses=new java.util.concurrent.ConcurrentHashMap<>();

 @Override public void onCreate(Bundle b) {
  resolveMode();
  super.onCreate(b);
  ready=true;
  if(browser==null) openSection("推荐");
  applyWindow();
  if(b!=null&&b.containsKey("playing_series"))try{
   final JSONObject series=new JSONObject(b.getString("playing_series"));final JSONArray eps=new JSONArray(b.getString("playing_episodes"));
   final int ep=b.getInt("playing_episode",1);final long pos=b.getLong("playing_position",0);ui.post(()->{if(!dead)startPlayer(series,eps,ep,pos);});
  }catch(Exception ignored){}
 }
 @Override protected void onSaveInstanceState(Bundle out){
  super.onSaveInstanceState(out);
  if(current!=null&&episodes!=null&&playback!=null){out.putString("playing_series",current.toString());out.putString("playing_episodes",episodes.toString());out.putInt("playing_episode",episode);
   long pos=0;try{if(player!=null)pos=player.getCurrentPosition();}catch(Exception ignored){}out.putLong("playing_position",pos);}
 }
 void resolveMode() {
  UiModeManager manager=(UiModeManager)getSystemService(UI_MODE_SERVICE);
  boolean television=manager!=null && manager.getCurrentModeType()==Configuration.UI_MODE_TYPE_TELEVISION;
  television |= getPackageManager().hasSystemFeature("android.software.leanback");
  tv=PresentationPolicy.television(getSharedPreferences("hongguo-tv",0).getString("presentation_mode","auto"),television,
    getPackageManager().hasSystemFeature("android.hardware.touchscreen"));
 }
 void applyWindow() {
  setRequestedOrientation(tv?ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE:ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
  getWindow().setStatusBarColor(BG); getWindow().setNavigationBarColor(BG);
  getWindow().getDecorView().setSystemUiVisibility(tv || playback!=null ? 4102 : 0);
 }
 @Override void home(String a,String b) { if(browser==null) openSection("推荐"); else attachBrowser(); }
 @Override void home(String a,String b,boolean c) { home(a,b); }
 @Override void home(String a,String b,boolean c,boolean d) { home(a,b); }
 @Override void categories() { openSection("剧场"); }
 @Override void search() { searchDialog(); }
 @Override void manageSaved(String key) { openSection("history".equals(key)?"历史":"追剧"); }
 @Override void manageSaved(String key,int sub) { manageSaved(key); }
 @Override void settings() { settingsDialog(); }
 public void feedCatalog(ArrayList<JSONObject> ignored) { /* legacy compatibility only */ }

 TextView label(String s,int size,int color) {
  TextView t=new TextView(this); t.setText(s); t.setTextSize(size);t.setTextColor(color);
  t.setIncludeFontPadding(false);return t;
 }
 @Override public Button button(String name,Runnable action,boolean primary) {
  Button b="暂停".equals(name)?new TransportButton(this):new Button(this);b.setText(name);b.setTextColor(INK);b.setTextSize(tv?16:14);b.setAllCaps(false);
  b.setMinWidth(0);b.setMinimumWidth(0);b.setPadding(dp(8),dp(6),dp(8),dp(6));
  b.setBackground(shape(primary?0xff542333:PANEL,0,10));b.setOnClickListener(v->action.run());
  b.setOnFocusChangeListener((v,focused)->v.setBackground(shape(focused?0xff733247:(primary?0xff542333:PANEL),focused?RED:0,10)));return b;
 }
 static class TransportButton extends Button {
  TransportButton(android.content.Context c){super(c);}
  @Override public void setText(CharSequence value,TextView.BufferType type){
   String text=String.valueOf(value);String symbol="暂停".equals(text)?"Ⅱ":"播放".equals(text)?"▶":"重试".equals(text)?"↻":text;
   super.setText(symbol,type);setContentDescription(text);
   if("重试".equals(text)&&getContext() instanceof UnifiedActivity)((UnifiedActivity)getContext()).playbackFailed();
  }
 }
 GradientDrawable shape(int color,int border,int radius) {
  GradientDrawable d=new GradientDrawable();d.setColor(color);d.setCornerRadius(dp(radius));
  if(border!=0)d.setStroke(dp(2),border);return d;
 }
 void interactive(View v,Runnable action) {
  v.setFocusable(true);v.setClickable(true);
  v.setOnClickListener(x->action.run());
  v.setOnFocusChangeListener((x,focus)->x.setBackground(shape(focus?0xff33232b:PANEL,focus?RED:0,10)));
 }
 TextView action(String s,boolean active,Runnable r) {
  TextView t=label(s,tv?17:14,active?RED:INK);
  t.setGravity(Gravity.CENTER);t.setPadding(dp(14),dp(12),dp(14),dp(12));
  t.setMinHeight(dp(48));t.setBackground(shape(active?0xff34202a:PANEL,0,10));interactive(t,r);return t;
 }
 LinearLayout vertical() {LinearLayout l=new LinearLayout(this);l.setOrientation(1);return l;}
 LinearLayout horizontal() {LinearLayout l=new LinearLayout(this);l.setGravity(Gravity.CENTER_VERTICAL);return l;}
 void gap(LinearLayout p,int h) {View v=new View(this);p.addView(v,new LinearLayout.LayoutParams(1,dp(h)));}
 void title(LinearLayout p,String heading,String subtitle) {
  TextView h=label(heading,tv?27:25,INK);h.setTypeface(null,Typeface.BOLD);p.addView(h);
  if(!subtitle.isEmpty()){gap(p,8);p.addView(label(subtitle,tv?15:13,SUB));}
  gap(p,20);
 }
 void openSection(String s) {
  if(player!=null||playback!=null)stopPlayer();
  section=s;query="";genre="全部";
  rebuild();
  if("追剧".equals(s)||"历史".equals(s)) loadSaved();else loadCatalog(false);
 }
 void rebuild() {
  ++ticket;if(catalogJob!=null)catalogJob.cancel(true);
  browser=vertical();browser.setBackgroundColor(BG);
  browser.setPadding(dp(tv?28:18),dp(tv?22:14),dp(tv?28:18),0);
  header=horizontal();
  TextView brand=label("红果",tv?28:26,RED);brand.setTypeface(null,Typeface.BOLD);
  header.addView(brand,tv?new LinearLayout.LayoutParams(0,-2,1):new LinearLayout.LayoutParams(dp(78),-2));
  TextView search=action(tv?"搜索":"搜索短剧或演员",false,this::searchDialog);search.setContentDescription("搜索");
  if(!tv){search.setGravity(Gravity.CENTER_VERTICAL);search.setTextColor(SUB);header.addView(search,new LinearLayout.LayoutParams(0,dp(44),1));}else header.addView(search);
  browser.addView(header,new LinearLayout.LayoutParams(-1,-2));gap(browser,18);
  if(tv)browser.addView(navigation());
  scroll=new ScrollView(this);scroll.setFillViewport(true);scroll.setClipToPadding(false);
  list=vertical();list.setPadding(0,dp(tv?22:12),0,dp(24));scroll.addView(list);
  browser.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
  if(!tv)browser.addView(navigation());
  attachBrowser();
 }
 LinearLayout navigation() {
  LinearLayout n=horizontal();n.setPadding(0,dp(8),0,dp(10));
  for(String tab:new String[]{"推荐","剧场","追剧","我的"}) {
   TextView b=action(tab,tab.equals(section),()->{if("我的".equals(tab)){section=tab;rebuild();renderMine();}else openSection(tab);});
   if(!tv){b.setBackgroundColor(0x00000000);b.setTextColor(tab.equals(section)?RED:SUB);b.setTypeface(null,tab.equals(section)?Typeface.BOLD:Typeface.NORMAL);}
   LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,dp(48),1);lp.setMargins(dp(3),0,dp(3),0);n.addView(b,lp);
  }
  return n;
 }
 void attachBrowser() {
  if(browser==null||host==null)return;
  if(browser.getParent() instanceof ViewGroup)((ViewGroup)browser.getParent()).removeView(browser);
  super.show(browser,"首页",null,false);back.clear();applyWindow();
 }
 void heading() {
  list.removeAllViews();
  String name=query.isEmpty() ? ("推荐".equals(section)?"好故事，接着看":section) : "搜索结果";
  if(tv||!"推荐".equals(section)||!query.isEmpty())title(list,name,query.isEmpty()?"按题材选剧，点开就能看":"“"+query+"”");
  if(!"追剧".equals(section)&&!"历史".equals(section)) {
   HorizontalScrollView hs=new HorizontalScrollView(this);hs.setHorizontalScrollBarEnabled(false);
   LinearLayout types=horizontal();String[] names={"真人短剧","漫剧","AI 剧"},values={"short","manju","ai"};
   for(int i=0;i<names.length;i++){final String value=values[i];TextView b=action(names[i],value.equals(mode),()->{mode=value;genre="全部";loadCatalog(false);});
    LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(-2,-2);p.rightMargin=dp(8);types.addView(b,p);}
   hs.addView(types);list.addView(hs);gap(list,14);
   if(query.isEmpty()) {
    HorizontalScrollView genres=new HorizontalScrollView(this);genres.setHorizontalScrollBarEnabled(false);
    LinearLayout choices=horizontal();
    for(String g:PublicCategories.genres(mode)) { final String selected=g;TextView c=action(g,g.equals(genre),()->{genre=selected;loadCatalog(false);});
     LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(-2,-2);p.rightMargin=dp(6);choices.addView(c,p);}
    TextView all=action("全部","全部".equals(genre),()->{genre="全部";loadCatalog(false);});choices.addView(all,0);
    genres.addView(choices);list.addView(genres);gap(list,20);
   }
  }
  notice=label("正在寻找好故事…",14,SUB);notice.setPadding(0,dp(4),0,dp(14));list.addView(notice);
 }
 void loadCatalog(boolean refresh) {
  final int id=++ticket;
  if(catalogJob!=null)catalogJob.cancel(true);
  final String q=query,m=mode,g=genre;
  heading();
  catalogJob=io.submit(()->{
   try {
    Catalog.Result result=null;JSONArray found;boolean fallback=false;
    try{
     if(!q.isEmpty()&&!"ai".equals(m)){found=PublicSearch.search(q,"all");fallback=true;}
     else{result=q.isEmpty()?catalog.browsePage(g,m,refresh):catalog.searchPage(q,m,refresh);found=result.items;}
    }catch(Exception unavailable){if(q.isEmpty()||"ai".equals(m)||Thread.currentThread().isInterrupted())throw unavailable;result=catalog.searchPage(q,m,refresh);found=result.items;}
    final boolean stale=result!=null&&result.stale;final boolean alternate=fallback;
    ArrayList<JSONObject> rows=new ArrayList<>();for(int i=0;i<found.length();i++){JSONObject entry=found.getJSONObject(i);rows.add(entry);if(!entry.optString("cover").isEmpty())coverAddresses.put(entry.optString("id"),entry.optString("cover"));}
    ui.post(()->{if(dead||id!=ticket||player!=null)return;items.clear();items.addAll(rows);
     notice.setText(stale?"网络暂不可用，显示上次内容":rows.isEmpty()?"没有找到相关短剧，试试其他关键词":"共 "+rows.size()+" 部"+(alternate?" · 公开搜索结果":" · 点封面查看选集"));
     if("推荐".equals(section)&&q.isEmpty())continueWatching();renderGrid(rows);});
   }catch(Exception e){ui.post(()->{if(dead||id!=ticket||player!=null)return;notice.setText("暂时无法获取内容，请稍后重试");
    list.addView(action("重新加载",true,()->loadCatalog(true)));android.util.Log.w("HongguoUnified","catalog "+m+" "+e.getClass().getSimpleName());});}
  });
 }
 void continueWatching() {
  JSONObject history=bucket("history"),latest=null;Iterator<String> keys=history.keys();
  while(keys.hasNext()){JSONObject row=history.optJSONObject(keys.next());if(row!=null&&(latest==null||row.optLong("updated")>latest.optLong("updated")))latest=row;}
  if(latest==null)return;final JSONObject item=latest;
  LinearLayout box=vertical();box.setPadding(dp(16),dp(14),dp(16),dp(14));box.setBackground(shape(PANEL,0,12));
  box.addView(label("继续观看",12,RED));gap(box,8);box.addView(label(item.optString("title"),18,INK));gap(box,6);
  box.addView(label("第 "+item.optInt("episode",1)+" 集 · 接着上次的故事",13,SUB));interactive(box,()->openDrama(item));list.addView(box);gap(list,20);
 }
 void renderGrid(ArrayList<JSONObject> rows) {
  int width=getResources().getConfiguration().screenWidthDp;
  int columns=PresentationPolicy.columns(width,tv);
  int cardWidth=Math.max(80,(width-(tv?56:36)-columns*10)/columns);
  for(int start=0;start<rows.size();start+=columns){LinearLayout row=horizontal();row.setGravity(Gravity.TOP);
   for(int c=0;c<columns;c++){int index=start+c;
    LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,-2,1);lp.setMargins(dp(4),0,dp(4),dp(18));
    if(index>=rows.size()){row.addView(new View(this),lp);continue;}
    final JSONObject item=rows.get(index);LinearLayout card=vertical();card.setPadding(dp(3),dp(3),dp(3),dp(12));card.setBackground(shape(PANEL,0,10));
    ImageView image=new ImageView(this);image.setScaleType(ImageView.ScaleType.CENTER_CROP);image.setBackgroundColor(0xff303139);
    card.addView(image,new LinearLayout.LayoutParams(-1,dp(cardWidth*1.35f)));loadCover(item.optString("id"),image);
    TextView name=label(item.optString("title","短剧"),tv?17:15,INK);name.setMaxLines(2);name.setEllipsize(android.text.TextUtils.TruncateAt.END);name.setPadding(dp(8),dp(10),dp(8),dp(5));card.addView(name);
    TextView meta=label(item.optInt("count")>0?"全 "+item.optInt("count")+" 集":"查看剧集",12,SUB);meta.setPadding(dp(8),0,dp(8),0);card.addView(meta);
    card.setContentDescription(item.optString("title")+"，查看选集");interactive(card,()->{returnFocus=card;openDrama(item);});row.addView(card,lp);
   }list.addView(row);
  }
  if(tv&&!rows.isEmpty())list.post(()->{View v=list.focusSearch(View.FOCUS_DOWN);if(v!=null&&!list.hasFocus())v.requestFocus();});
 }
 @Override void loadCover(String id,ImageView image) {
  android.graphics.Bitmap cached=(android.graphics.Bitmap)covers.get(id);if(cached!=null){image.setImageBitmap(cached);return;}
  final int viewGeneration=generation;
  coverIo.execute(()->{android.graphics.Bitmap bitmap=null;
   try{java.io.File folder=new java.io.File(getCacheDir(),"posters-v1"),saved=new java.io.File(folder,id+".jpg");
    if(saved.isFile())bitmap=android.graphics.BitmapFactory.decodeFile(saved.getAbsolutePath());
    String address=coverAddresses.get(id);
    if(bitmap==null&&address==null)bitmap=catalog.cover(id,memory);
    else if(bitmap==null){java.net.HttpURLConnection h=(java.net.HttpURLConnection)new java.net.URL(address).openConnection();h.setConnectTimeout(10000);h.setReadTimeout(15000);h.setInstanceFollowRedirects(false);
     try(java.io.InputStream in=h.getInputStream()){java.io.ByteArrayOutputStream bytes=new java.io.ByteArrayOutputStream();byte[] part=new byte[8192];int n;while((n=in.read(part))!=-1){if(Thread.currentThread().isInterrupted())throw new java.io.InterruptedIOException();if(bytes.size()+n>4*1024*1024)throw new java.io.IOException("cover too large");bytes.write(part,0,n);}android.graphics.BitmapFactory.Options o=new android.graphics.BitmapFactory.Options();o.inSampleSize=2;byte[] imageBytes=bytes.toByteArray();bitmap=android.graphics.BitmapFactory.decodeByteArray(imageBytes,0,imageBytes.length,o);}finally{h.disconnect();}}
    if(bitmap!=null&&!saved.isFile()){folder.mkdirs();java.io.File temp=new java.io.File(folder,id+".partial");try(java.io.FileOutputStream out=new java.io.FileOutputStream(temp)){bitmap.compress(android.graphics.Bitmap.CompressFormat.JPEG,82,out);}temp.renameTo(saved);
     java.io.File[] files=folder.listFiles((dir,name)->name.endsWith(".jpg"));if(files!=null&&files.length>200){java.util.Arrays.sort(files,(a,b)->Long.compare(a.lastModified(),b.lastModified()));for(int i=0;i<files.length-200;i++)files[i].delete();}}
   }catch(Exception e){android.util.Log.w("HongguoUnified","cover "+e.getClass().getSimpleName()+": "+String.valueOf(e.getMessage()).replaceAll("https?://[^\\s]+","[url]"));}
   final android.graphics.Bitmap result=bitmap;
   ui.post(()->{if(dead||viewGeneration!=generation||result==null)return;covers.put(id,result);image.setImageBitmap(result);});
  });
 }
 void loadSaved() {
  ++ticket;if(catalogJob!=null)catalogJob.cancel(true);heading();items.clear();JSONObject saved=bucket("历史".equals(section)?"history":"favorites");
  Iterator<String> keys=saved.keys();while(keys.hasNext()){JSONObject item=saved.optJSONObject(keys.next());if(item!=null)items.add(item);}
  java.util.Collections.sort(items,(a,b)->Long.compare(b.optLong("updated"),a.optLong("updated")));
  notice.setText(items.isEmpty()?("历史".equals(section)?"看过的故事会留在这里":"喜欢的短剧，收藏后在这里找") : "已保存 "+items.size()+" 部");renderGrid(items);
 }
 void searchDialog() {
  EditText input=new EditText(this);input.setText(query);input.setSingleLine(true);input.setTextColor(INK);input.setHintTextColor(SUB);input.setHint("输入剧名或演员");input.setPadding(dp(20),dp(16),dp(20),dp(16));
  AlertDialog dialog=new AlertDialog.Builder(this).setTitle("搜索短剧").setView(input).setNegativeButton("取消",null).setPositiveButton("搜索",(d,w)->runSearch(input.getText().toString())).create();
  input.setOnEditorActionListener((v,a,e)->{runSearch(input.getText().toString());dialog.dismiss();return true;});dialog.show();
 }
 void runSearch(String value){query=value.trim();section="剧场";if(query.isEmpty())return;rebuild();loadCatalog(false);}
 void openDrama(JSONObject item) {
  if(player!=null)return;
  new AlertDialog.Builder(this).setTitle(item.optString("title","短剧"))
   .setMessage(item.optString("intro","").isEmpty()?"选择播放，或查看全部集数。":item.optString("intro"))
   .setPositiveButton(bucket("history").has(item.optString("id"))?"继续观看":"立即播放",(d,w)->fetchEpisodes(item,false))
   .setNeutralButton("选集",(d,w)->fetchEpisodes(item,true)).setNegativeButton(bucket("favorites").has(item.optString("id"))?"取消收藏":"收藏",(d,w)->favorite(item)).show();
 }
 void favorite(JSONObject item) {
  try{JSONObject saved=bucket("favorites");String id=item.getString("id");boolean had=saved.has(id);if(had)saved.remove(id);else saved.put(id,new JSONObject(item.toString()).put("updated",System.currentTimeMillis()));
   prefs.edit().putString("favorites",saved.toString()).apply();Toast.makeText(this,had?"已取消收藏":"已加入追剧",Toast.LENGTH_SHORT).show();if("追剧".equals(section))loadSaved();
  }catch(Exception e){Toast.makeText(this,"收藏失败，请重试",Toast.LENGTH_SHORT).show();}
 }
 void fetchEpisodes(JSONObject item,boolean choose) {
  final int requested=++ticket;if(catalogJob!=null)catalogJob.cancel(true);
  if(notice!=null)notice.setText("正在加载《"+item.optString("title")+"》…");
  request("/episodes?id="+android.net.Uri.encode(item.optString("id")),notice,data->{
   if(dead||requested!=ticket)return;
   JSONArray eps=data.getJSONArray("episodes");if(eps.length()==0)throw new Exception("empty episodes");
   JSONObject merged=new JSONObject(item.toString()),details=data.optJSONObject("series");
   if(details!=null){Iterator<String> keys=details.keys();while(keys.hasNext()){String k=keys.next();merged.put(k,details.opt(k));}}
   if(choose)chooseEpisode(merged,eps);else{
    JSONObject h=bucket("history").optJSONObject(merged.optString("id"));
    int ep=h==null?1:Math.max(1,Math.min(eps.length(),h.optInt("episode",1)));long pos=h==null?0:Math.max(0,h.optLong("position"));
    startPlayer(merged,eps,ep,pos);
   }
  });
 }
 android.app.Dialog episodeSheet;
 BaseAdapter episodeSheetAdapter;
 String episodeSheetSeries;
 int selectedEpisode(JSONObject series) {
  if(playback!=null&&current!=null&&current.optString("id").equals(series.optString("id")))return episode;
  JSONObject saved=bucket("history").optJSONObject(series.optString("id"));return saved==null?0:saved.optInt("episode",0);
 }
 void chooseEpisode(JSONObject series,JSONArray eps) {
  if(eps.length()==0)return;
  if(episodeSheet!=null)episodeSheet.dismiss();
  final android.app.Dialog sheet=new android.app.Dialog(this);episodeSheet=sheet;episodeSheetSeries=series.optString("id");
  sheet.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
  LinearLayout panel=vertical();panel.setPadding(dp(20),dp(10),dp(20),dp(20));
  GradientDrawable background=shape(0xff1b1c21,0,0);float r=dp(24);background.setCornerRadii(new float[]{r,r,r,r,0,0,0,0});panel.setBackground(background);
  View handle=new View(this);handle.setBackground(shape(0xff55565e,0,3));LinearLayout.LayoutParams hp=new LinearLayout.LayoutParams(dp(36),dp(4));hp.gravity=Gravity.CENTER_HORIZONTAL;hp.bottomMargin=dp(14);panel.addView(handle,hp);
  LinearLayout heading=horizontal();LinearLayout titles=vertical();
  TextView title=label("选集",20,INK);title.setTypeface(null,Typeface.BOLD);titles.addView(title);gap(titles,6);
  TextView name=label(series.optString("title"),13,SUB);name.setMaxLines(2);name.setEllipsize(android.text.TextUtils.TruncateAt.END);titles.addView(name);
  heading.addView(titles,new LinearLayout.LayoutParams(0,-2,1));
  TextView close=playerAction("×",27,sheet::dismiss);close.setContentDescription("关闭选集");heading.addView(close,new LinearLayout.LayoutParams(dp(48),dp(48)));panel.addView(heading);gap(panel,14);
  final TextView summary=label("",12,SUB);panel.addView(summary);gap(panel,14);
  final GridView grid=new GridView(this);grid.setNumColumns(tv?10:5);grid.setStretchMode(GridView.STRETCH_COLUMN_WIDTH);grid.setVerticalSpacing(dp(10));grid.setHorizontalSpacing(dp(10));grid.setClipToPadding(false);grid.setPadding(0,0,0,dp(8));grid.setCacheColorHint(0);grid.setDrawSelectorOnTop(true);
  android.graphics.drawable.StateListDrawable selector=new android.graphics.drawable.StateListDrawable();
  selector.addState(new int[]{android.R.attr.state_pressed},shape(0x33777788,RED,12));selector.addState(new int[]{android.R.attr.state_focused},shape(0x00777788,INK,12));selector.addState(new int[]{android.R.attr.state_selected},shape(0x00777788,INK,12));selector.addState(new int[]{},new android.graphics.drawable.ColorDrawable(0x00000000));grid.setSelector(selector);
  BaseAdapter adapter=new BaseAdapter(){
   public int getCount(){return eps.length();}public Object getItem(int p){return p+1;}public long getItemId(int p){return p+1;}
   public View getView(int p,View recycled,ViewGroup parent){
    TextView cell=recycled instanceof TextView?(TextView)recycled:label("",16,INK);
    int selected=selectedEpisode(series);boolean active=p+1==selected;
    boolean playing=playback!=null&&current!=null&&current.optString("id").equals(series.optString("id"));
    String state=playing?"播放中":"上次看到";
    cell.setText(active?(p+1)+"\n"+(playing?state:"看过"):String.valueOf(p+1));cell.setTextSize(active?13:16);cell.setTypeface(null,active?Typeface.BOLD:Typeface.NORMAL);cell.setTextColor(active?0xffffffff:INK);cell.setGravity(Gravity.CENTER);cell.setPadding(0,dp(8),0,dp(8));cell.setLayoutParams(new android.widget.AbsListView.LayoutParams(-1,dp(62)));cell.setBackground(shape(active?0xffca3655:0xff292a31,active?RED:0,12));cell.setContentDescription("第 "+(p+1)+" 集"+(active?"，"+state:"，点击播放"));cell.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);return cell;
   }
   public void notifyDataSetChanged(){int selected=selectedEpisode(series);summary.setText("共 "+eps.length()+" 集"+(selected>0?"  ·  "+(playback!=null&&current!=null&&current.optString("id").equals(series.optString("id"))?"正在播放":"上次看到")+"第 "+selected+" 集":"  ·  选择一集开始观看"));super.notifyDataSetChanged();}
  };
  episodeSheetAdapter=adapter;grid.setAdapter(adapter);adapter.notifyDataSetChanged();panel.addView(grid,new LinearLayout.LayoutParams(-1,0,1));
  grid.setOnItemClickListener((parent,view,index,id)->{sheet.dismiss();if(playback!=null&&current!=null&&current.optString("id").equals(series.optString("id"))){if(index+1!=episode)playEpisode(index+1,0);}else startPlayer(series,eps,index+1,0);});
  sheet.setContentView(panel);sheet.setCanceledOnTouchOutside(true);sheet.setOnDismissListener(d->{if(episodeSheet==sheet){episodeSheet=null;episodeSheetAdapter=null;episodeSheetSeries=null;}});
  android.view.Window window=sheet.getWindow();window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(0));window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);android.view.WindowManager.LayoutParams attrs=window.getAttributes();attrs.gravity=Gravity.BOTTOM;attrs.dimAmount=.55f;window.setAttributes(attrs);
  sheet.show();int screenWidth=getResources().getDisplayMetrics().widthPixels,screenHeight=getResources().getDisplayMetrics().heightPixels;window.setLayout(Math.min(screenWidth,dp(tv?1000:720)),Math.min(dp(tv?480:560),(int)(screenHeight*.72f)));
  int selected=selectedEpisode(series);grid.post(()->{grid.setSelection(Math.max(0,Math.min(eps.length()-1,selected-1)));if(tv)grid.requestFocus();});
 }
 @Override void playerEpisodes(){if(current!=null&&episodes!=null)chooseEpisode(current,episodes);}
 @Override public void startPlayer(JSONObject series,JSONArray eps,int index,long position) {
  ++ticket;if(catalogJob!=null)catalogJob.cancel(true);
  if(player!=null||playback!=null)super.stopPlayer();
  attachBrowser();
  android.util.Log.i("HongguoUnified","start series="+series.optString("id")+" episode="+index);
  loadingCover=null;loadingText=null;episodeLabel=null;
  super.startPlayer(series,eps,index,position);applyWindow();adaptControls();prepareCover(index);
  surface.setContentDescription("播放画面，点按显示或隐藏控制，向上滑动下一集");
  surface.setOnTouchListener((v,e)->{
   if(e.getActionMasked()==MotionEvent.ACTION_DOWN){downX=e.getX();downY=e.getY();dragging=false;return true;}
   if(e.getActionMasked()==MotionEvent.ACTION_UP){float dy=e.getY()-downY;
    if(!tv&&Math.abs(dy)>dp(90)&&Math.abs(dy)>Math.abs(e.getX()-downX)*1.5f){int next=episode+(dy<0?1:-1);if(next>=1&&next<=episodes.length())playEpisode(next,0);else if(next>episodes.length())nextDrama();}
    else{if(chrome!=null&&controlsVisible){chrome.setVisibility(View.GONE);controlsVisible=false;}else v.performClick();}return true;}return true;
  });
 }
 void nextDrama(){if(current==null)return;for(int i=0;i<items.size()-1;i++)if(items.get(i).optString("id").equals(current.optString("id"))){JSONObject next=items.get(i+1);stopPlayer();attachBrowser();fetchEpisodes(next,false);return;}Toast.makeText(this,"已看完，返回剧场发现更多",Toast.LENGTH_SHORT).show();}
 @Override public void playEpisode(int ep,long pos) {android.util.Log.i("HongguoUnified","episode="+ep);prepareCover(ep);super.playEpisode(ep,pos);if(episodeSheetAdapter!=null&&current!=null&&current.optString("id").equals(episodeSheetSeries))episodeSheetAdapter.notifyDataSetChanged();if(episodeLabel!=null)episodeLabel.setText("第 "+ep+" 集 / 全 "+episodes.length()+" 集  ›");}
 @Override public void fitVideo(int w,int h) {
  if(w<=0||h<=0)return;videoW=w;videoH=h;videoWidth=w;videoHeight=h;
  if(playback!=null)playback.post(()->{if(surface==null||playback==null||playback.getWidth()<=0||playback.getHeight()<=0)return;int[] size=PresentationPolicy.fit(playback.getWidth(),playback.getHeight(),videoW,videoH);surface.setLayoutParams(new android.widget.FrameLayout.LayoutParams(size[0],size[1],Gravity.CENTER));});
 }
 void adaptControls() {
  if(chrome==null)return;
  for(View v:new View[]{status,clock,seek,pauseButton,nextButton,rateButton})if(v.getParent() instanceof ViewGroup)((ViewGroup)v.getParent()).removeView(v);
  chrome.removeAllViews();chrome.setPadding(dp(16),dp(tv?18:28),dp(16),dp(tv?20:32));
  chrome.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,new int[]{0x99000000,0x00000000,0x00000000,0xbb000000}));
  chrome.setLayoutParams(new android.widget.FrameLayout.LayoutParams(-1,-1));
  LinearLayout top=horizontal();
  top.addView(playerAction("‹",30,()->{stopPlayer();restore();}),new LinearLayout.LayoutParams(dp(40),dp(48)));
  status.setTextSize(tv?18:15);status.setSingleLine(false);status.setMaxLines(2);status.setPadding(dp(8),0,dp(8),0);
  top.addView(status,new LinearLayout.LayoutParams(0,-2,1));
  top.addView(playerAction("⋯",28,this::playerSettings),new LinearLayout.LayoutParams(dp(40),dp(48)));chrome.addView(top);
  LinearLayout transport=horizontal();transport.setGravity(Gravity.CENTER);
  transport.addView(playerAction("↶ 15",16,()->seekBy(-15000)),new LinearLayout.LayoutParams(dp(64),dp(56)));
  pauseButton.setOnKeyListener(null);pauseButton.setTextSize(30);pauseButton.setTextColor(0xff16171a);pauseButton.setPadding(0,0,0,0);pauseButton.setBackground(shape(0xfff7f7f8,0,40));
  pauseButton.setOnFocusChangeListener((v,focused)->v.setBackground(shape(0xfff7f7f8,focused?RED:0,40)));
  LinearLayout.LayoutParams playLp=new LinearLayout.LayoutParams(dp(64),dp(64));playLp.setMargins(dp(24),0,dp(24),0);transport.addView(pauseButton,playLp);
  transport.addView(playerAction("15 ↷",16,()->seekBy(15000)),new LinearLayout.LayoutParams(dp(64),dp(56)));
  chrome.addView(transport,new LinearLayout.LayoutParams(-1,0,1));
  LinearLayout time=horizontal();clock.setTextSize(12);clock.setTextColor(0xffe5e5e8);clock.setPadding(0,0,0,0);time.addView(clock,new LinearLayout.LayoutParams(0,-2,1));
  nextButton.setOnKeyListener(null);nextButton.setText("下一集  ›");flatPlayerButton(nextButton);time.addView(nextButton,new LinearLayout.LayoutParams(dp(92),dp(44)));chrome.addView(time);
  chrome.addView(seek,new LinearLayout.LayoutParams(-1,dp(34)));
  LinearLayout bottom=horizontal();episodeLabel=playerAction("选集  ›",14,this::playerEpisodes);bottom.addView(episodeLabel,new LinearLayout.LayoutParams(0,dp(48),1));
  rateButton.setOnKeyListener(null);flatPlayerButton(rateButton);bottom.addView(rateButton,new LinearLayout.LayoutParams(dp(72),dp(44)));chrome.addView(bottom);
 }
 TextView playerAction(String text,int size,Runnable action){TextView t=label(text,size,INK);t.setGravity(Gravity.CENTER);t.setMinHeight(dp(48));t.setPadding(dp(8),0,dp(8),0);t.setFocusable(true);t.setClickable(true);t.setOnClickListener(v->action.run());t.setOnFocusChangeListener((v,focused)->v.setBackground(focused?shape(0x22000000,0x99ffffff,8):null));return t;}
 void flatPlayerButton(Button b){b.setTextSize(13);b.setTextColor(INK);b.setBackgroundColor(0x00000000);b.setPadding(0,0,0,0);b.setOnFocusChangeListener((v,focused)->v.setBackground(focused?shape(0x22000000,0x99ffffff,8):null));}
 void prepareCover(int ep){
  if(playback==null||current==null)return;
  coverEpisode=ep;
  if(loadingCover==null){loadingCover=new android.widget.FrameLayout(this);ImageView cover=new ImageView(this);cover.setScaleType(ImageView.ScaleType.CENTER_CROP);loadingCover.addView(cover,new android.widget.FrameLayout.LayoutParams(-1,-1));loadCover(current.optString("id"),cover);
   View dim=new View(this);dim.setBackgroundColor(0x99000000);loadingCover.addView(dim,new android.widget.FrameLayout.LayoutParams(-1,-1));LinearLayout state=vertical();state.setGravity(Gravity.CENTER);loadingSpinner=new ProgressBar(this);state.addView(loadingSpinner,new LinearLayout.LayoutParams(dp(28),dp(28)));gap(state,16);loadingText=label("正在准备播放",14,INK);loadingText.setGravity(Gravity.CENTER);loadingText.setPadding(dp(20),0,dp(20),0);state.addView(loadingText);loadingCover.addView(state,new android.widget.FrameLayout.LayoutParams(-1,-2,Gravity.CENTER));
   playback.addView(loadingCover,Math.min(1,playback.getChildCount()),new android.widget.FrameLayout.LayoutParams(-1,-1));}
  loadingText.setText("正在准备第 "+ep+" 集…");loadingSpinner.setVisibility(View.VISIBLE);loadingCover.setVisibility(View.VISIBLE);if(pauseButton!=null)pauseButton.setVisibility(View.INVISIBLE);
 }
 public static void onVideoInfo(MainActivity a,android.media.MediaPlayer p,int info){if(a instanceof UnifiedActivity&&p==a.player&&info==3&&a.prepared){UnifiedActivity u=(UnifiedActivity)a;try{if(!p.isPlaying()||u.coverEpisode!=a.episode)return;}catch(IllegalStateException stale){return;}if(u.loadingCover!=null)u.loadingCover.setVisibility(View.GONE);a.pauseButton.setVisibility(View.VISIBLE);android.util.Log.i("HongguoUnified","first video frame episode="+u.coverEpisode);}}
 void playbackFailed(){if(loadingCover!=null){loadingSpinner.setVisibility(View.GONE);loadingText.setText("暂时无法播放，点中央重试");loadingCover.setVisibility(View.VISIBLE);if(pauseButton!=null)pauseButton.setVisibility(View.VISIBLE);}}
 @Override public void sourceFailure(android.media.MediaPlayer p,Exception e){
  if(e!=null){String message=String.valueOf(e.getMessage()).replaceAll("https?://[^\\s]+","[url]");android.util.Log.e("HongguoUnified","source "+e.getClass().getSimpleName()+": "+message);for(StackTraceElement frame:e.getStackTrace())android.util.Log.e("HongguoUnified",frame.toString());}
  super.sourceFailure(p,e);
  if(p==player)playbackFailed();
 }
 @Override public void onConfigurationChanged(Configuration c){super.onConfigurationChanged(c);if(episodeSheet!=null)episodeSheet.dismiss();resolveMode();if(playback!=null){browserLayoutDirty=true;fitVideo(videoW,videoH);}else if(browser!=null){rebuild();if("我的".equals(section))renderMine();else if("追剧".equals(section)||"历史".equals(section))loadSaved();else loadCatalog(false);}}
 @Override public void restore(){if(playback!=null)stopPlayer();if(browser!=null){if(browserLayoutDirty){browserLayoutDirty=false;rebuild();if("我的".equals(section))renderMine();else if("追剧".equals(section)||"历史".equals(section))loadSaved();else{heading();notice.setText("共 "+items.size()+" 部 · 点封面查看选集");if("推荐".equals(section)&&query.isEmpty())continueWatching();renderGrid(items);}}else attachBrowser();if(returnFocus!=null&&returnFocus.isAttachedToWindow())returnFocus.requestFocus();}else super.restore();}
 @Override public void onBackPressed(){if(player!=null||playback!=null){super.onBackPressed();return;}if(!"推荐".equals(section)||!query.isEmpty()){openSection("推荐");return;}new AlertDialog.Builder(this).setMessage("退出红果？").setNegativeButton("继续看",null).setPositiveButton("退出",(d,w)->finish()).show();}
 void renderMine(){list.removeAllViews();title(list,"我的","收藏、足迹与观看偏好");
  for(String name:new String[]{"观看历史","我的追剧","播放与显示","检查更新","导出观看记录","导入观看记录"}){list.addView(action(name,false,()->{if(name.equals("观看历史"))openSection("历史");else if(name.equals("我的追剧"))openSection("追剧");else if(name.equals("检查更新"))FamilyOta.check(this,true);else if(name.equals("导出观看记录"))TransferData.exportFile(this);else if(name.equals("导入观看记录"))TransferData.importFile(this);else settingsDialog();}));gap(list,12);}
  if(getPackageName().endsWith(".tv")){TextView migration=action("安装手机 / 投影统一版",true,()->{try{startActivity(new Intent(Intent.ACTION_VIEW,android.net.Uri.parse("https://nas.zhangyue.site/hongguo-ota/")));}catch(Exception e){Toast.makeText(this,"请在浏览器打开红果下载页",Toast.LENGTH_LONG).show();}});list.addView(migration);gap(list,12);}
  String version="";try{version=getPackageManager().getPackageInfo(getPackageName(),0).versionName;}catch(Exception ignored){}list.addView(label("红果 · "+version+"\n个人适配版，非官方发行",12,SUB));
 }
 void settingsDialog(){new AlertDialog.Builder(this).setTitle("显示与播放").setItems(new String[]{"显示模式：自动 / 手机 / 投影","播放器设置","检查更新"},(d,w)->{if(w==0)new AlertDialog.Builder(this).setTitle("显示模式").setSingleChoiceItems(new String[]{"自动识别","手机触控","投影 / 遥控"},"tv".equals(prefs.getString("presentation_mode","auto"))?2:"phone".equals(prefs.getString("presentation_mode","auto"))?1:0,(x,i)->{prefs.edit().putString("presentation_mode",new String[]{"auto","phone","tv"}[i]).apply();x.dismiss();resolveMode();applyWindow();if(playback==null){rebuild();if("我的".equals(section))renderMine();else if("追剧".equals(section)||"历史".equals(section))loadSaved();else loadCatalog(false);}}).show();else if(w==1){if(player!=null)playerSettings();else super.settings();}else FamilyOta.check(this,true);}).show();}
 @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);TransferData.result(this,request,result,data);}
 @Override protected void onDestroy(){dead=true;if(episodeSheet!=null)episodeSheet.dismiss();++ticket;if(catalogJob!=null)catalogJob.cancel(true);super.onDestroy();}
}
