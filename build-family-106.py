"""106 version of build-family.py (original targets macOS SDK paths).
Builds mobile+tv unsigned APKs from src-work tree. No signing here (sign-family-106.py does it).
Usage: python3 build-family-106.py [--family]
  default: fast mode - reuse existing apktool project dirs if present, skip smali/lib repack
  --family: also inject FamilyOta OTA hook (full first build must use this)
"""
import subprocess, shutil, re, zipfile, json, sys, os
from pathlib import Path

R = Path(__file__).resolve().parent
SDK = Path(os.environ.get('ANDROID_SDK_ROOT') or os.environ.get('ANDROID_HOME') or '/opt/android-sdk')
T = SDK / 'build-tools/35.0.0'
AJ = SDK / 'platforms' / ('android-' + os.environ.get('HONGGUO_ANDROID_API', '35')) / 'android.jar'
B = R / 'family-build'
B.mkdir(exist_ok=True)
C = json.loads((R / 'release-config.json').read_text())
VC, VN = C['versionCode'], C['versionName']
assert isinstance(VC, int) and VC > 0 and re.fullmatch(r'[a-zA-Z0-9._-]+', VN)
FAMILY = '--family' in sys.argv

def run(*a):
    print('+', ' '.join(str(x) for x in a))
    subprocess.run([str(x) for x in a], check=True)

# ---------- compile java adapter sources ----------
classes = B / 'classes'
shutil.rmtree(classes, ignore_errors=True)
classes.mkdir(parents=True)
mobile = (R / 'mobile-src/cn/hongguo/tv/MobileActivity.java').read_text()
(B / 'MobileActivity.java').write_text(mobile)
mobile_ota = B / 'MobileActivity.java'
import glob as _glob
sources = [
    R / 'mobile-src/cn/hongguo/tv/MobileArchitecture.java',
    R / 'mobile-src/cn/hongguo/tv/UnifiedActivity.java',
    R / 'mobile-src/cn/hongguo/tv/PresentationPolicy.java',
    R / 'mobile-src/cn/hongguo/tv/TransferData.java',
    R / 'mobile-src/cn/hongguo/tv/PublicSearch.java',
    mobile_ota,
] + [Path(p) for p in sorted(_glob.glob(str(R / 'tv-src/cn/hongguo/tv/FamilyTvActivity.java')))] + [Path(p) for p in sorted(_glob.glob(str(R / 'ota-src-v2/cn/hongguo/tv/*.java')))]
# FamilyOta + FamilyTvActivity must always be dexed (TvUpdater smali redirects to them)
for s in sources:
    if not Path(s).exists():
        raise SystemExit(f'missing source: {s}')

androidx_jars = [str(x) for x in sorted((R / 'libs').rglob('*.jar'))]
androidx_aar_classes = [str(x) for x in sorted((R / 'libs').rglob('classes.jar'))]
full_cp = ':'.join([str(AJ)] + androidx_jars + androidx_aar_classes)
run('javac', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', full_cp,
    '-d', classes,
    R / 'mobile-stubs/cn/hongguo/tv/MainActivity.java',   # compile-only, excluded from dex
    *sources)

dexdir = B / 'dex'
shutil.rmtree(dexdir, ignore_errors=True)
dexdir.mkdir(parents=True)
androidx_dex_inputs = []  # Responsive UI uses native Android views only.
run(T / 'd8', '--min-api', '21', '--lib', AJ, '--classpath', classes,
    '--output', dexdir,
    *[f for f in classes.rglob('*.class')
      if not f.name.startswith(('MainActivity','Catalog','PublicCategories','MemoryProfile'))],
    *androidx_dex_inputs)


# ---------- OTA v2 smali wiring ----------
def wire_ota_v2(project):
    """Forward the original lifecycle hooks to FamilyOta static entry points.
    The old TvUpdater.check() body is replaced by a redirect (settings page and
    any other caller keep working), and MainActivity gains: attach-on-create,
    resume/pause/destroy/focus/screen forwarding, onActivityResult forwarding.
    All patches are idempotent: applying twice must not duplicate code."""
    sm = project / 'smali/cn/hongguo/tv'

    # (a) TvUpdater.check(Z) -> FamilyOta.check(activity, manual)
    f = sm / 'TvUpdater.smali'
    s = f.read_text()
    s2 = re.sub(r'\.method check\(Z\)V.*?\.end method',
        """.method check(Z)V
    .locals 1
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater;->a:Lcn/hongguo/tv/MainActivity;
    invoke-static {v0, p1}, Lcn/hongguo/tv/FamilyOta;->check(Landroid/app/Activity;Z)V
    return-void
.end method""", s, flags=re.S)
    f.write_text(s2)

    # (b) MainActivity.onCreate: after `new TvUpdater` add FamilyOta.attach(this)
    f = sm / 'MainActivity.smali'
    s = f.read_text()
    anchor = "iput-object p1, p0, Lcn/hongguo/tv/MainActivity;->updates:Lcn/hongguo/tv/TvUpdater;"
    add = anchor + """

    invoke-static {p0}, Lcn/hongguo/tv/FamilyOta;->attach(Landroid/app/Activity;)V"""
    if 'FamilyOta;->attach' not in s:
        assert s.count(anchor) >= 1, 'onCreate anchor missing'
        s = s.replace(anchor, add, 1)

    # (c) onPause: after updates.pause() add FamilyOta.pause()
    pair = """invoke-virtual {v0}, Lcn/hongguo/tv/TvUpdater;->pause()V"""
    add = pair + """

    invoke-static {}, Lcn/hongguo/tv/FamilyOta;->pause()V"""
    if 'FamilyOta;->pause' not in s:
        assert pair in s, 'onPause anchor missing'
        s = s.replace(pair, add, 1)

    # (d) onResume: after updates.resume() add FamilyOta.resume()
    pair = """invoke-virtual {v0}, Lcn/hongguo/tv/TvUpdater;->resume()V"""
    add = pair + """

    invoke-static {}, Lcn/hongguo/tv/FamilyOta;->resume()V"""
    if 'FamilyOta;->resume()V' not in s:
        assert s.count(pair) >= 1, 'onResume anchor missing'
        s = s.replace(pair, add, 1)

    # (e) onDestroy: after updates.destroy() add FamilyOta.destroy()
    pair = """invoke-virtual {v0}, Lcn/hongguo/tv/TvUpdater;->destroy()V"""
    add = pair + """

    invoke-static {}, Lcn/hongguo/tv/FamilyOta;->destroy()V"""
    if 'FamilyOta;->destroy' not in s:
        assert pair in s, 'onDestroy anchor missing'
        s = s.replace(pair, add, 1)

    # (f) onWindowFocusChanged: after updates.maybeRemind() add FamilyOta.focus()
    pair = """invoke-virtual {p1}, Lcn/hongguo/tv/TvUpdater;->maybeRemind()V"""
    add = pair + """

    invoke-static {}, Lcn/hongguo/tv/FamilyOta;->focus()V"""
    if 'FamilyOta;->focus' not in s:
        assert pair in s, 'onWindowFocusChanged anchor missing'
        s = s.replace(pair, add, 1)

    # (g) restore(): after updates.resume() there add FamilyOta.resume() too
    pair = """invoke-virtual {v1}, Lcn/hongguo/tv/TvUpdater;->resume()V"""
    add = pair + """

    invoke-static {}, Lcn/hongguo/tv/FamilyOta;->resume()V"""
    if s.count('FamilyOta;->resume()V') < 2 and pair in s:
        s = s.replace(pair, add, 1)

    # (h) show(): after updates.resume() add FamilyOta.screenChanged()
    pair = """invoke-virtual {p2}, Lcn/hongguo/tv/TvUpdater;->resume()V"""
    add = pair + """

    invoke-static {}, Lcn/hongguo/tv/FamilyOta;->screenChanged()V"""
    if 'FamilyOta;->screenChanged' not in s:
        assert pair in s, 'show() anchor missing'
        s = s.replace(pair, add, 1)

    # (i) onActivityResult: after updates.activityResult(p1,p2) add FamilyOta.activityResult
    pair = """invoke-virtual {p3, p1, p2}, Lcn/hongguo/tv/TvUpdater;->activityResult(II)V"""
    add = pair + """

    invoke-static {p1, p2}, Lcn/hongguo/tv/FamilyOta;->activityResult(II)V"""
    if 'FamilyOta;->activityResult' not in s:
        assert pair in s, 'onActivityResult anchor missing'
        s = s.replace(pair, add, 1)

    # (j) startPlayer: FamilyOta.pause() before playback starts
    pair = """invoke-virtual {v2}, Lcn/hongguo/tv/TvUpdater;->pause()V"""
    add = pair + """

    invoke-static {}, Lcn/hongguo/tv/FamilyOta;->pause()V"""
    if s.count('FamilyOta;->pause()V') < 2 and pair in s:
        s = s.replace(pair, add, 1)

    # Original author's signer warning is inapplicable to our verified family certificate.
    # Unknown signatures still follow the original warning; attribution stays in About.
    warning = '.method synthetic lambda$onCreate$4$cn-hongguo-tv-MainActivity(I)V\n    .locals 2'
    if ':family_origin_check' not in s:
        assert warning in s
        s=s.replace(warning, warning + """
    invoke-static {p0}, Lcn/hongguo/tv/FamilyOta;->knownFamily(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :family_origin_check
    return-void
    :family_origin_check
""",1)
    # Remove the loading cover only when MediaPlayer reports the first rendered frame.
    video_info='.method synthetic lambda$playEpisode$90$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;II)Z\n    .locals 5'
    if 'UnifiedActivity;->onVideoInfo' not in s:
        assert video_info in s
        s=s.replace(video_info,video_info+'\n    invoke-static {p0, p1, p2}, Lcn/hongguo/tv/UnifiedActivity;->onVideoInfo(Lcn/hongguo/tv/MainActivity;Landroid/media/MediaPlayer;I)V\n',1)
    f.write_text(s)
    print('[wire] OTA v2 lifecycle hooks installed')


# ---------- package two channels ----------
SMALI_TAP = '''.method public rankedTap(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 2
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed;->a:Lcn/hongguo/tv/MainActivity;
    instance-of v1, v0, Lcn/hongguo/tv/FeedActivity;
    if-eqz v1, :cond_0
    check-cast v0, Lcn/hongguo/tv/FeedActivity;
    invoke-virtual {v0, p1}, Lcn/hongguo/tv/FeedActivity;->feedCatalog(Ljava/util/ArrayList;)V
    :cond_0
    return-object p1
.end method
'''
for channel in ('mobile', 'tv'):
    project = B / channel
    if FAMILY or not (project / 'apktool.yml').exists():
        shutil.rmtree(project, ignore_errors=True)
        shutil.copytree(R / 'android/mobile-decoded', project,
                        ignore=shutil.ignore_patterns('build', 'dist'))
        manifest = project / 'AndroidManifest.xml'
        s = manifest.read_text()
        s = s.replace('cn.yue.hongguo.mobile', f'site.zhangyue.hongguo.{channel}')
        s = s.replace('红果·手机适配', '红果短剧' if channel == 'mobile' else '红果短剧电视版')
        s = s.replace('<application ',
                      '<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES"/>\n    <application ', 1)
        s = s.replace('<activity ',
            f'<provider android:name="cn.hongguo.tv.FamilyOtaProvider" '
            f'android:authorities="site.zhangyue.hongguo.{channel}.family-update" '
            f'android:exported="false" android:grantUriPermissions="true"/>\n        <activity ', 1)
        # One responsive Activity handles BOTH launcher categories and devices.
        s = s.replace('cn.hongguo.tv.MobileActivity', 'cn.hongguo.tv.UnifiedActivity')
        s = s.replace('android:screenOrientation="portrait"', 'android:screenOrientation="unspecified"')
        s = s.replace('<category android:name="android.intent.category.LAUNCHER"/>',
            '<category android:name="android.intent.category.LAUNCHER"/>\n                <category android:name="android.intent.category.LEANBACK_LAUNCHER"/>')
        s = s.replace('</application>',
            '<activity android:name="cn.hongguo.tv.MobileActivity" android:exported="true" android:configChanges="keyboardHidden|orientation|screenSize|smallestScreenSize|screenLayout|density|uiMode|fontScale"/>\n'
            '<activity android:name="cn.hongguo.tv.FamilyTvActivity" android:exported="true" android:configChanges="keyboardHidden|orientation|screenSize|smallestScreenSize|screenLayout|density|uiMode|fontScale"/>\n'
            '</application>')
        manifest.write_text(s)
        y = project / 'apktool.yml'
        s = y.read_text()
        s = re.sub(r'  versionCode: .*', f'  versionCode: {VC}', s)
        s = re.sub(r'  versionName: .*', f'  versionName: {VN}', s)
        y.write_text(s)
        wire_ota_v2(project)
        origin = project / 'smali/cn/hongguo/tv/AppOrigin.smali'
        origin.write_text(origin.read_text().replace('个人手机适配版', '个人家族适配版'))
        (project / 'assets/FAMILY-OTA-NOTICE.txt').write_text(
            '个人适配测试版，非红果官方。基于第三方渠道有数安卓端，保留原许可和来源说明。\n'
            '手机与盒子采用独立包名与乐天B5家族签名；不覆盖旧个人签名版或原作者包。\n'
            f'OTA入口：https://nas.zhangyue.site/hongguo-ota/{channel}/latest.json\n'
            '尚未完成实体ARM设备播放与遥控验收。\n')
    # merge classes2.dex (adapter + OTA) into apktool output
    built = B / f'{channel}-apktool.apk'
    template = B / f'template-{channel}.apk'
    if template.exists() and not FAMILY:
        # fast path: resources+smali unchanged since last full build; skip apktool
        shutil.copyfile(template, built)
        print(f'[fast] {channel}: reuse template, only classes2.dex changes')
    else:
        run('java', '-jar', R / 'apktool.jar', 'b', project, '-o', built)
        shutil.copyfile(built, template)
    with zipfile.ZipFile(built) as z:
        names = z.namelist()
    with zipfile.ZipFile(built, 'a') as z:
        z.write(B / 'dex' / 'classes.dex', 'classes2.dex')
        with zipfile.ZipFile(R / 'android/HongguoTV-0.5.8-arm32.apk') as a:
            for name in a.namelist():
                if name.startswith('lib/'):
                    z.writestr(name, a.read(name))
    aligned = B / f'Hongguo-{channel.title()}-{VN}-arm-universal-unsigned.apk'
    run(T / 'zipalign', '-f', '-P', '16', '4', built, aligned)
    print(f'[OK] {aligned} {aligned.stat().st_size} bytes')
print('VC=%d VN=%s' % (VC, VN))
