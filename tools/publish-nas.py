"""Copy reviewed public release directory to Lenovo public space; read back every hash."""
import smbclient,hashlib,json
from pathlib import Path
R=Path(__file__).resolve().parents[1];source=R/'family-releases';root=r'\\192.168.1.4\公共空间\红果'
smbclient.ClientConfig(require_secure_negotiate=False)
smbclient.register_session('192.168.1.4',username='guest',password='',require_signing=False,encrypt=False)
smbclient.makedirs(root,exist_ok=True)
for p in sorted(source.rglob('*'),key=lambda p:(p.suffix=='.json',str(p))):
 if not p.is_file():continue
 dest=root+'\\'+str(p.relative_to(source)).replace('/','\\');parent=dest.rsplit('\\',1)[0];smbclient.makedirs(parent,exist_ok=True)
 data=p.read_bytes()
 if smbclient.path.exists(dest) and p.suffix=='.apk':
  with smbclient.open_file(dest,mode='rb') as f:assert hashlib.sha256(f.read()).digest()==hashlib.sha256(data).digest(),'Existing version has different contents'
 else:
  temp=dest+'.uploading'
  with smbclient.open_file(temp,mode='wb') as f:f.write(data)
  smbclient.replace(temp,dest)
 with smbclient.open_file(dest,mode='rb') as f:assert hashlib.sha256(f.read()).digest()==hashlib.sha256(data).digest()
 print(str(p.relative_to(source)),len(data),'verified on NAS')
