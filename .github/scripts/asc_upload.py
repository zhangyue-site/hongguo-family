#!/usr/bin/env python3
'''Upload signed IPA to App Store Connect via buildUploads REST API.
Pure stdlib. Secrets from env: ASC_P8, ASC_KEY_ID, ASC_ISSUER_ID, ASC_APP_ID.
L2 port of 106:/opt/hongguo-analysis/ios-release/upload-asc-106.py'''
import base64, hashlib, json, os, time, urllib.error, urllib.parse, urllib.request
import zipfile, plistlib

BASE = 'https://api.appstoreconnect.apple.com'
from pathlib import Path
ipa = Path('build/ship/hongguo-ios-signed.ipa')
_p8_raw = os.environ['ASC_P8'].strip()
def _to_pem(x):
    if x.startswith(b'-----'):
        return x
    for guess in (x, base64.b64decode(x + b'=' * (-len(x) % 4))):
        try:
            if guess.startswith(b'-----'):
                return guess
        except Exception:
            pass
    return x
p8 = _to_pem(_p8_raw.encode() if not _p8_raw.startswith('-----') else _p8_raw.encode())
key_id = os.environ['ASC_KEY_ID']
issuer = os.environ['ASC_ISSUER_ID']
app_id = os.environ['ASC_APP_ID']

# ---- ES256 JWT with pure-stdlib P-256 (scalar arithmetic mod curve order N) ----
def b64u(b): return base64.urlsafe_b64encode(b).rstrip(b'=').decode()
P  = 2**256 - 2**224 + 2**192 + 2**96 - 1          # field prime (coords)
N  = 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551  # group order (scalars)
A  = (P - 3) % P
Gx = 0x6b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c296
Gy = 0x4fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5
def inv(a, m): return pow(a, -1, m)
def padd(p, q):
    if p is None: return q
    if q is None: return p
    if p[0] == q[0] and (p[1] + q[1]) % P == 0: return None
    if p == q: l = (3*p[0]*p[0] + A) * inv(2*p[1], P) % P
    else:      l = (q[1] - p[1]) * inv(q[0] - p[0], P) % P
    x = (l*l - p[0] - q[0]) % P
    return (x, (l*(p[0] - x) - p[1]) % P)
def pmul(k, p):
    r, p = None, p
    while k:
        if k & 1: r = padd(r, p)
        p = padd(p, p); k >>= 1
    return r
def der_rs(r, s):
    def part(n):
        b = n.to_bytes(32, 'big').lstrip(b'\x00') or b'\x00'
        if b[0] & 0x80: b = b'\x00' + b
        return bytes([0x02, len(b)]) + b
    body = part(r) + part(s)
    return bytes([0x30, len(body)]) + body

def load_scalar(p8):
    # Apple .p8 = PKCS#8 PEM wrapping SEC1 EC key; scalar lives after 02 01 01 04 20
    body = b''.join(l for l in p8.splitlines() if b'-----' not in l)
    candidates = [body.strip(), body]
    der = None
    for c in candidates:
        try:
            d = base64.b64decode(c, validate=False)
            if b'\x02\x01\x01\x04\x20' in d:
                der = d
                break
        except Exception:
            continue
    if der is None:
        # last resort: treat raw env as b64 of DER directly
        der = base64.b64decode(_p8_raw + '=' * (-len(_p8_raw) % 4))
    marker = bytes([0x02, 0x01, 0x01, 0x04, 0x20])
    i = der.find(marker)
    assert i >= 0, 'unexpected p8 structure (len=%d head=%s)' % (len(der), der[:16].hex())
    return int.from_bytes(der[i+5:i+37], 'big')

d = load_scalar(p8) % N
now = int(time.time())
header = {"alg": "ES256", "kid": key_id, "typ": "JWT"}
payload = {"iss": issuer, "iat": now, "exp": now + 900, "aud": "appstoreconnect-v1"}
si = (b64u(json.dumps(header, separators=(',', ':')).encode()) + '.' +
      b64u(json.dumps(payload, separators=(',', ':')).encode())).encode()
z = int.from_bytes(hashlib.sha256(si).digest(), 'big') % N
import random
k = random.randrange(1, N)
R = pmul(k, (Gx, Gy))[0] % N
S = (inv(k, N) * (z + R * d)) % N
if S > N // 2: S = N - S          # low-S, matches Apple/openssl convention
token = si.decode() + '.' + b64u(der_rs(R, S))
# self-verify: u1*G + u2*Q must recover x == R
w = inv(S, N)
u1, u2 = (z * w) % N, (R * w) % N
pt = padd(pmul(u1, (Gx, Gy)), pmul(u2, pmul(d, (Gx, Gy))))
assert pt is not None and pt[0] % N == R, 'JWT self-verify failed'
print('ES256 JWT signed + self-verified (mod-N math)')

def api(method, path, body=None):
    req = urllib.request.Request(BASE + path,
        data=json.dumps(body).encode() if body else None, method=method,
        headers={'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json'})
    try:
        with urllib.request.urlopen(req, timeout=120) as r:
            raw = r.read(); return json.loads(raw) if raw else {}
    except urllib.error.HTTPError as e:
        raise RuntimeError(f'Apple API HTTP {e.code}: ' + e.read().decode()[:1200]) from None

zf = zipfile.ZipFile(ipa)
app = [n for n in zf.namelist() if n.endswith('.app/Info.plist')][0]
pl = plistlib.loads(zf.read(app))
digest = hashlib.sha256(ipa.read_bytes()).hexdigest()
print('IPA:', ipa.name, ipa.stat().st_size, 'B', pl['CFBundleShortVersionString'], pl['CFBundleVersion'])

apps = api('GET', '/v1/apps/' + urllib.parse.quote(app_id))
assert apps['data']['attributes']['bundleId'] == 'site.zhangyue.hongguo.ios', 'bundle mismatch'

upload = api('POST', '/v1/buildUploads', {'data': {'type': 'buildUploads', 'attributes': {
    'cfBundleShortVersionString': pl['CFBundleShortVersionString'],
    'cfBundleVersion': str(pl['CFBundleVersion']), 'platform': 'IOS'},
    'relationships': {'app': {'data': {'type': 'apps', 'id': app_id}}}}})
upload_id = upload['data']['id']
print('buildUpload created:', upload_id)

uf = api('POST', '/v1/buildUploadFiles', {'data': {'type': 'buildUploadFiles', 'attributes': {
    'assetType': 'ASSET', 'fileName': ipa.name, 'fileSize': ipa.stat().st_size, 'uti': 'com.apple.ipa'},
    'relationships': {'buildUpload': {'data': {'type': 'buildUploads', 'id': upload_id}}}}})
fid = uf['data']['id']
ops = uf['data']['attributes'].get('uploadOperations', [])
with ipa.open('rb') as src:
    for n, op in enumerate(ops, 1):
        assert urllib.parse.urlparse(op['url']).scheme == 'https'
        src.seek(op['offset']); chunk = src.read(op['length'])
        assert len(chunk) == op['length']
        req = urllib.request.Request(op['url'], data=chunk, method=op['method'],
            headers={h['name']: h['value'] for h in op.get('requestHeaders', [])})
        with urllib.request.urlopen(req, timeout=600) as r:
            assert 200 <= r.status < 300
        print(f'part {n}/{len(ops)}')
api('PATCH', '/v1/buildUploadFiles/' + fid, {'data': {
    'type': 'buildUploadFiles', 'id': fid, 'attributes': {'uploaded': True}}})
res = api('GET', '/v1/buildUploads/' + upload_id)
print(json.dumps({'uploadId': upload_id, 'state': res['data']['attributes']}, indent=2, default=str))