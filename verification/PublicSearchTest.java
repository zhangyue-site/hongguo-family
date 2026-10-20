package cn.hongguo.tv;
import org.json.JSONArray;
import org.json.JSONObject;
public class PublicSearchTest {
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 public static void main(String[] args)throws Exception {
  JSONArray entries=new JSONArray();
  entries.put(new JSONObject().put("video_data",new JSONObject().put("series_id","7694648775943392280").put("series_title","重生八五，靠购物返现系统赢麻了").put("genre","205")));
  entries.put(new JSONObject().put("video_data",new JSONObject().put("series_id","7694653385668037657").put("series_title","王妈").put("genre","203")));
  entries.put(new JSONObject().put("video_data",new JSONObject().put("series_id","7694653385668037658").put("series_title","unsupported").put("genre","999")));
  String html="_ROUTER_DATA = "+new JSONObject().put("loaderData",new JSONObject().put("search",new JSONObject().put("isSuccess",true).put("searchList",entries))).toString();
  JSONArray all=PublicSearch.parse(html,"all");
  check(all.length()==2,"global search must exclude unsupported genres");
  check(all.getJSONObject(0).getString("catalog_mode").equals("manju"),"comic search result keeps its real playback category");
  check(all.getJSONObject(1).getString("catalog_mode").equals("short"),"short result keeps its category");
  check(PublicSearch.parse(html,"short").length()==1,"explicit category still filters");
  if(args.length>0){JSONArray live=PublicSearch.search("重生85","all");boolean found=false;for(int i=0;i<live.length();i++)found|=live.getJSONObject(i).optString("id").equals("7694648775943392280");check(found,"live shorthand search finds requested series");}
  System.out.println("PublicSearch: cross-category contract passed");
 }
}
