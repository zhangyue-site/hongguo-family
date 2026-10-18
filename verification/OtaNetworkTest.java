package cn.hongguo.tv;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.*;
import java.io.*;
import org.json.JSONObject;
public class OtaNetworkTest {
 public static void main(String[] args)throws Exception{
  Class<?> at=Class.forName("android.app.ActivityThread");Object t=at.getMethod("systemMain").invoke(null);Context system=(Context)at.getMethod("getSystemContext").invoke(t);
  for(String channel:new String[]{"mobile","tv"}){
   final String pkg="site.zhangyue.hongguo."+channel;ContextWrapper c=new ContextWrapper(system){public String getPackageName(){return pkg;}};
   JSONObject j=new JSONObject(new String(FamilyOta.read(FamilyOta.BASE+channel+"/latest.json",65536),"UTF-8"));FamilyOta.validate(c,j);
   byte[] apk=FamilyOta.read(j.getString("url"),100*1024*1024);if(apk.length!=j.getLong("size")||!FamilyOta.digest(apk).equals(j.getString("sha256")))throw new AssertionError("Download mismatch");
   File part=new File("/data/local/tmp/hongguo-"+channel+".part");try(FileOutputStream out=new FileOutputStream(part)){out.write(apk);}part.setReadable(true,false);
   PackageInfo a=system.getPackageManager().getPackageArchiveInfo(part.getAbsolutePath(),PackageManager.GET_SIGNATURES);
   if(a==null||!pkg.equals(a.packageName)||FamilyOta.code(a)!=j.getLong("versionCode")||!FamilyOta.signed(a))throw new AssertionError("Archive verification failed");
   PackageInfo current=system.getPackageManager().getPackageInfo(pkg,PackageManager.GET_SIGNATURES);if(!FamilyOta.signed(current))throw new AssertionError("Installed certificate");
   part.delete();System.out.println("PASS "+channel+" HTTPS manifest, complete download, SHA256, .part archive parsing, version, archive and installed B5 certificate");
  }
 }
}
