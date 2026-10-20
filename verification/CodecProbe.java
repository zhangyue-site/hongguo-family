package cn.hongguo.tv;
public class CodecProbe {
 public static void main(String[] args)throws Exception {
  for(android.media.MediaCodecInfo c:new android.media.MediaCodecList(0).getCodecInfos())if(!c.isEncoder())for(String type:c.getSupportedTypes())if(type.startsWith("video/"))System.out.println(c.getName()+" "+type+" 360x640="+c.getCapabilitiesForType(type).getVideoCapabilities().isSizeSupported(360,640));
 }
}
