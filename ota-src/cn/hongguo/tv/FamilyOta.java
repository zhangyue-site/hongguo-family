package cn.hongguo.tv;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.database.*;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;
import android.widget.Toast;
import java.io.*;
import java.net.*;
import java.security.MessageDigest;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/** Independent family fork updater. HTTPS origin + SHA256 + package/version/signing checks. */
public final class FamilyOta {
 static final String BASE="https://nas.zhangyue.site/hongguo-ota/";
 static final String CERT="b5aaac0eb0369165d34ee3bae1cddd637eaa2bc3566adf9e3f2dc2f5a1a473e4";
 static final AtomicBoolean busy=new AtomicBoolean();
 static String channel(Context c){return c.getPackageName().endsWith(".mobile")?"mobile":"tv";}
 static File apk(Context c){return new File(c.getCacheDir(),"family-update.apk");}
 static String hex(byte[] b){StringBuilder s=new StringBuilder();for(byte x:b)s.append(String.format("%02x",x&255));return s.toString();}
 static String digest(byte[] b)throws Exception{return hex(MessageDigest.getInstance("SHA-256").digest(b));}
 static long code(PackageInfo p){return Build.VERSION.SDK_INT>=28?p.getLongVersionCode():p.versionCode;}
 static boolean signed(PackageInfo p)throws Exception{return p!=null&&p.signatures!=null&&p.signatures.length==1&&CERT.equals(digest(p.signatures[0].toByteArray()));}
 static HttpURLConnection open(String value)throws Exception{
  URL u=new URL(value);URL root=new URL(BASE);
  if(!"https".equals(u.getProtocol())||!root.getHost().equals(u.getHost())||u.getPort()!=-1||u.getUserInfo()!=null||!u.getPath().startsWith(root.getPath()))throw new IOException("更新来源不匹配");
  HttpURLConnection h=(HttpURLConnection)u.openConnection();h.setInstanceFollowRedirects(false);h.setConnectTimeout(15000);h.setReadTimeout(30000);
  if(h.getResponseCode()!=200){h.disconnect();throw new IOException("更新服务暂不可用");}return h;
 }
 static byte[] read(String url,int limit)throws Exception{
  HttpURLConnection h=open(url);try(InputStream in=h.getInputStream();ByteArrayOutputStream b=new ByteArrayOutputStream()){
   byte[] buf=new byte[8192];int n;while((n=in.read(buf))!=-1){if(b.size()+n>limit)throw new IOException("清单过大");b.write(buf,0,n);}return b.toByteArray();
  }finally{h.disconnect();}
 }
 static void ui(Activity a,Runnable r){a.runOnUiThread(()->{if(!a.isFinishing()&&!a.isDestroyed())r.run();});}
 static void message(Activity a,String s){ui(a,()->Toast.makeText(a,s,Toast.LENGTH_LONG).show());}
 public static void check(Activity a,boolean manual){
  if(!busy.compareAndSet(false,true)){if(manual)message(a,"正在检查或下载更新");return;}
  if(manual)message(a,"正在检查更新…");
  new Thread(()->{try{
   PackageInfo current=a.getPackageManager().getPackageInfo(a.getPackageName(),PackageManager.GET_SIGNATURES);
   if(!signed(current))throw new IOException("当前安装包签名不属于乐天家族");
   JSONObject j=new JSONObject(new String(read(BASE+channel(a)+"/latest.json",65536),"UTF-8"));
   validate(a,j);if(j.getLong("versionCode")<=code(current)){if(manual)message(a,"已是当前最新版本");return;}
   ui(a,()->new AlertDialog.Builder(a).setTitle("发现更新 "+j.optString("versionName"))
    .setMessage(j.optString("notes","应用更新")+"\n\n下载后校验签名，由系统确认安装。")
    .setNegativeButton("稍后",null).setPositiveButton("下载更新",(d,w)->download(a,j)).show());
  }catch(Exception e){if(manual)message(a,"检查失败："+e.getMessage());}
  finally{busy.set(false);}},"family-ota-check").start();
 }
 static void validate(Context c,JSONObject j)throws Exception{
  if(!c.getPackageName().equals(j.getString("packageName"))||!channel(c).equals(j.getString("channel"))||!CERT.equals(j.getString("certificateSha256")))throw new IOException("更新渠道或签名不匹配");
  if(j.getLong("size")<1||j.getLong("size")>100*1024*1024||!j.getString("sha256").matches("[a-f0-9]{64}")||j.getLong("versionCode")<1)throw new IOException("更新清单无效");
  URL u=new URL(j.getString("url"));URL root=new URL(BASE);
  if(!"https".equals(u.getProtocol())||!root.getHost().equals(u.getHost())||u.getPort()!=-1||u.getUserInfo()!=null||!u.getPath().startsWith(root.getPath()+channel(c)+"/"))throw new IOException("下载路径不属于当前渠道");
 }
 static void download(Activity a,JSONObject j){
  if(!busy.compareAndSet(false,true))return;
  ProgressDialog progress=new ProgressDialog(a);progress.setTitle("下载应用更新");progress.setMessage("正在下载并验证安装包…");progress.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);progress.setCancelable(false);progress.show();
  new Thread(()->{File part=new File(a.getCacheDir(),"family-update.part");try{
   validate(a,j);long expected=j.getLong("size"),total=0;MessageDigest md=MessageDigest.getInstance("SHA-256");
   HttpURLConnection h=open(j.getString("url"));try(InputStream in=h.getInputStream();OutputStream out=new FileOutputStream(part)){
    byte[] buf=new byte[32768];int n;int last=-1;while((n=in.read(buf))!=-1){total+=n;if(total>expected)throw new IOException("安装包大小异常");out.write(buf,0,n);md.update(buf,0,n);int pct=(int)(total*100/expected);if(pct!=last){last=pct;ui(a,()->progress.setProgress(pct));}}
   }finally{h.disconnect();}
   if(total!=expected||!hex(md.digest()).equals(j.getString("sha256")))throw new IOException("安装包校验失败");
   PackageManager pm=a.getPackageManager();PackageInfo p=pm.getPackageArchiveInfo(part.getAbsolutePath(),PackageManager.GET_SIGNATURES);
   PackageInfo installed=pm.getPackageInfo(a.getPackageName(),PackageManager.GET_SIGNATURES);
   if(p==null||!a.getPackageName().equals(p.packageName)||code(p)!=j.getLong("versionCode")||code(p)<=code(installed)||!signed(p)||!signed(installed))throw new IOException("包名、版本或签名校验失败");
   if(!part.renameTo(apk(a)))throw new IOException("保存安装包失败");
   ui(a,()->install(a));
  }catch(Exception e){part.delete();message(a,"更新失败："+e.getMessage());}
  finally{busy.set(false);ui(a,()->progress.dismiss());}},"family-ota-download").start();
 }
 static void install(Activity a){
  if(Build.VERSION.SDK_INT>=26&&!a.getPackageManager().canRequestPackageInstalls()){
   new AlertDialog.Builder(a).setTitle("允许安装更新").setMessage("请在系统页面允许本应用安装更新，返回后点击继续安装。")
    .setNegativeButton("稍后",null).setPositiveButton("打开设置",(d,w)->{
     try{a.startActivity(new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,Uri.parse("package:"+a.getPackageName())));
      new AlertDialog.Builder(a).setMessage("授权后点击继续安装").setPositiveButton("继续安装",(x,y)->install(a)).setNegativeButton("稍后",null).show();
     }catch(Exception e){message(a,"请在系统设置中允许本应用安装更新");}
    }).show();return;
  }
  try{Uri u=Uri.parse("content://"+a.getPackageName()+".family-update/apk");Intent i=new Intent(Intent.ACTION_VIEW).setDataAndType(u,"application/vnd.android.package-archive").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);i.setClipData(ClipData.newRawUri("更新安装包",u));a.startActivity(i);}
  catch(Exception e){message(a,"系统未提供安装入口，可从个人云手动安装同签名更新包");}
 }
 public static final class Provider extends ContentProvider {
  public boolean onCreate(){return true;}
  void require(Uri u){if(!("content://"+getContext().getPackageName()+".family-update/apk").equals(u.toString()))throw new SecurityException("Unknown resource");}
  public String getType(Uri u){require(u);return "application/vnd.android.package-archive";}
  public ParcelFileDescriptor openFile(Uri u,String mode)throws FileNotFoundException{require(u);if(!"r".equals(mode))throw new SecurityException("Read only");return ParcelFileDescriptor.open(apk(getContext()),ParcelFileDescriptor.MODE_READ_ONLY);}
  public Cursor query(Uri u,String[] cols,String selection,String[] args,String order){require(u);if(cols==null)cols=new String[]{"_display_name","_size"};MatrixCursor c=new MatrixCursor(cols);Object[] row=new Object[cols.length];for(int n=0;n<cols.length;n++)row[n]="_display_name".equals(cols[n])?"Hongguo-family-update.apk":"_size".equals(cols[n])?apk(getContext()).length():null;c.addRow(row);return c;}
  public Uri insert(Uri u,ContentValues v){throw new SecurityException("Read only");}public int delete(Uri u,String s,String[] a){throw new SecurityException("Read only");}public int update(Uri u,ContentValues v,String s,String[] a){throw new SecurityException("Read only");}
 }
}
