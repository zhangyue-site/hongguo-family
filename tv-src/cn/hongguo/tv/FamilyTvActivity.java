package cn.hongguo.tv;
/** Backward compatible component name, now uses the shared responsive UI. */
public class FamilyTvActivity extends UnifiedActivity {
 public void playSeries(org.json.JSONObject item){fetchEpisodes(item,false);}
}
