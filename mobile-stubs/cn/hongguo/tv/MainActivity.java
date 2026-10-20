package cn.hongguo.tv;
import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ImageView;
import android.widget.Button;
import org.json.JSONArray;
import org.json.JSONObject;
// Compile-only API stub mirroring the package-visible surface of the original
// MainActivity (smali). Same package + same member signatures so javac emits
// references that resolve against the real class at runtime. The build dexes
// adapter code but EXCLUDES every MainActivity*.class produced from this file.
public class MainActivity extends Activity {
    public android.widget.FrameLayout host;
    public java.util.ArrayDeque back;
    public android.widget.FrameLayout playback;
    public LinearLayout chrome;
    public android.view.SurfaceView surface;
    public android.media.MediaPlayer player;
    public JSONObject current;
    public JSONArray episodes;
    public int ep;
    public int episode;
    int videoWidth,videoHeight;
    TextView status,clock;
    Button pauseButton,nextButton,rateButton;
    android.widget.SeekBar seek;
    Catalog catalog;
    MemoryProfile memory;
    public boolean controlsVisible;
    boolean prepared;
    public Screen screen;
    public android.os.Handler ui;
    android.content.SharedPreferences prefs;
    volatile int generation;
    class Screen { public View view; public String name; public View focus; public Runnable onRestore;
        Screen(View v, String n) {} }
    class PageUi { public LinearLayout rail, body; public View top, activeRail, content; public TextView heading; public String section; }
    interface Done { void run(JSONObject data) throws Exception; }
    // UI scaffolding
    public LinearLayout shell(String title) { return null; }
    void renderCards(LinearLayout host, JSONArray data, View focus, int offset) {}
    void renderCards(LinearLayout host, JSONArray data, View focus) {}
    public int dp(float value) { return 0; }
    public void show(View view, String title, View focus, boolean push) {}
    public Button button(String label, Runnable action, boolean primary) { return null; }
    public TextView text(String label, int size, int style) { return null; }
    public JSONObject bucket(String key) { return null; }
    void request(String path, TextView status, Done done) {}
    void sourceFailure(android.media.MediaPlayer player, Exception error) {}
    void sourceFailure(android.media.MediaPlayer player) {}
    // playback engine entry points
    void startPlayer(JSONObject series, JSONArray eps, int index, long positionMs) {}
    void playEpisode(int index, long positionMs) {}
    void stopPlayer() {}
    void prepareSource(android.media.MediaPlayer p, int episodeIndex) {}
    void recommendNext(JSONObject finished) {}
    void resumePausedPlayer() {}
    void cancelMedia() {}
    void saveProgress(boolean keep) {}
    void saveProgress() {}
    void openPlayerControls() {}
    void togglePause() {}
    void seekBy(int seconds) {}
    int qualityCeiling() { return 0; }
    void fitVideo(int w,int h) {}
    // navigation / screens
    void detail(JSONObject item) {}
    void home(String a, String b) {}
    void home(String a, String b, boolean c) {}
    void home(String a, String b, boolean c, boolean d) {}
    void categories() {}
    void search() {}
    void searchFor(String q) {}
    void manageSaved(String which) {}
    void manageSaved(String which, int sub) {}
    void settings() {}
    void chooseSection(String s) {}
    void restore() {}
    public void feedCatalog(java.util.ArrayList<JSONObject> items) {}
    View playerOverlay() { return null; }
    void episodePage(JSONObject series, JSONArray eps, int index) {}
    void playerEpisodes() {}
    void playerSettings() {}
    void changeQuality(int q) {}
    void maybePrefetch(int a, int b) {}
    int latestEpisode(JSONObject s, JSONArray e) { return 0; }
    void resumeSeries(JSONObject s, JSONArray e) {}
    boolean learnRecommendations() { return false; }
    public boolean dispatchKeyEvent(android.view.KeyEvent e) { return false; }
    public void onBackPressed() {}
    public void onCreate(android.os.Bundle b) {}
    protected void onPause() {}
    protected void onResume() {}
    public void onWindowFocusChanged(boolean has) {}
    public void onLowMemory() {}
    public void onTrimMemory(int level) {}
    // static helpers referenced by the adapter
    public static String q(String value) { return value; }
    static final int INK=0, MUTED=0, PINK=0;
    java.util.concurrent.ThreadPoolExecutor io, mediaIo, coverIo;
    android.util.LruCache covers;
    void loadCover(String url, ImageView view) {}
    int mediaGeneration;

// v2 OTA additions: package-private scaffolding used by FamilyOta.UpdatePage
LinearLayout body(LinearLayout page) { return null; }
int ink() { return 0; }
int muted() { return 0; }
LinearLayout row() { return null; }
LinearLayout column() { return null; }
void addButton(LinearLayout row, Button button) {}
}

// Compile-only signatures. Runtime implementations remain in the original dex.
class Catalog {
 static class Result { org.json.JSONArray items; boolean stale,fromCache; }
 Result browsePage(String genre,String mode,boolean refresh) throws Exception {return null;}
 Result searchPage(String query,String mode,boolean refresh) throws Exception {return null;}
 android.graphics.Bitmap cover(String id,MemoryProfile memory)throws Exception{return null;}
}
class PublicCategories { static String[] genres(String mode){return null;} }
class MemoryProfile {}
