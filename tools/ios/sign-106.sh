#!/usr/bin/env bash
# Execute on 106 only; signing material remains outside the repository.
set -euo pipefail
if [[ $# != 2 ]]; then
  echo 'Usage: sign-106.sh unsigned.ipa signed.ipa' >&2
  exit 2
fi
umask 077
sign_root=/opt/hongguo-analysis/ios-release
/opt/zsign/bin/zsign -f \
  -k /opt/mathduel-deploy/mathduel_dist.key \
  -c /opt/mathduel-deploy/ios-assets/dist.cer \
  -m "$sign_root/HongguoFamily_AppStore.mobileprovision" \
  -b site.zhangyue.hongguo.ios -o "$2" "$1"
sha256sum "$2"
