from pathlib import Path
import subprocess, shutil, re, zipfile, json
R=Path(__file__).resolve().parent; S=Path.home()/'Library/Android/sdk';T=S/'build-tools/35.0.0';B=R/'family-build'; B.mkdir(exist_ok=True)
C=json.loads((R/'release-config.json').read_text());VC=C['versionCode'];VN=C['versionName']
assert isinstance(VC,int) and VC>0 and re.fullmatch(r'[a-zA-Z0-9._-]+',VN)
def run(*a):subprocess.run([str(x) for x in a],check=True)
classes=B/'classes';shutil.rmtree(classes,ignore_errors=True);classes.mkdir()
mobile=(R/'mobile-src/cn/hongguo/tv/MobileActivity.java').read_text().replace('super.onCreate(saved);','super.onCreate(saved);\n  FamilyOta.check(this,false);')
(B/'MobileActivity.java').write_text(mobile)
run('javac','-source','8','-target','8','-cp',S/'platforms/android-35/android.jar','-d',classes,R/'mobile-stubs/cn/hongguo/tv/MainActivity.java',B/'MobileActivity.java',R/'mobile-src/cn/hongguo/tv/MobileArchitecture.java',*sorted((R/'ota-src/cn/hongguo/tv').glob('*.java')))
dex=B/'dex';dex.mkdir(exist_ok=True)
run(T/'d8','--min-api','21','--lib',S/'platforms/android-35/android.jar','--classpath',classes,'--output',dex,*[f for f in classes.rglob('*.class') if f.name!='MainActivity.class'])
for channel in ('mobile','tv'):
 project=B/channel;shutil.rmtree(project,ignore_errors=True)
 shutil.copytree(R/'android/mobile-decoded',project,ignore=shutil.ignore_patterns('build','dist'))
 manifest=project/'AndroidManifest.xml';s=manifest.read_text().replace('cn.yue.hongguo.mobile',f'site.zhangyue.hongguo.{channel}').replace('红果·手机适配','红果·乐天'+('手机' if channel=='mobile' else '盒子'))
 s=s.replace('<application ','<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES"/>\n    <application ',1)
 s=s.replace('<activity ',f'<provider android:name="cn.hongguo.tv.FamilyOta$Provider" android:authorities="site.zhangyue.hongguo.{channel}.family-update" android:exported="false" android:grantUriPermissions="true"/>\n        <activity ',1)
 if channel=='tv':s=s.replace('cn.hongguo.tv.MobileActivity','cn.hongguo.tv.FamilyTvActivity').replace('android:screenOrientation="portrait"','android:screenOrientation="landscape"').replace('<category android:name="android.intent.category.LAUNCHER"/>','<category android:name="android.intent.category.LAUNCHER"/>\n                <category android:name="android.intent.category.LEANBACK_LAUNCHER"/>')
 manifest.write_text(s)
 y=project/'apktool.yml';s=y.read_text();s=re.sub(r'  versionCode: .*',f'  versionCode: {VC}',s);s=re.sub(r'  versionName: .*',f'  versionName: {VN}',s);y.write_text(s)
 smali=project/'smali/cn/hongguo/tv/TvUpdater.smali';s=smali.read_text();s=re.sub(r'\.method check\(Z\)V.*?\.end method','''.method check(Z)V
    .locals 1
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;
    invoke-static {v0, p1}, Lcn/hongguo/tv/FamilyOta;->check(Landroid/app/Activity;Z)V
    return-void
.end method''',s,flags=re.S);smali.write_text(s)
 origin=project/'smali/cn/hongguo/tv/AppOrigin.smali';origin.write_text(origin.read_text().replace('个人手机适配版','个人家族适配版'))
 (project/'assets/FAMILY-OTA-NOTICE.txt').write_text('个人适配测试版，非红果官方。基于第三方渠道有数安卓端，保留原许可和来源说明。\n手机与盒子采用独立包名与乐天B5家族签名；不覆盖旧个人签名版或原作者包。\nOTA入口：https://nas.zhangyue.site/hongguo-ota/'+channel+'/latest.json\n尚未完成实体ARM设备播放与遥控验收。\n')
 unsigned=B/f'{channel}-unsigned.apk';run('java','-jar',R/'apktool.jar','b',project,'-o',unsigned)
 with zipfile.ZipFile(unsigned,'a') as z:
  z.write(dex/'classes.dex','classes2.dex')
  with zipfile.ZipFile(R/'android/HongguoTV-0.5.8-arm32.apk') as a:
   for name in a.namelist():
    if name.startswith('lib/'):z.writestr(name,a.read(name))
 run(T/'zipalign','-f','-P','16','4',unsigned,B/f'Hongguo-{channel.title()}-{VN}-arm-universal-unsigned.apk')
