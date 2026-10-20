package cn.hongguo.tv;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.widget.Toast;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

/** Explicit bounded record migration. Credentials and OTA state are excluded. */
final class TransferData {
 static final int EXPORT=8401,IMPORT=8402,LIMIT=2*1024*1024;
 static void exportFile(Activity a){pick(a,new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("application/json").putExtra(Intent.EXTRA_TITLE,"hongguo-watch-records.json"),EXPORT);}
 static void importFile(Activity a){pick(a,new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("application/json"),IMPORT);}
 static void pick(Activity a,Intent i,int code){try{a.startActivityForResult(i,code);}catch(Exception e){Toast.makeText(a,"当前设备没有文件选择器，请先安装文件管理器",Toast.LENGTH_LONG).show();}}
 static JSONObject validateBucket(JSONObject input)throws Exception {
  if(input==null||input.length()>10000)throw new Exception("invalid records");
  JSONObject out=new JSONObject();Iterator<String> keys=input.keys();
  while(keys.hasNext()){String id=keys.next();JSONObject item=input.optJSONObject(id);
   if(!id.matches("[0-9]{8,24}")||item==null||!id.equals(item.optString("id"))||item.optString("title").length()>500||item.optInt("episode",1)<1||item.optLong("position",0)<0)throw new Exception("invalid record");
   out.put(id,item);
  }return out;
 }
 static JSONObject merge(JSONObject local,JSONObject incoming)throws Exception {
  JSONObject result=new JSONObject(local.toString());Iterator<String> keys=incoming.keys();
  while(keys.hasNext()){String id=keys.next();JSONObject next=incoming.getJSONObject(id),old=local.optJSONObject(id);
   if(old==null||next.optLong("updated")>old.optLong("updated"))result.put(id,next);
  }return result;
 }
 static void result(Activity a,int request,int result,Intent data){
  if((request!=EXPORT&&request!=IMPORT)||result!=Activity.RESULT_OK||data==null||data.getData()==null)return;
  try {
   SharedPreferences p=a.getSharedPreferences("hongguo-tv",0);
   if(request==EXPORT){JSONObject j=new JSONObject().put("format","hongguo-watch-records").put("version",1)
    .put("favorites",new JSONObject(p.getString("favorites","{}"))).put("history",new JSONObject(p.getString("history","{}")));
    byte[] bytes=j.toString().getBytes("UTF-8");if(bytes.length>LIMIT)throw new Exception("too large");
    try(OutputStream out=a.getContentResolver().openOutputStream(data.getData(),"wt")){if(out==null)throw new Exception("no output");out.write(bytes);}
    Toast.makeText(a,"已导出追剧与观看进度，可在统一版中导入",Toast.LENGTH_LONG).show();
   }else{
    ByteArrayOutputStream bytes=new ByteArrayOutputStream();try(InputStream in=a.getContentResolver().openInputStream(data.getData())){if(in==null)throw new Exception("no input");byte[] buf=new byte[8192];int n;while((n=in.read(buf))!=-1){if(bytes.size()+n>LIMIT)throw new Exception("too large");bytes.write(buf,0,n);}}
    JSONObject j=new JSONObject(bytes.toString("UTF-8"));if(!"hongguo-watch-records".equals(j.optString("format"))||j.optInt("version")!=1)throw new Exception("unknown format");
    JSONObject favorites=merge(new JSONObject(p.getString("favorites","{}")),validateBucket(j.getJSONObject("favorites")));
    JSONObject history=merge(new JSONObject(p.getString("history","{}")),validateBucket(j.getJSONObject("history")));
    if(!p.edit().putString("favorites",favorites.toString()).putString("history",history.toString()).commit())throw new Exception("write failed");
    Toast.makeText(a,"已合并导入，较新的观看进度已保留",Toast.LENGTH_LONG).show();
   }
  }catch(Exception e){Toast.makeText(a,request==IMPORT?"导入失败：请选择有效的红果记录文件":"导出失败，请检查文件位置",Toast.LENGTH_LONG).show();}
 }
}
