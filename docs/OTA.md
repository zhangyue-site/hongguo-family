# 红果手机与盒子 OTA

用户选择：联想个人云存包，106提供稳定更新入口。

- 正本：`\\192.168.1.4\公共空间\红果`，包含 mobile、tv 两个独立渠道。
- HTTPS入口：`https://nas.zhangyue.site/hongguo-ota/`；清单在各渠道 `latest.json`。
- 106发行缓存：`/opt/hongguo-analysis/family-ota/public/`；只放公开发行物，不公开固件、私钥或私人文件。
- 包名：`site.zhangyue.hongguo.mobile`、`site.zhangyue.hongguo.tv`。两者都是ARM32/ARM64通用测试包。
- 签名：既有乐天B5家族；私钥原件保留在106的现有vault；用户授权的加密副本在私人仓库Release附件，密码存Actions Secret。原包和旧个人版可共存，不自动迁移数据。

首次安装后，应用启动会检查更新，有新版才提示；原应用更新页的检查按钮也转入新渠道。客户端只接受指定HTTPS来源，拒绝重定向，限制清单/包体大小；下载后校验SHA256、实际包名、递增版本及APK证书。清单没有独立数字签名；信任边界为HTTPS与固定APK证书。系统安装仍需用户确认和未知来源授权。

## 后续发版

1. 在此独立项目修改代码；更新 `release-config.json` 的versionCode（严格增加）、versionName（新文件名）和notes；手机盒子可同步发版。
2. `python3 build-family.py`。本机只生成unsigned构建，不把旧个人签名带入家族渠道。
3. 将 family-build 中两份 `*-universal-unsigned.apk`、release-config.json 和 tools/sign-family-106.py 上传到106的 `/opt/hongguo-analysis/family-ota/incoming/`（后两者放上一级）。
4. 106运行 `python3 /opt/hongguo-analysis/family-ota/sign-family-106.py`。脚本拒绝覆盖已存在的同版本APK，并检查实际证书、包名和versionCode。当前脚本将两渠道清单生成在106公开缓存，发布前应先在staging完成实机验收，再切换清单；本次是明确标注的测试版。
5. 下载public下两渠道到本机family-releases，运行 `/tmp/minis-nas-venv/bin/python tools/publish-nas.py`。此venv是现有临时运行环境，失效时在独立venv安装smbprotocol；不要把密钥或vault内容上传NAS。
6. 两边都必须读回文件哈希，HTTPS下载须与清单大小和哈希一致；用上一版本真实安装走一遍系统覆盖更新。保留旧版本包，回退清单只能停止推荐新版本，不能绕过安卓版本降级限制。

## 当前验证边界

0.2.0-family-beta已完成构建和B5证书验证。个人云文件逐个读回哈希通过；外网HTTPS清单和两包下载哈希通过。具体模拟安装及OTA输入验证结果见verification/family-ota-test.txt。实体播放、遥控、真正旧版本覆盖升级尚待验证。不能将发布测试包等同于播放功能验收。

Nginx仅新增nas.zhangyue.site的/hongguo-ota/静态路径；修改前备份在106 `/opt/hongguo-analysis/family-ota/nginx-before.conf`（受控权限）。没有开放整个NAS公共空间。

## 私人合作者构建

2026-10-18 用户明确授权共享现有签名密钥，供YangLuSE同签名打包。私人Release附件为hongguo-family.keystore，别名notesvault；Actions Secret为HONGGUO_STORE_PASSWORD。仓库Actions Secret已创建；OAuth缺少workflow权限，自动流程尚未启用。合作者可在GitHub网页将docs/workflows/build-signed.yml模板保存到.github/workflows/build-signed.yml，提交后手动运行Build signed Android APKs生成签名候选包，使用tools/sign-family.py，不触发106/NAS部署。具体说明见根README。密码不写源码、交接或日志。
