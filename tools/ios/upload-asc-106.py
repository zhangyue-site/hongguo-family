#!/usr/bin/env python3
"""Upload an already signed IPA through Apple's buildUploads REST API.

Run on 106. Credentials are loaded from its existing restricted asc.py module;
they are never copied to GitHub. This uploads a build, not an App Store release
or TestFlight review submission. App record creation must precede this command.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import plistlib
import sys
import urllib.error
import urllib.parse
import urllib.request
import zipfile

BASE = 'https://api.appstoreconnect.apple.com'
EXPECTED_BUNDLE = 'site.zhangyue.hongguo.ios'


def ipa_info(path):
    with zipfile.ZipFile(path) as archive:
        names = [n for n in archive.namelist()
                 if n.startswith('Payload/') and n.count('/') == 2
                 and n.endswith('.app/Info.plist')]
        if len(names) != 1:
            raise ValueError('Expected exactly one top-level iOS app')
        info = plistlib.loads(archive.read(names[0]))
        if info['CFBundleIdentifier'] != EXPECTED_BUNDLE:
            raise ValueError('Unexpected bundle identifier')
        profile = names[0].replace('Info.plist', 'embedded.mobileprovision')
        if profile not in archive.namelist():
            raise ValueError('IPA has no embedded provisioning profile')
        return info


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ipa', type=Path)
    parser.add_argument('--app-id', required=True)
    parser.add_argument('--state', type=Path, required=True,
                        help='Restricted local resume record, outside the repository')
    parser.add_argument('--direct', action='store_true',
                        help='Bypass inherited proxy for Apple API and upload endpoints')
    args = parser.parse_args()
    os.umask(0o077)
    sys.path.insert(0, '/opt/mathduel-deploy')
    import asc
    if args.direct:
        urllib.request.install_opener(urllib.request.build_opener(
            urllib.request.ProxyHandler({})))
    info = ipa_info(args.ipa)
    digest = hashlib.sha256(args.ipa.read_bytes()).hexdigest()

    def api(method, path, body=None):
        payload = json.dumps(body).encode() if body is not None else None
        req = urllib.request.Request(BASE + path, data=payload, method=method,
                                     headers={'Authorization': 'Bearer ' + asc.make_token(),
                                              'Content-Type': 'application/json'})
        try:
            with urllib.request.urlopen(req, timeout=120) as response:
                raw = response.read()
                return json.loads(raw) if raw else {}
        except urllib.error.HTTPError as error:
            # API errors contain no JWT; do not log signed upload operation URLs.
            raise RuntimeError(f'Apple API HTTP {error.code}: '
                               + error.read().decode()[:1500]) from None

    apps = api('GET', '/v1/apps/' + urllib.parse.quote(args.app_id))
    if apps['data']['attributes']['bundleId'] != EXPECTED_BUNDLE:
        raise ValueError('App record bundle mismatch')
    if args.state.exists():
        state = json.loads(args.state.read_text())
        if state['sha256'] != digest or state['appId'] != args.app_id:
            raise ValueError('Resume record belongs to another artifact or app')
    else:
        upload = api('POST', '/v1/buildUploads', {'data': {
            'type': 'buildUploads', 'attributes': {
                'cfBundleShortVersionString': info['CFBundleShortVersionString'],
                'cfBundleVersion': str(info['CFBundleVersion']), 'platform': 'IOS'},
            'relationships': {'app': {'data': {'type': 'apps', 'id': args.app_id}}}}})
        state = {'appId': args.app_id, 'sha256': digest,
                 'uploadId': upload['data']['id']}
        args.state.write_text(json.dumps(state, indent=2))
    if 'fileId' not in state:
        uploaded_file = api('POST', '/v1/buildUploadFiles', {'data': {
            'type': 'buildUploadFiles', 'attributes': {
                'assetType': 'ASSET', 'fileName': args.ipa.name,
                'fileSize': args.ipa.stat().st_size, 'uti': 'com.apple.ipa'},
            'relationships': {'buildUpload': {'data': {
                'type': 'buildUploads', 'id': state['uploadId']}}}}})
        state['fileId'] = uploaded_file['data']['id']
        args.state.write_text(json.dumps(state, indent=2))
    else:
        uploaded_file = api('GET', '/v1/buildUploadFiles/' + state['fileId'])
    if not state.get('committed'):
        operations = uploaded_file['data']['attributes'].get('uploadOperations', [])
        if not operations:
            raise RuntimeError('No upload operations returned; inspect Apple upload state')
        with args.ipa.open('rb') as source:
            for number, operation in enumerate(operations, 1):
                url = operation['url']
                if urllib.parse.urlparse(url).scheme != 'https':
                    raise ValueError('Apple returned non-HTTPS upload URL')
                source.seek(operation['offset'])
                chunk = source.read(operation['length'])
                if len(chunk) != operation['length']:
                    raise ValueError('Upload chunk extends beyond artifact')
                headers = {h['name']: h['value']
                           for h in operation.get('requestHeaders', [])}
                req = urllib.request.Request(url, data=chunk,
                                             method=operation['method'], headers=headers)
                # Never attach Apple API credentials to the presigned upload host.
                try:
                    with urllib.request.urlopen(req, timeout=300) as response:
                        if not 200 <= response.status < 300:
                            raise RuntimeError('Unexpected chunk upload status')
                except urllib.error.URLError:
                    raise RuntimeError('Chunk upload failed; rerun with same state file') from None
                print(f'Uploaded part {number}/{len(operations)}', flush=True)
        api('PATCH', '/v1/buildUploadFiles/' + state['fileId'], {'data': {
            'type': 'buildUploadFiles', 'id': state['fileId'], 'attributes': {
                'uploaded': True, 'sourceFileChecksums': {
                    'file': {'algorithm': 'SHA_256', 'hash': digest}}}}})
        state['committed'] = True
        args.state.write_text(json.dumps(state, indent=2))
    result = api('GET', '/v1/buildUploads/' + state['uploadId'])
    print(json.dumps({'uploadId': state['uploadId'],
                      'attributes': result['data']['attributes']}, indent=2))


if __name__ == '__main__':
    main()
