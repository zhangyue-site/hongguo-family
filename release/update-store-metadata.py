import pathlib,json,fcntl,shutil,os
root=pathlib.Path('/www/wwwroot/download-hub');state=pathlib.Path('/var/lib/download-publisher/hongguo-0.8.0')
with open('/var/lib/download-publisher/publish.lock','a') as lock:
 fcntl.flock(lock,fcntl.LOCK_EX);p=root/'apps/apps.json';d=json.loads(p.read_text());shutil.copy2(p,state/'before-metadata.json')
 for e in d['apps']:
  if e['slug'] not in ('hongguo','hongguo-tv'):continue
  assert e['versionCode']==19
  e['summary']='手机与投影通用，自动适配触控与遥控；支持短剧浏览、选集与继续观看。' if e['slug']=='hongguo' else '旧电视包兼容升级渠道，与手机统一版共用代码和版本；新安装推荐主包。'
  e['features']=['推荐、剧场、追剧、我的四个入口','全屏播放、选集、倍速与横竖屏适配','覆盖升级保留本地收藏与历史','应用内检查更新与观看记录导入导出']
  e['tags']=['短剧','手机与投影','家族OTA']
 tmp=p.with_suffix('.json.hg-new');tmp.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n');tmp.chmod(0o644);os.replace(tmp,p)
print('Updated only hongguo and hongguo-tv presentation metadata')
