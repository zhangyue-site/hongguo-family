#!/usr/bin/env python3
import argparse,json,sys,time,urllib.request,subprocess
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--work',required=True,type=Path);p.add_argument('--version',required=True);p.add_argument('--build-number',required=True);p.add_argument('--submit-review',action='store_true');p.add_argument('--enable-public-link',action='store_true');a=p.parse_args()
policy=json.loads(Path('/opt/hongguo-analysis/ios-release/distribution-policy.json').read_text())
if policy.get('mode')=='internal' and (a.submit_review or a.enable_public_link):
 raise ValueError('This project is configured for internal testing only')
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
if policy.get('mode')=='internal':
 s,b=asc.api('GET','/v1/apps/6824873494/betaGroups',token=asc.make_token(),retries=1)
 if isinstance(b,str):b=json.loads(b)
 if s!=200:raise RuntimeError('Cannot verify internal group')
 groups=[g for g in b['data'] if g['attributes'].get('isInternalGroup') and g['attributes'].get('hasAccessToAllBuilds')]
 if not groups:raise RuntimeError('No internal group with automatic build access')
 s,b=asc.api('GET','/v1/builds/'+bid+'/buildBetaDetail',token=asc.make_token(),retries=1)
 if isinstance(b,str):b=json.loads(b)
 if s!=200:raise RuntimeError('Cannot verify internal build status')
 print(json.dumps({'buildId':bid,'distribution':'internal','internalBuildState':b['data']['attributes']['internalBuildState'],'externalInvitationsEnabled':False}))
 raise SystemExit(0)
base=['--build-id',bid,'--build-number',a.build_number,'--version',a.version,'--state',str(a.work/'prepared.json')]
subprocess.run(['python3',str(root/'prepare-testflight-106.py'),*base],check=True)
cmd=['python3',str(root/'complete-testflight-106.py'),*base]
if a.submit_review:cmd.append('--submit-review')
if a.enable_public_link:cmd.append('--enable-public-link')
subprocess.run(cmd,check=True)
