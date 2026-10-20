#!/usr/bin/env python3
import argparse,json,sys,time,urllib.request,subprocess
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--work',required=True,type=Path);p.add_argument('--version',required=True);p.add_argument('--build-number',required=True);p.add_argument('--submit-review',action='store_true');p.add_argument('--enable-public-link',action='store_true');a=p.parse_args()
sys.path.insert(0,'/opt/mathduel-deploy');import asc
urllib.request.install_opener(urllib.request.build_opener(urllib.request.ProxyHandler({})))
state=json.loads((a.work/'upload.json').read_text());deadline=time.monotonic()+1800
while True:
 s,b=asc.api('GET','/v1/buildUploads/'+state['uploadId']+'?include=build',token=asc.make_token(),retries=1)
 if isinstance(b,str):b=json.loads(b)
 if s!=200:raise RuntimeError('Apple processing lookup HTTP '+str(s))
 u=b['data']['attributes']['state'];status=u['state']
 if status in ('FAILED','INVALID') or u.get('errors'):raise RuntimeError('Apple processing failed; inspect restricted upload state')
 builds=[x for x in b.get('included',[]) if x['type']=='builds']
 build=next((x for x in builds if x['attributes']['processingState']=='VALID'),None)
 if build:break
 if time.monotonic()>deadline:raise TimeoutError('Apple still processing; repeat same release command to resume')
 time.sleep(30)
bid=build['id'];root=Path('/opt/hongguo-analysis/ios-release')
base=['--build-id',bid,'--build-number',a.build_number,'--version',a.version,'--state',str(a.work/'prepared.json')]
subprocess.run(['python3',str(root/'prepare-testflight-106.py'),*base],check=True)
cmd=['python3',str(root/'complete-testflight-106.py'),*base]
if a.submit_review:cmd.append('--submit-review')
if a.enable_public_link:cmd.append('--enable-public-link')
subprocess.run(cmd,check=True)
