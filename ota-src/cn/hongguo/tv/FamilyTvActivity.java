package cn.hongguo.tv;
public class FamilyTvActivity extends MainActivity {
 @Override public void onCreate(android.os.Bundle b){getSharedPreferences("hongguo-tv",0).edit().putBoolean("update_reminders",false).apply();super.onCreate(b);FamilyOta.check(this,false);}
}
