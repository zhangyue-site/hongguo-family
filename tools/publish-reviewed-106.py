"""Publish the reviewed signed 0.8.4 artifacts; no signing or server reconfiguration."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess
root=Path('/opt/hongguo-analysis/family-ota')
stage=Path('/opt/hongguo-analysis/audit-20261020/staging-0.8.4/public')
backup=Path('/opt/hongguo-analysis/audit-20261020/public-before-0.8.4')
cert='b5aaac0eb0369165d34ee3bae1cddd637eaa2bc3566adf9e3f2dc2f5a1a473e4'
checked=[]
for channel in ('mobile','tv'):
 j=json.loads((stage/channel/'latest.json').read_text())
 assert j['versionCode']==23 and j['versionName']=='0.8.4-unified'
 assert j['packageName']=='site.zhangyue.hongguo.'+channel and j['certificateSha256']==cert
 p=stage/channel/Path(j['url']).name
 assert p.stat().st_size==j['size'] and hashlib.sha256(p.read_bytes()).hexdigest()==j['sha256']
 output=subprocess.check_output(['/opt/android-sdk/build-tools/35.0.0/apksigner','verify','--print-certs',str(p)],text=True)
 assert cert in output
 old=json.loads((root/'public'/channel/'latest.json').read_text())
 assert old['versionCode']<23 or (old['versionCode']==23 and old['sha256']==j['sha256'])
 checked.append((channel,p,j))
# All artifacts are validated before making either channel visible.
for channel,p,j in checked:
 target=root/'public'/channel/p.name
 if target.exists():assert hashlib.sha256(target.read_bytes()).hexdigest()==j['sha256']
 else:shutil.copy2(p,target)
 os.chmod(target,0o644)
for name in ('index.html','mobile/latest.json','tv/latest.json'):
 source=root/'public'/name;dest=backup/name;dest.parent.mkdir(parents=True,exist_ok=True)
 if source.exists() and not dest.exists():shutil.copy2(source,dest)
for channel,p,j in checked:
 target=root/'public'/channel/'latest.json';tmp=target.with_suffix('.json.new')
 tmp.write_text(json.dumps(j,ensure_ascii=False,indent=2)+'\n');os.chmod(tmp,0o644);os.replace(tmp,target)
target=root/'public/index.html';tmp=target.with_suffix('.html.new');shutil.copy2(stage/'index.html',tmp);os.chmod(tmp,0o644);os.replace(tmp,target)
for channel,p,j in checked:print(channel,j['versionName'],j['sha256'],'published')
print('public manifests and download page updated; old APKs and manifest backups retained')
