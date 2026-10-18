"""Run only on 106. Private signing credentials remain in existing vault."""
from pathlib import Path
import subprocess,os,re,hashlib,json
root=Path('/opt/hongguo-analysis/family-ota')
C=json.loads((root/'release-config.json').read_text());VC=C['versionCode'];VN=C['versionName']
assert isinstance(VC,int) and VC>0 and re.fullmatch(r'[a-zA-Z0-9._-]+',VN)
row=next(line for line in Path('/opt/keystore-vault/README.md').read_text().splitlines() if line.lstrip().startswith('|') and 'notesvault.keystore' in line)
cells=[c.strip().strip('`') for c in row.strip().strip('|').split('|')]
idx=next(i for i,c in enumerate(cells) if 'notesvault.keystore' in c)
alias=cells[idx+1];password=cells[idx+2]
assert alias=='notesvault' and password
os.environ['HONGGUO_STORE_PASSWORD']=password
T=Path('/opt/android-sdk/build-tools/35.0.0');cert='b5aaac0eb0369165d34ee3bae1cddd637eaa2bc3566adf9e3f2dc2f5a1a473e4'
for channel in ('mobile','tv'):
 name=f'Hongguo-{channel.title()}-{VN}-arm-universal.apk';out=root/'public'/channel/name
 if out.exists():raise SystemExit('Version already signed; choose a new release name before signing again')
 subprocess.run([str(T/'apksigner'),'sign','--ks','/opt/keystore-vault/notesvault.keystore','--ks-key-alias',alias,'--ks-pass','env:HONGGUO_STORE_PASSWORD','--key-pass','env:HONGGUO_STORE_PASSWORD','--out',str(out),str(root/'incoming'/name.replace('.apk','-unsigned.apk'))],check=True,capture_output=True)
 v=subprocess.run([str(T/'apksigner'),'verify','--print-certs',str(out)],check=True,capture_output=True,text=True).stdout
 assert cert in v
 info=subprocess.run([str(T/'aapt'),'dump','badging',str(out)],capture_output=True,text=True,check=True).stdout
 assert f"name='site.zhangyue.hongguo.{channel}'" in info and f"versionCode='{VC}'" in info
 j={'channel':channel,'packageName':f'site.zhangyue.hongguo.{channel}','versionCode':VC,'versionName':VN,'size':out.stat().st_size,'sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'certificateSha256':cert,'url':f'https://nas.zhangyue.site/hongguo-ota/{channel}/{name}','notes':C['notes']}
 (out.parent/'latest.json').write_text(json.dumps(j,ensure_ascii=False,indent=2)+'\n');print(channel,j['sha256'],j['size'],'signer verified')
