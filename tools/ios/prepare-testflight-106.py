#!/usr/bin/env python3
"""Prepare beta metadata and a disabled external group; never submit a review.

Run on 106 after inspect-beta.py saved existing-beta-private.json there.
Existing review contact information is reused only within the same Apple team.
No contact information is printed or placed in this repository.
"""
import argparse
import json
import os
from pathlib import Path
import sys
import urllib.request

APP = '6824873494'
ROOT = Path('/opt/hongguo-analysis/ios-release')
DESCRIPTION = (
    '红果家庭版测试版本：浏览真人短剧、漫剧与 AI 剧目录，搜索剧名，'
    '播放来源已公开开放的剧集。收藏与观看历史保存在设备本地。'
    '采用适配手机的深色界面和底部选集面板，当前播放集明显标记。'
    '部分剧集因来源未开放而锁定。无需账号登录。'
)
NOTES = (
    'No account or sign-in is required. Browse the live-action, animation or AI '
    'catalogs, or search by title. Open a title and play an unlocked episode. '
    'Only episodes publicly available from the source are playable; unavailable '
    'episodes are marked locked. While playing, open the dark episode sheet to '
    'see the highlighted current episode and switch to another unlocked episode. '
    'Favorites and viewing history are stored locally on the device; there is no '
    'cloud account or cloud sync. Test playback, seeking, pause/resume, episode '
    'selection, rotation, and returning to the catalog. Playback requires network '
    'access and availability of the public source.'
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--build-id', required=True)
    parser.add_argument('--build-number', required=True)
    parser.add_argument('--version', required=True)
    parser.add_argument('--state', required=True, type=Path,
                        help='Separate restricted prepared-state file for this build')
    args = parser.parse_args()
    previous = {}
    expected = {'appId': APP, 'buildId': args.build_id,
                'buildNumber': args.build_number, 'version': args.version}
    if args.state.exists():
        previous = json.loads(args.state.read_text())
        if any(previous.get(k) != v for k, v in expected.items()):
            raise ValueError('Prepared-state identity differs; use a new per-build state file')
    os.umask(0o077)
    sys.path.insert(0, '/opt/mathduel-deploy')
    import asc
    urllib.request.install_opener(urllib.request.build_opener(
        urllib.request.ProxyHandler({})))

    def api(method, path, body=None):
        status, result = asc.api(method, path, body, token=asc.make_token(), retries=1)
        if status not in (200, 201, 204):
            # Contact-bearing request/response bodies must remain private.
            raise RuntimeError(f'Apple beta metadata request failed: {method} {path} HTTP {status}')
        return result

    app = api('GET', '/v1/apps/' + APP)['data']
    if app['attributes']['bundleId'] != 'site.zhangyue.hongguo.ios':
        raise ValueError('Unexpected app bundle')
    build_response = api('GET', '/v1/builds/' + args.build_id + '?include=app,preReleaseVersion')
    build = build_response['data']
    if build['relationships']['app']['data']['id'] != APP:
        raise ValueError('Build belongs to a different App')
    if build['attributes']['processingState'] != 'VALID':
        raise ValueError('Build is not VALID')
    if build['attributes']['version'] != args.build_number:
        raise ValueError('Build number mismatch')
    release_id = build['relationships']['preReleaseVersion']['data']['id']
    release = next(x for x in build_response.get('included', [])
                   if x['type'] == 'preReleaseVersions' and x['id'] == release_id)
    if release['attributes']['version'] != args.version:
        raise ValueError('Marketing version mismatch')
    fields = ['contactFirstName', 'contactLastName', 'contactEmail', 'contactPhone']
    contacts = []
    for other in json.loads((ROOT / 'existing-beta-private.json').read_text()):
        attrs = other.get('betaAppReviewDetail', {}).get('attributes', {})
        if all(attrs.get(key) for key in fields):
            contacts.append({key: attrs[key] for key in fields})
    if not contacts:
        raise RuntimeError('No complete existing beta review contact; owner input required')
    contact = contacts[0]
    detail = api('GET', '/v1/apps/' + APP + '/betaAppReviewDetail')['data']
    api('PATCH', '/v1/betaAppReviewDetails/' + detail['id'], {'data': {
        'type': 'betaAppReviewDetails', 'id': detail['id'], 'attributes': {
            **contact, 'demoAccountRequired': False, 'notes': NOTES}}})
    locales = api('GET', '/v1/apps/' + APP + '/betaAppLocalizations')['data']
    locale = next((x for x in locales if x['attributes']['locale'] == 'zh-Hans'), None)
    attrs = {'description': DESCRIPTION, 'feedbackEmail': contact['contactEmail']}
    if locale:
        api('PATCH', '/v1/betaAppLocalizations/' + locale['id'], {'data': {
            'type': 'betaAppLocalizations', 'id': locale['id'], 'attributes': attrs}})
    else:
        api('POST', '/v1/betaAppLocalizations', {'data': {
            'type': 'betaAppLocalizations', 'attributes': {**attrs, 'locale': 'zh-Hans'},
            'relationships': {'app': {'data': {'type': 'apps', 'id': APP}}}}})
    locales = api('GET', '/v1/builds/' + args.build_id + '/betaBuildLocalizations')['data']
    locale = next((x for x in locales if x['attributes']['locale'] == 'zh-Hans'), None)
    attrs = {'whatsNew': '请测试目录和搜索、公开剧集播放、暂停与进度拖动、深色选集与当前集标记、横竖屏适配、返回目录，以及本地收藏和观看历史。'}
    if locale:
        api('PATCH', '/v1/betaBuildLocalizations/' + locale['id'], {'data': {
            'type': 'betaBuildLocalizations', 'id': locale['id'], 'attributes': attrs}})
    else:
        api('POST', '/v1/betaBuildLocalizations', {'data': {
            'type': 'betaBuildLocalizations', 'attributes': {**attrs, 'locale': 'zh-Hans'},
            'relationships': {'build': {'data': {'type': 'builds', 'id': args.build_id}}}}})
    groups = api('GET', '/v1/apps/' + APP + '/betaGroups')['data']
    group = next((x for x in groups if x['attributes']['name'] == '外部测试'
                  and not x['attributes']['isInternalGroup']), None)
    if not group:
        group = api('POST', '/v1/betaGroups', {'data': {
            'type': 'betaGroups', 'attributes': {'name': '外部测试',
                'isInternalGroup': False, 'publicLinkEnabled': False,
                'publicLinkLimitEnabled': True, 'publicLinkLimit': 100,
                'feedbackEnabled': True, 'hasAccessToAllBuilds': False},
            'relationships': {'app': {'data': {'type': 'apps', 'id': APP}}}}})['data']
    if group['attributes'].get('publicLinkEnabled'):
        raise RuntimeError('Existing group already has an enabled public link; inspect before continuing')
    result = {**previous, **expected, 'externalGroupId': group['id'],
              'publicLinkEnabled': False, 'publicLinkLimit': 100,
              'contactComplete': True, 'reviewSubmitted': previous.get('reviewSubmitted', False)}
    args.state.write_text(json.dumps(result, indent=2))
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
