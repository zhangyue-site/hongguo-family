import pathlib,json,urllib.request,hashlib,subprocess,os
root=pathlib.Path('/www/wwwroot/download-hub')
state=pathlib.Path('/var/lib/download-publisher/hongguo-0.8.3');state.mkdir(parents=True,exist_ok=True)
for channel,slug in [('mobile','hongguo'),('tv','hongguo-tv')]:
 m=json.load(urllib.request.urlopen('https://nas.zhangyue.site/hongguo-ota/'+channel+'/latest.json',timeout=30))
 assert m['versionCode']==22 and m['versionName']=='0.8.3-unified'
 rel='apps/'+slug+'/releases/0.8.3/'+slug+'-0.8.3.apk'
 dest=root/rel;dest.parent.mkdir(parents=True,exist_ok=True)
 data=urllib.request.urlopen(m['url'],timeout=120).read()
 assert len(data)==m['size'] and hashlib.sha256(data).hexdigest()==m['sha256']
 if dest.exists():assert dest.read_bytes()==data
 else:
  tmp=dest.with_suffix('.uploading');tmp.write_bytes(data);tmp.chmod(0o644);os.replace(tmp,dest)
 c=dict(slug=slug,package=m['packageName'],versionCode=22,versionName=m['versionName'],url='https://d.zhangyue.site/'+rel,sha256=m['sha256'],bytes=m['size'],minSdk=21,notes=m['notes'],updated='2026-10-20')
 path=state/(slug+'-candidate.json');path.write_text(json.dumps(c,ensure_ascii=False))
 db=json.loads((root/'apps/apps.json').read_text());old=next(x for x in db['apps'] if x['slug']==slug)
 if old['versionCode']==22:
  assert all(old[k]==c[k] for k in ['package','versionCode','versionName','url','sha256','bytes']);print(slug,'already matched');continue
 args=['python3','/opt/release-tools/store_catalog.py',str(root),'--candidate-json',str(path)]
 print(subprocess.check_output(args,text=True));print(subprocess.check_output(args+['--apply'],text=True))
print('Both catalog entries updated; existing OTA origin retained')
