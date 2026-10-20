import subprocess,sys,xml.etree.ElementTree as ET,re,os
A=os.environ.get('ADB_BIN','/opt/android-sdk/platform-tools/adb')
def run(*args):return subprocess.check_output([A,*args],text=True)
def nodes():
 for attempt in range(3):
  result=run('shell','uiautomator','dump','/sdcard/hg-test-ui.xml')
  if 'dumped to' in result:break
 else:raise SystemExit('UI dump failed; refusing stale hierarchy')
 return list(ET.fromstring(run('shell','cat','/sdcard/hg-test-ui.xml')).iter('node'))
command=sys.argv[1]
if command=='texts':
 for n in nodes():
  s=n.get('text') or n.get('content-desc')
  if s:print(s[:110],n.get('bounds'))
elif command=='tap':
 wanted=sys.argv[2];matches=[n for n in nodes() if n.get('text')==wanted or n.get('content-desc')==wanted]
 if not matches:raise SystemExit('Not found: '+wanted)
 b=list(map(int,re.findall(r'\d+',matches[-1].get('bounds'))));print('tap',wanted,b);run('shell','input','tap',str((b[0]+b[2])//2),str((b[1]+b[3])//2))
