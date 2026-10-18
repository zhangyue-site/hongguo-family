package cn.hongguo.tv;
import android.content.ContextWrapper;
import org.json.JSONObject;
public final class OtaSelfTest {
 static int passed;
 static ContextWrapper c=new ContextWrapper(null){public String getPackageName(){return "site.zhangyue.hongguo.mobile";}};
 static JSONObject good()throws Exception{return new JSONObject("{\"channel\":\"mobile\",\"packageName\":\"site.zhangyue.hongguo.mobile\",\"versionCode\":3,\"size\":123,\"sha256\":\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\",\"certificateSha256\":\""+FamilyOta.CERT+"\",\"url\":\""+FamilyOta.BASE+"mobile/test.apk\"}");}
 static void bad(String field,Object value)throws Exception{JSONObject j=good();j.put(field,value);try{FamilyOta.validate(c,j);}catch(Exception expected){passed++;return;}throw new AssertionError("Accepted invalid "+field);}
 public static void main(String[] args)throws Exception{
  FamilyOta.validate(c,good());passed++;
  bad("channel","tv");bad("packageName","cn.hongguo.tv");bad("certificateSha256","00");bad("sha256","bad");bad("size",0);bad("size",104857601);bad("versionCode",0);
  for(String u:new String[]{"http://nas.zhangyue.site/hongguo-ota/mobile/test.apk","https://evil.example/hongguo-ota/mobile/test.apk","https://nas.zhangyue.site/hongguo-ota/tv/test.apk","https://nas.zhangyue.site:443/hongguo-ota/mobile/test.apk","https://user@nas.zhangyue.site/hongguo-ota/mobile/test.apk","https://nas.zhangyue.site/other/test.apk"})bad("url",u);
  for(String u:new String[]{"http://nas.zhangyue.site/hongguo-ota/test","https://evil.example/hongguo-ota/test"}){try{FamilyOta.open(u);throw new AssertionError("Accepted origin");}catch(java.io.IOException expected){passed++;}}
  if(!FamilyOta.digest("abc".getBytes("UTF-8")).equals("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"))throw new AssertionError("Digest");passed++;
  System.out.println("PASS "+passed+" OTA validation cases");
 }
}
