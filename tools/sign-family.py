"""Portable signing for private collaborators; no deployment and no password logging."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--keystore',type=Path,required=True);parser.add_argument('--input',type=Path,default=Path('family-build'));parser.add_argument('--output',type=Path,default=Path('signed-build'));args=parser.parse_args()
 root=Path(__file__).resolve().parents[1];config=json.loads((root/'release-config.json').read_text());vc=config['versionCode'];vn=config['versionName']
 if not isinstance(vc,int) or vc<1 or not re.fullmatch(r'[a-zA-Z0-9._-]+',vn):raise SystemExit('Invalid release configuration')
 if not os.environ.get('HONGGUO_STORE_PASSWORD'):raise SystemExit('Set HONGGUO_STORE_PASSWORD in the environment')
 if not args.keystore.is_file():raise SystemExit('Keystore file missing')
 sdk=Path(os.environ.get('ANDROID_SDK_ROOT') or os.environ.get('ANDROID_HOME') or str(Path.home()/'Library/Android/sdk'));tools=sdk/'build-tools/35.0.0';cert='b5aaac0eb0369165d34ee3bae1cddd637eaa2bc3566adf9e3f2dc2f5a1a473e4'
 for channel in ('mobile','tv'):
  name=f'Hongguo-{channel.title()}-{vn}-arm-universal.apk';out=args.output/channel/name;out.parent.mkdir(parents=True,exist_ok=True)
  if out.exists():raise SystemExit('Output exists; use a fresh output directory')
  subprocess.run([str(tools/'apksigner'),'sign','--ks',str(args.keystore),'--ks-key-alias','notesvault','--ks-pass','env:HONGGUO_STORE_PASSWORD','--key-pass','env:HONGGUO_STORE_PASSWORD','--out',str(out),str(args.input/name.replace('.apk','-unsigned.apk'))],check=True,capture_output=True)
  verify=subprocess.run([str(tools/'apksigner'),'verify','--print-certs',str(out)],check=True,capture_output=True,text=True).stdout
  if cert not in verify:out.unlink();raise SystemExit('Unexpected signing certificate')
  info=subprocess.run([str(tools/'aapt'),'dump','badging',str(out)],check=True,capture_output=True,text=True).stdout
  if f"name='site.zhangyue.hongguo.{channel}'" not in info or f"versionCode='{vc}'" not in info:out.unlink();raise SystemExit('Unexpected package or version')
  j={'channel':channel,'packageName':f'site.zhangyue.hongguo.{channel}','versionCode':vc,'versionName':vn,'size':out.stat().st_size,'sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'certificateSha256':cert,'url':f'https://nas.zhangyue.site/hongguo-ota/{channel}/{name}','notes':config['notes']}
  (out.parent/'latest.json').write_text(json.dumps(j,ensure_ascii=False,indent=2)+'\n');print(channel,'signed; B5 certificate, package and version verified')
 (args.output/'SHA256SUMS.txt').write_text(''.join(hashlib.sha256(p.read_bytes()).hexdigest()+'  '+str(p.relative_to(args.output))+'\n' for p in sorted(args.output.rglob('*.apk'))))
if __name__=='__main__':main()
