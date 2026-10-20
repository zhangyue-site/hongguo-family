package cn.hongguo.tv;
import org.json.JSONObject;
public class DataContractTest {
 static void check(boolean v,String m){if(!v)throw new AssertionError(m);}
 static JSONObject item(long updated)throws Exception{return new JSONObject().put("id","123456789012").put("title","测试剧").put("updated",updated).put("episode",2).put("position",5000);}
 public static void main(String[] args)throws Exception{
  JSONObject j=new JSONObject().put("channel","mobile").put("packageName","site.zhangyue.hongguo.mobile").put("versionCode",19).put("versionName","0.8.0-unified").put("size",1000).put("sha256",new String(new char[64]).replace('\0','a')).put("certificateSha256",FamilyOta.CERT).put("url",FamilyOta.BASE+"mobile/test.apk");
  FamilyOtaRelease r=new FamilyOtaRelease(j,"mobile","site.zhangyue.hongguo.mobile","nas.zhangyue.site");
  FamilyOtaRelease restored=FamilyOtaRelease.restore(r.saved());
  check(restored.bytes==r.bytes&&restored.sha256.equals(r.sha256),"OTA saved state roundtrip");
  JSONObject local=new JSONObject().put("123456789012",item(20));
  JSONObject older=new JSONObject().put("123456789012",item(10));
  check(TransferData.merge(local,older).getJSONObject("123456789012").getLong("updated")==20,"import keeps newer local progress");
  check(TransferData.merge(older,local).getJSONObject("123456789012").getLong("updated")==20,"import accepts newer progress");
  boolean rejected=false;try{TransferData.validateBucket(new JSONObject().put("bad",item(10)));}catch(Exception e){rejected=true;}
  check(rejected,"invalid IDs rejected before writing");
  if(args.length>0){String html=new String(java.nio.file.Files.readAllBytes(java.nio.file.Paths.get(args[0])),"UTF-8");check(PublicSearch.parse(html,"short").length()>0,"public search parses real short-drama fixture");check(PublicSearch.parse(html,"manju").length()>0,"public search parses comic fixture");}
  System.out.println("DataContract: OTA roundtrip + migration checks passed");
 }
}
