package cn.hongguo.tv;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONTokener;
/** Public SSR search fallback when the older app search API returns an empty body. */
final class PublicSearch {
 static JSONArray search(String query,String mode)throws Exception {
  JSONArray rows=fetch(query,mode);if(rows.length()>0)return rows;
  StringBuilder alternate=new StringBuilder();String digits="零一二三四五六七八九";
  for(int i=0;i<query.length();i++){char c=query.charAt(i);alternate.append(c>='0'&&c<='9'?digits.charAt(c-'0'):c);}
  return query.equals(alternate.toString())?rows:fetch(alternate.toString(),mode);
 }
 private static JSONArray fetch(String query,String mode)throws Exception {
  HttpURLConnection h=(HttpURLConnection)new URL("https://hongguoduanju.com/search/"+URLEncoder.encode(query,"UTF-8").replace("+","%20")).openConnection();
  h.setConnectTimeout(10000);h.setReadTimeout(20000);h.setInstanceFollowRedirects(false);h.setRequestProperty("User-Agent","HongguoTV/0.8.0");
  try{if(h.getResponseCode()!=200)throw new Exception("公开搜索暂不可用");ByteArrayOutputStream bytes=new ByteArrayOutputStream();
   try(InputStream in=h.getInputStream()){byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1){if(Thread.currentThread().isInterrupted())throw new java.io.InterruptedIOException();if(bytes.size()+n>2097152)throw new Exception("搜索返回过大");bytes.write(b,0,n);}}
   return parse(bytes.toString("UTF-8"),mode);
  }finally{h.disconnect();}
 }
 static JSONArray parse(String html,String mode)throws Exception {
  int start=html.indexOf("_ROUTER_DATA = ");if(start<0)throw new Exception("搜索格式已变化");
  JSONObject root=(JSONObject)new JSONTokener(html.substring(start+15)).nextValue();
  JSONObject loaders=root.getJSONObject("loaderData"),data=null;java.util.Iterator<String> keys=loaders.keys();
  while(keys.hasNext()){JSONObject candidate=loaders.optJSONObject(keys.next());if(candidate!=null&&candidate.has("searchList")){data=candidate;break;}}
  if(data==null||!data.optBoolean("isSuccess"))throw new Exception("搜索暂不可用");
  JSONArray result=new JSONArray(),rows=data.getJSONArray("searchList");
  for(int i=0;i<rows.length();i++){
   JSONObject v=rows.getJSONObject(i).optJSONObject("video_data");if(v==null)continue;
   String id=v.optString("series_id"),type=v.optString("genre");if(!id.matches("[0-9]{8,24}"))continue;
   if(!"203".equals(type)&&!"205".equals(type))continue;
   if("short".equals(mode)&&!"203".equals(type))continue;if("manju".equals(mode)&&!"205".equals(type))continue;
   if("ai".equals(mode))continue; // AI uses its category provider rather than guessing a genre code.
   String cover=v.optString("series_cover");
   if(!cover.matches("https://[a-zA-Z0-9.-]+\\.(byteimg\\.com|fqnovelpic\\.com|novelfmpic\\.com)/.*"))cover="";
   result.put(new JSONObject().put("id",id).put("title",v.optString("series_title")).put("intro",v.optString("series_intro")).put("count",v.optInt("episode_cnt")).put("cover",cover).put("catalog_mode","205".equals(type)?"manju":"short"));
  }return result;
 }
}
