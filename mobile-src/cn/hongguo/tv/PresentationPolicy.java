package cn.hongguo.tv;

/** Device/input policy and contain sizing; independent of Android for regression tests. */
public final class PresentationPolicy {
 public static boolean television(String mode, boolean leanback, boolean touch) {
  return "tv".equals(mode) || (!"phone".equals(mode) && leanback);
 }
 public static int columns(int width, boolean tv) {
  return Math.max(2, Math.min(tv ? 7 : 6, (width - 32) / (tv ? 164 : 156)));
 }
 public static int[] fit(int width, int height, int videoWidth, int videoHeight) {
  width=Math.max(1,width); height=Math.max(1,height);
  if(videoWidth<=0 || videoHeight<=0) return new int[]{width,height};
  double scale=Math.min((double)width/videoWidth,(double)height/videoHeight);
  return new int[]{Math.max(1,(int)Math.round(videoWidth*scale)),Math.max(1,(int)Math.round(videoHeight*scale))};
 }
}
