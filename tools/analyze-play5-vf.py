"""Read-only signature/entropy report for official Play5 VF historical container. Never device flashing."""
from pathlib import Path
import mmap,struct,json,hashlib,math,collections
R=Path('/opt/hongguo-analysis/play5-vf');p=R/'official-VF-V1.3.19.bin';assert p.stat().st_size==1855328832,'Incomplete firmware download'
r=json.loads((R/'static-analysis.json').read_text())
with p.open('rb') as f:
 b=mmap.mmap(f.fileno(),0,access=mmap.ACCESS_READ);r['firmwareBytes']=len(b);r['firmwareSha256']=hashlib.sha256(b).hexdigest()
 r['entropySamples']=[]
 for o in (4096,1048576,len(b)//2,len(b)-1048576):
  c=collections.Counter(b[o:o+65536]);n=sum(c.values());r['entropySamples'].append({'offset':o,'entropy':-sum(v/n*math.log2(v/n) for v in c.values())})
 r['signatureOffsets']={}
 for name,mark in {'androidBoot':b'ANDROID!','zipLocal':b'PK\x03\x04','zipEnd':b'PK\x05\x06','squashfs':b'hsqs','cpioNewc':b'070701','erofs':b'\xe2\xe1\xf5\xe0','androidSparse':b'\x3a\xff\x26\xed'}.items():
  offsets=[];pos=0
  while True:
   o=b.find(mark,pos)
   if o<0:break
   if len(offsets)<20:offsets.append(o)
   pos=o+len(mark)
  r['signatureOffsets'][name]=offsets
 # A 4-byte hit in high entropy data is not evidence of an actual filesystem.
 r['signatureWarning']='Unvalidated magic hits may be random; no APK or filesystem declared extracted.'
 r['displayedVersionLiteralFound']=b.find(b'6.17.100.03')>=0
 r['finding']='Full official VF historical container read-only scanned. REE/MTK wrapper not decoded. No settings APK extracted; no proven mapping to displayed 6.17.100.03; no verified hidden ADB entry. Signature hits require structural validation and cannot alone identify a filesystem.'
 b.close()
(R/'static-analysis-full.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print(json.dumps(r,ensure_ascii=False,indent=2))
