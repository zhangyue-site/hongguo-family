package cn.hongguo.tv;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import org.json.JSONArray;
import java.util.ArrayList;

/** Personal phone layout adaptation; original catalog/player code is preserved. */
public class MobileActivity extends MainActivity {
 @Override void sourceFailure(android.media.MediaPlayer player, Exception error) {
  if(error!=null) {
   String message=String.valueOf(error.getMessage()).replaceAll("https?://[^\\s]+","[url]");
   android.util.Log.e("HongguoMobile",error.getClass().getName()+": "+message);
   for(StackTraceElement frame:error.getStackTrace())
    android.util.Log.e("HongguoMobile",frame.toString());
  }
  super.sourceFailure(player,error);
 }
 @Override public void onCreate(Bundle saved) {
  getSharedPreferences("hongguo-tv", 0).edit().putBoolean("update_reminders", false).apply();
  super.onCreate(saved);
  getWindow().getDecorView().setSystemUiVisibility(0);
  getWindow().setStatusBarColor(0xff14151b);
  getWindow().setNavigationBarColor(0xff14151b);
  getWindow().getDecorView().getViewTreeObserver().addOnGlobalLayoutListener(
    () -> adaptRows((ViewGroup)findViewById(android.R.id.content)));
 }

 @Override public LinearLayout shell(String title) {
  LinearLayout root = super.shell(title);
  LinearLayout rail = (LinearLayout) root.getChildAt(0);
  LinearLayout body = (LinearLayout) root.getChildAt(1);
  root.removeAllViews();
  root.setOrientation(LinearLayout.VERTICAL);
  root.setGravity(android.view.Gravity.TOP);
  body.setPadding(dp(12), dp(8), dp(12), dp(4));
  root.addView(body, new LinearLayout.LayoutParams(-1, 0, 1));
  ArrayList<View> buttons = new ArrayList<>();
  for (int n=0; n<rail.getChildCount(); n++) {
   View child = rail.getChildAt(n);
   if (child instanceof Button) buttons.add(child);
  }
  rail.removeAllViews();
  rail.setOrientation(LinearLayout.HORIZONTAL);
  rail.setTag("mobile-nav");
  rail.setPadding(dp(4), dp(2), dp(4), dp(2));
  for (View child : buttons) {
   ((Button) child).setTextSize(13);
   ((Button) child).setMinWidth(0);
   child.setMinimumWidth(0);
   child.setPadding(0, 0, 0, 0);
   rail.addView(child, new LinearLayout.LayoutParams(0, dp(52), 1));
  }
  root.addView(rail, new LinearLayout.LayoutParams(-1, dp(58)));
  LinearLayout header = (LinearLayout) body.getChildAt(0);
  body.removeView(header);
  header.getChildAt(0).setVisibility(View.GONE);
  compact(header);
  for (int i=0;i<header.getChildCount();i++) {
   View item=header.getChildAt(i);
   if(item instanceof Button && ((Button)item).getText().toString().startsWith("搜索"))
    ((Button)item).setText("搜索");
  }
  HorizontalScrollView tabs = new HorizontalScrollView(this);
  tabs.setHorizontalScrollBarEnabled(false);
  tabs.setFillViewport(true);
  tabs.addView(header, new HorizontalScrollView.LayoutParams(-2, -2));
  body.addView(tabs, 0, new LinearLayout.LayoutParams(-1, dp(54)));
  return root;
 }

 private void adaptRows(ViewGroup parent) {
  if (parent instanceof HorizontalScrollView) return;
  for (int i=0;i<parent.getChildCount();i++) {
   View child=parent.getChildAt(i);
   if (!(child instanceof ViewGroup)) continue;
   ViewGroup group=(ViewGroup)child;
   if(group instanceof LinearLayout && !"mobile-card-row".equals(group.getTag()) && ((LinearLayout)group).getOrientation()==LinearLayout.HORIZONTAL
       && group.getChildCount()>0 && group.getChildAt(0) instanceof LinearLayout) {
    LinearLayout first=(LinearLayout)group.getChildAt(0);
    if(first.getChildCount()>0 && (first.getChildAt(0) instanceof ImageView || first.getChildAt(0) instanceof FrameLayout)) {
     ArrayList<View> cards=new ArrayList<>();
     for(int j=0;j<group.getChildCount();j++)
      if(group.getChildAt(j) instanceof LinearLayout) cards.add(group.getChildAt(j));
     group.removeAllViews();
     ((LinearLayout)group).setOrientation(LinearLayout.VERTICAL);
     LinearLayout line=null;
     int h=Math.round((getResources().getDisplayMetrics().widthPixels-dp(48))/2f*1.38f);
     for(int j=0;j<cards.size();j++) {
      if(j%2==0) {line=new LinearLayout(this); line.setTag("mobile-card-row"); group.addView(line);}
      LinearLayout card=(LinearLayout)cards.get(j);
      card.getChildAt(0).setLayoutParams(new LinearLayout.LayoutParams(-1,h));
      LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);
      p.setMargins(dp(3),dp(4),dp(3),dp(4));line.addView(card,p);
     }
     if(cards.size()%2==1) line.addView(new View(this),new LinearLayout.LayoutParams(0,1,1));
     continue;
    }
   }
   if (group instanceof LinearLayout && ((LinearLayout)group).getOrientation()==LinearLayout.HORIZONTAL
       && !"mobile-nav".equals(group.getTag()) && parent instanceof LinearLayout) {
    boolean buttons=false, complex=false;
    for(int j=0;j<group.getChildCount();j++) {
     View v=group.getChildAt(j);
     buttons |= v instanceof Button;
     complex |= v instanceof ViewGroup || v instanceof SeekBar || v instanceof EditText;
    }
    if(buttons && !complex) {
     ViewGroup.LayoutParams previous=child.getLayoutParams();
     parent.removeViewAt(i);
     HorizontalScrollView scroll=new HorizontalScrollView(this);
     scroll.setHorizontalScrollBarEnabled(false);
     for(int j=0;j<group.getChildCount();j++) {
      View v=group.getChildAt(j);
      if(v instanceof Button) {
       LinearLayout.LayoutParams p=(LinearLayout.LayoutParams)v.getLayoutParams();
       p.width=-2; p.weight=0; v.setLayoutParams(p);
      }
     }
     compact(group);
     scroll.addView(child,new HorizontalScrollView.LayoutParams(-2,-2));
     parent.addView(scroll,i,new LinearLayout.LayoutParams(-1,previous.height));
     continue;
    }
   }
   adaptRows(group);
  }
 }

 private void compact(ViewGroup group) {
  for (int i=0; i<group.getChildCount(); i++) {
   View v=group.getChildAt(i);
   if (v instanceof Button) {
    ((Button)v).setTextSize(14);
    ((Button)v).setMinWidth(0);
    v.setMinimumWidth(0);
    v.setPadding(dp(10), 0, dp(10), 0);
    ViewGroup.LayoutParams p=v.getLayoutParams();
    p.height=dp(48); v.setLayoutParams(p);
   }
  }
 }

 @Override void renderCards(LinearLayout host, JSONArray data, View focus, int offset) {
  super.renderCards(host, data, focus, offset);
  ArrayList<View> cards = new ArrayList<>();
  ArrayList<View> footer = new ArrayList<>();
  for (int i=0; i<host.getChildCount(); i++) {
   View row = host.getChildAt(i);
   boolean cardRow = row instanceof LinearLayout && ((LinearLayout)row).getChildCount()>0
      && ((LinearLayout)row).getChildAt(0) instanceof LinearLayout;
   if (!cardRow) { footer.add(row); continue; }
   LinearLayout line=(LinearLayout)row;
   for (int j=0; j<line.getChildCount(); j++) {
    View card=line.getChildAt(j);
    if (card instanceof LinearLayout) cards.add(card);
   }
   line.removeAllViews();
  }
  host.removeAllViews();
  int width=getResources().getDisplayMetrics().widthPixels;
  int posterHeight=Math.round((width-dp(48))/2f*1.38f);
  LinearLayout row=null;
  for (int i=0; i<cards.size(); i++) {
   if (i%2==0) { row=new LinearLayout(this); row.setTag("mobile-card-row"); host.addView(row); }
   LinearLayout card=(LinearLayout)cards.get(i);
   View poster=card.getChildAt(0);
   poster.setLayoutParams(new LinearLayout.LayoutParams(-1,posterHeight));
   LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);
   p.setMargins(dp(3),dp(5),dp(3),dp(8));
   row.addView(card,p);
  }
  if (cards.size()%2==1) row.addView(new View(this),new LinearLayout.LayoutParams(0,1,1));
  for (View v:footer) {
   if (v instanceof LinearLayout) compact((LinearLayout)v);
   host.addView(v);
  }
 }
}
