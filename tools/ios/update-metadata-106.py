#!/usr/bin/env python3
"""Fill descriptions from 106; never submit App Store review or attach a build."""
import argparse
import json
import os
from pathlib import Path
import sys
import urllib.request

ROOT = Path('/opt/hongguo-analysis/ios-release')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--metadata', type=Path, default=ROOT / 'metadata-zh-Hans.json')
    args = parser.parse_args()
    os.umask(0o077)
    meta = json.loads(args.metadata.read_text())
    if meta['appId'] != '6824873494' or meta['bundleId'] != 'site.zhangyue.hongguo.ios':
        raise ValueError('Unexpected metadata app identity')
    sys.path.insert(0, '/opt/mathduel-deploy')
    import asc
    urllib.request.install_opener(urllib.request.build_opener(
        urllib.request.ProxyHandler({})))

    def api(method, path, body=None):
        status, result = asc.api(method, path, body, token=asc.make_token(), retries=1)
        if status not in (200, 201, 204):
            # Never echo responses that could contain review contacts.
            raise RuntimeError(f'Apple metadata request HTTP {status}: {method} {path}')
        return result

    def patch(kind, identifier, attrs):
        return api('PATCH', '/v1/' + kind + '/' + identifier,
                   {'data': {'type': kind, 'id': identifier, 'attributes': attrs}})['data']

    app_id = meta['appId']
    app = api('GET', '/v1/apps/' + app_id)['data']
    if app['attributes']['bundleId'] != meta['bundleId']:
        raise ValueError('Unexpected Apple app bundle')
    fields = ['contactFirstName', 'contactLastName', 'contactEmail', 'contactPhone']
    detail = api('GET', '/v1/apps/' + app_id + '/betaAppReviewDetail')['data']
    contact = {k: detail['attributes'].get(k) for k in fields}
    if not all(contact.values()):
        for other in json.loads((ROOT / 'existing-beta-private.json').read_text()):
            attrs = other.get('betaAppReviewDetail', {}).get('attributes', {})
            if all(attrs.get(k) for k in fields):
                contact = {k: attrs[k] for k in fields}
                break
    if not all(contact.values()):
        raise RuntimeError('Complete beta review contact unavailable')
    patch('betaAppReviewDetails', detail['id'], {
        **contact, 'notes': meta['reviewNotes'], 'demoAccountRequired': False})
    locales = api('GET', '/v1/apps/' + app_id + '/betaAppLocalizations')['data']
    locale = next((x for x in locales if x['attributes']['locale'] == meta['locale']), None)
    beta_attrs = {'description': meta['betaDescription'],
                  'feedbackEmail': contact['contactEmail'], 'marketingUrl': meta['supportUrl']}
    if locale:
        beta = patch('betaAppLocalizations', locale['id'], beta_attrs)
    else:
        beta = api('POST', '/v1/betaAppLocalizations', {'data': {
            'type': 'betaAppLocalizations', 'attributes': {**beta_attrs, 'locale': meta['locale']},
            'relationships': {'app': {'data': {'type': 'apps', 'id': app_id}}}}})['data']
    infos = api('GET', '/v1/apps/' + app_id + '/appInfos?include=appInfoLocalizations')
    editable = [x for x in infos['data'] if x['attributes']['appStoreState'] == 'PREPARE_FOR_SUBMISSION']
    info_results = []
    for info in editable:
        ids = {x['id'] for x in info['relationships']['appInfoLocalizations']['data']}
        local = next((x for x in infos.get('included', [])
                      if x['id'] in ids and x['attributes']['locale'] == meta['locale']), None)
        if local:
            updated = patch('appInfoLocalizations', local['id'], {'subtitle': meta['subtitle']})
        else:
            updated = api('POST', '/v1/appInfoLocalizations', {'data': {
                'type': 'appInfoLocalizations', 'attributes': {
                    'locale': meta['locale'], 'name': app['attributes']['name'],
                    'subtitle': meta['subtitle']}, 'relationships': {
                    'appInfo': {'data': {'type': 'appInfos', 'id': info['id']}}}}})['data']
        readback = api('GET', '/v1/appInfoLocalizations/' + updated['id'])['data']['attributes']
        if readback['subtitle'] != meta['subtitle']:
            raise ValueError('Subtitle readback mismatch')
        info_results.append({'id': updated['id'], 'subtitle': readback['subtitle']})
    versions = api('GET', '/v1/apps/' + app_id + '/appStoreVersions?include=appStoreVersionLocalizations')
    version_results = []
    store_attrs = {k: meta[k] for k in ['description', 'promotionalText', 'keywords', 'supportUrl']}
    for version in versions['data']:
        if version['attributes']['appStoreState'] != 'PREPARE_FOR_SUBMISSION':
            continue
        ids = {x['id'] for x in version['relationships']['appStoreVersionLocalizations']['data']}
        local = next((x for x in versions.get('included', [])
                      if x['id'] in ids and x['attributes']['locale'] == meta['locale']), None)
        if local:
            updated = patch('appStoreVersionLocalizations', local['id'], store_attrs)
        else:
            updated = api('POST', '/v1/appStoreVersionLocalizations', {'data': {
                'type': 'appStoreVersionLocalizations', 'attributes': {
                    **store_attrs, 'locale': meta['locale']}, 'relationships': {
                    'appStoreVersion': {'data': {'type': 'appStoreVersions', 'id': version['id']}}}}})['data']
        readback = api('GET', '/v1/appStoreVersionLocalizations/' + updated['id'])['data']['attributes']
        if any(readback[k] != v for k, v in store_attrs.items()):
            raise ValueError('App Store draft description readback mismatch')
        build_relation = api('GET', '/v1/appStoreVersions/' + version['id'] + '/relationships/build')
        version_results.append({'id': version['id'], 'versionString': version['attributes']['versionString'],
                                'state': version['attributes']['appStoreState'],
                                'buildAssociation': build_relation.get('data'),
                                **{k: readback[k] for k in store_attrs}})
    review_readback = api('GET', '/v1/apps/' + app_id + '/betaAppReviewDetail')['data']['attributes']
    beta_readback = api('GET', '/v1/betaAppLocalizations/' + beta['id'])['data']['attributes']
    if review_readback['notes'] != meta['reviewNotes']:
        raise ValueError('Review notes readback mismatch')
    if any(beta_readback[k] != v for k, v in beta_attrs.items()):
        raise ValueError('Beta description or feedback readback mismatch')
    result = {'appId': app_id, 'betaDescription': beta_readback['description'],
              'betaMarketingUrl': beta_readback['marketingUrl'],
              'feedbackEmailPresent': bool(beta_readback['feedbackEmail']),
              'reviewContactFieldsComplete': all(review_readback.get(k) for k in fields),
              'demoAccountRequired': review_readback['demoAccountRequired'],
              'reviewNotes': review_readback['notes'], 'appInfoLocalizations': info_results,
              'appStoreDraftLocalizations': version_results,
              'appStoreSubmitted': False, 'buildAssociatedByScript': False}
    (ROOT / 'metadata-readback-sanitized.json').write_text(json.dumps(result, ensure_ascii=False, indent=2))
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
