package cn.hongguo.tv;
public final class PresentationPolicyTest {
 static void check(boolean ok, String label) { if(!ok) throw new AssertionError(label); }
 public static void main(String[] args) {
  check(PresentationPolicy.television("auto",true,false),"TV auto");
  check(PresentationPolicy.television("tv",false,true),"manual projector");
  check(!PresentationPolicy.television("phone",true,false),"manual touch");
  check(!PresentationPolicy.television("auto",false,true),"wide touch tablet is not TV");
  check(PresentationPolicy.columns(360,false)==2,"small phone columns");
  check(PresentationPolicy.columns(800,false)>=4,"tablet grid");
  int[] portrait=PresentationPolicy.fit(1280,720,720,1280);
  check(portrait[0]==405 && portrait[1]==720,"portrait video on projector contains full frame");
  int[] landscape=PresentationPolicy.fit(360,720,1920,1080);
  check(landscape[0]==360 && landscape[1]==203,"landscape video on phone contains full frame");
  check(PresentationPolicy.fit(0,0,720,1280)[0]>=1,"zero layout never collapses surface");
  System.out.println("PresentationPolicy: 9 behavior checks passed");
 }
}
