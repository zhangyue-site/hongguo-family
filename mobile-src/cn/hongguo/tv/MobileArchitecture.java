package cn.hongguo.tv;
import android.content.Context;
import java.io.IOException;
public final class MobileArchitecture {
 public static String installed(Context context) throws IOException {
  String directory=context.getApplicationInfo().nativeLibraryDir;
  if(directory.endsWith("/arm64")) return "arm64-v8a";
  if(directory.endsWith("/arm")) return "armeabi-v7a";
  throw new IOException("不支持的安装架构: "+directory);
 }
}
