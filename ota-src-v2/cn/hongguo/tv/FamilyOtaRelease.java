package cn.hongguo.tv;

import org.json.JSONObject;

/** Validated view of one channel's latest.json. Same checks as the original
 *  UpdateRelease: manifest completeness, size cap, hash shape, origin pinning. */
public final class FamilyOtaRelease {
 static final long MAX_APK = 64L*1024*1024;
 public final String channel;
 public final String packageName;
 public final long versionCode, bytes;
 public final String versionName, sha256, certificate, notes, url;

 FamilyOtaRelease(JSONObject j, String channel, String expectPkg, String host) throws Exception {
  this.channel = channel;
  this.packageName = expectPkg;
  if(!channel.equals(j.optString("channel"))) throw new Exception("更新渠道不匹配");
  if(!expectPkg.equals(j.optString("packageName"))) throw new Exception("更新包名不匹配");
  this.versionCode = j.getLong("versionCode");
  this.versionName = j.optString("versionName","");
  this.certificate = j.optString("certificateSha256","");
  this.sha256 = j.optString("sha256","");
  this.bytes = j.optLong("size",-1);
  this.notes = clean(j.optString("notes","应用更新"));
  this.url = j.optString("url","");
  if(versionCode < 1 || versionName.length()==0 || versionName.length()>32
    || !sha256.matches("[0-9a-f]{64}") || bytes < 1 || bytes > MAX_APK)
   throw new Exception("更新清单无效");
  java.net.URL u = new java.net.URL(url);
  java.net.URL root = new java.net.URL(FamilyOta.BASE);
  if(!"https".equals(u.getProtocol()) || !host.equals(u.getHost()) || u.getPort()!=-1
    || u.getUserInfo()!=null || !u.getPath().startsWith(root.getPath()+channel+"/"))
   throw new Exception("下载路径不属于当前渠道");
  if(!certificate.equalsIgnoreCase(FamilyOta.CERT)) throw new Exception("更新渠道或签名不匹配");
 }

 static String clean(String s) {
  if(s == null) return "";
  s = s.replaceAll("[\\p{Cntrl}&&[^\\n\\t]]","").trim();
  return s.length() > 1200 ? s.substring(0,1200)+"…" : s;
 }

 String saved() throws Exception {
  return new JSONObject()
   .put("channel",channel).put("packageName",packageName).put("versionCode",versionCode).put("versionName",versionName)
   .put("sha256",sha256).put("size",bytes).put("notes",notes)
   .put("certificateSha256",certificate).put("url",url).toString();
 }

 static FamilyOtaRelease restore(String s) throws Exception {
  if(s == null || s.length() > 8192) throw new Exception("bad");
  JSONObject j = new JSONObject(s);
  if(!j.has("size") && j.has("bytes"))j.put("size",j.getLong("bytes"));
  if(!j.has("certificateSha256") && j.has("certificate"))j.put("certificateSha256",j.getString("certificate"));
  if(!j.has("packageName") && ("mobile".equals(j.optString("channel"))||"tv".equals(j.optString("channel"))))j.put("packageName","site.zhangyue.hongguo."+j.optString("channel"));
  FamilyOtaRelease r = new FamilyOtaRelease(j, j.optString("channel"), j.optString("packageName"),
   new java.net.URL(FamilyOta.BASE).getHost());
  return r;
 }
}
