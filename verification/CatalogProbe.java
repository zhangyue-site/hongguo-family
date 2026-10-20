package cn.hongguo.tv;
import java.io.File;
import java.util.Map;
public class CatalogProbe {
 public static void main(String[] args)throws Exception {
  Catalog c=(Catalog)Catalog.class.getDeclaredConstructor(File.class).newInstance(new File("/data/local/tmp/hg-probe-cache.json"));
  Catalog.Result r=c.browsePage("全部","short",true);
  java.lang.reflect.Field f=Catalog.class.getDeclaredField("coverAddresses");f.setAccessible(true);
  Map covers=(Map)f.get(c);
  System.out.println("catalog items="+r.items.length()+" coverAddresses="+covers.size());
  if(!covers.isEmpty()){
   String url=(String)covers.values().iterator().next();java.net.HttpURLConnection h=(java.net.HttpURLConnection)new java.net.URL(url).openConnection();h.setConnectTimeout(10000);h.setReadTimeout(15000);System.out.println("cover HTTP="+h.getResponseCode()+" length="+h.getContentLength());h.disconnect();
  }
 }
}
