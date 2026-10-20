#!/usr/bin/env python3
"""Explicit TestFlight release steps after device verification, on 106 only."""
import argparse
import json
from pathlib import Path
import sys
import urllib.request

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--build-id', required=True)
    parser.add_argument('--build-number', required=True)
    parser.add_argument('--version', required=True)
    parser.add_argument('--state', required=True, type=Path)
    parser.add_argument('--submit-review', action='store_true')
    parser.add_argument('--enable-public-link', action='store_true')
    args = parser.parse_args()
    policy_path = Path('/opt/hongguo-analysis/ios-release/distribution-policy.json')
    if policy_path.exists() and json.loads(policy_path.read_text()).get('mode') == 'internal' and (args.submit_review or args.enable_public_link):
        raise ValueError('Project distribution is internal testing only')
    state = json.loads(args.state.read_text())
    expected = {'appId': '6824873494', 'buildId': args.build_id,
                'buildNumber': args.build_number, 'version': args.version}
    if any(state.get(k) != v for k, v in expected.items()):
        raise ValueError('Explicit release identity does not match prepared state')
    app_id, build_id, group_id = (state[k] for k in
                                  ['appId', 'buildId', 'externalGroupId'])
    sys.path.insert(0, '/opt/mathduel-deploy')
    import asc
    urllib.request.install_opener(urllib.request.build_opener(
        urllib.request.ProxyHandler({})))

    def api(method, path, body=None):
        status, result = asc.api(method, path, body, token=asc.make_token(), retries=1)
        if status not in (200, 201, 204):
            raise RuntimeError(f'Apple TestFlight HTTP {status}: {result}')
        return result

    build_response = api('GET', '/v1/builds/' + build_id + '?include=app,preReleaseVersion')
    build = build_response['data']
    if build['attributes']['processingState'] != 'VALID':
        raise ValueError('Build is not VALID')
    if build['relationships']['app']['data']['id'] != app_id:
        raise ValueError('Build belongs to a different App')
    if build['attributes']['version'] != args.build_number:
        raise ValueError('Build number mismatch')
    release_id = build['relationships']['preReleaseVersion']['data']['id']
    release = next(x for x in build_response.get('included', [])
                   if x['type'] == 'preReleaseVersions' and x['id'] == release_id)
    if release['attributes']['version'] != args.version:
        raise ValueError('Marketing version mismatch')
    app = api('GET', '/v1/apps/' + app_id)['data']
    if app['attributes']['bundleId'] != 'site.zhangyue.hongguo.ios':
        raise ValueError('Unexpected App bundle')
    group_app = api('GET', '/v1/betaGroups/' + group_id + '/app')['data']
    if group_app['id'] != app_id:
        raise ValueError('External group belongs to a different App')
    detail = api('GET', '/v1/builds/' + build_id + '/buildBetaDetail')['data']
    beta_state = detail['attributes']['externalBuildState']
    if args.submit_review:
        review = api('GET', '/v1/builds/' + build_id + '/betaAppReviewSubmission').get('data')
        if not review:
            if beta_state != 'READY_FOR_BETA_SUBMISSION':
                raise ValueError('Build is not ready for beta submission: ' + beta_state)
            review = api('POST', '/v1/betaAppReviewSubmissions', {'data': {
                'type': 'betaAppReviewSubmissions', 'relationships': {
                    'build': {'data': {'type': 'builds', 'id': build_id}}}}})['data']
        state['reviewSubmitted'] = True
        state['reviewId'] = review['id']
        state['reviewState'] = review['attributes']['betaReviewState']
        args.state.write_text(json.dumps(state, indent=2))
    if args.enable_public_link:
        # Opening invitations must follow actual Apple approval, not transport.
        detail = api('GET', '/v1/builds/' + build_id + '/buildBetaDetail')['data']
        beta_state = detail['attributes']['externalBuildState']
        if beta_state not in ('READY_FOR_BETA_TESTING', 'IN_BETA_TESTING'):
            raise ValueError('External build not approved: ' + beta_state)
        api('POST', '/v1/betaGroups/' + group_id + '/relationships/builds', {
            'data': [{'type': 'builds', 'id': build_id}]})
        group = api('PATCH', '/v1/betaGroups/' + group_id, {'data': {
            'type': 'betaGroups', 'id': group_id, 'attributes': {
                'publicLinkEnabled': True, 'publicLinkLimitEnabled': True,
                'publicLinkLimit': 100}}})['data']
        state['publicLinkEnabled'] = group['attributes']['publicLinkEnabled']
        state['publicLink'] = group['attributes'].get('publicLink')
        args.state.write_text(json.dumps(state, indent=2))
    result = api('GET', '/v1/builds/' + build_id + '/buildBetaDetail')['data']
    print(json.dumps({'buildId': build_id, 'betaState': result['attributes'],
                      'reviewSubmitted': state['reviewSubmitted'],
                      'publicLinkEnabled': state['publicLinkEnabled'],
                      'publicLink': state.get('publicLink')}, indent=2))


if __name__ == '__main__':
    main()
