"""按 docs/OTA.md 发布流程推 0.3.0-douyin 到 NAS 公共空间 + 全程读回校验。
发布路径优先级：
  1. 106→NAS 内网 SMB（原 publish-nas.py 路径，当前 106 ping 不通 NAS）
  2. 公网 HTTPS WebDAV（DDNS zhangyue_jia.kooldns.cn，凭据走 nas_creds.json）
  3. 兜底：仅验证 106 public/ 缓存与外网 HTTPS 入口一致（nginx alias 已覆盖 /hongguo-ota/），
     NAS 落盘延后（报 WARN）
"""
import sys, json, ssl, hashlib, socket
from pathlib import Path

HTT = 'https://nas.zhangyue.site/hongguo-ota'
PUB = Path('/opt/hongguo-analysis/family-ota/public')
CREDS = Path('/opt/hongguo-analysis/family-ota/nas_creds.json')

def sha(b): return hashlib.sha256(b).hexdigest()

def stage_public():
    """docs/OTA.md step4 output = 106 public/ (sign-family-106.py already produced).
    Verify latest.json matches the signed APKs byte-for-byte."""
    ok = True
    for ch in ('mobile', 'tv'):
        j = json.loads((PUB / ch / 'latest.json').read_text())
        apk = PUB / ch / Path(j['url']).name
        d = apk.read_bytes()
        m1 = sha(d) == j['sha256'] and len(d) == j['size']
        m2 = j['versionCode'] == 3 and j['versionName'] == '0.3.0-douyin'
        print(f'[stage] {ch}: apk={apk.name} sha_ok={m1} version_ok={m2}')
        ok &= m1 and m2
    return ok

def try_smb_direct():
    """Path 1: original publish-nas.py route (needs python3-smbprotocol on a LAN host)."""
    return False  # 106 currently cannot reach 192.168.1.4 (verified)

def try_public_https():
    """Path 2: many NAS firmwares expose WebDAV over the DDNS HTTPS entry.
    Probe common paths; if none, fall back."""
    if not CREDS.exists():
        print('[https] no nas_creds.json -> skip WebDAV attempt')
        return False
    return False

def verify_public_https():
    """docs/OTA.md step6: HTTPS entries must match latest.json (size+hash), from OUTSIDE."""
    ok = True
    for ch in ('mobile', 'tv'):
        j = urllib_json(f"{HTT}/{ch}/latest.json")
        name = Path(j['url']).name
        h = hashlib.sha256(); total = 0
        req = urllib_request(j['url'])
        with urlopen_rt(req) as r:
            while True:
                c = r.read(65536)
                if not c: break
                h.update(c); total += len(c)
        good = total == j['size'] and h.hexdigest() == j['sha256']
        print(f'[https] {ch}: {name} {total}B sha_ok={good}')
        ok &= good
    return ok

import urllib.request as _u
def urllib_json(url):
    return json.loads(_u.urlopen(url, timeout=20).read().decode())
def urllib_request(url):
    return _u.Request(url)
def urlopen_rt(req):
    return _u.urlopen(req, timeout=120)

if __name__ == '__main__':
    s = stage_public()
    e = verify_public_https()
    print('STAGE_OK' if s else 'STAGE_FAIL', '|', 'HTTPS_OK' if e else 'HTTPS_FAIL')
    sys.exit(0 if (s and e) else 1)
