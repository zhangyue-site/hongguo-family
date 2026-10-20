# 当前发行状态：0.8.2 统一版（2026-10-20）

- 主下载是一份手机/投影通用 APK，包名保留 `site.zhangyue.hongguo.mobile`，触控与 LEANBACK 启动都进入 `UnifiedActivity`。
- `tv` 渠道只为旧独立电视包保留兼容覆盖升级与记录迁移；使用同一套代码及版本，不代表新用户需要安装两个包。
- 两渠道当前都是 versionCode 21 / 0.8.2-unified。下载页已更新，外网两包哈希验证通过；124应用商店两个条目也已同步，旧0.7.4到0.8.0真实客户端OTA在独立ARM64模拟器通过。
- 实施、验证与边界见 `README-REPAIR.md`、`release/VERIFICATION.md`。实体手机与投影未连接验收。
- 本次原源码备份在 106 `/opt/hongguo-analysis/audit-20261020/source-before-0.7.4.tgz`；旧清单备份在同目录 `public-before-0.8.0/`。

下面保留早期渠道搭建记录，遇到发行形态描述冲突时以上述当前状态为准。

# 红果手机与盒子 OTA

用户选择：联想个人云存包，106提供稳定更新入口。

- 正本：`\\192.168.1.4\公共空间\红果`，包含 mobile、tv 两个独立渠道。
- HTTPS入口：`https://nas.zhangyue.site/hongguo-ota/`；清单在各渠道 `latest.json`。
- 106发行缓存：`/opt/hongguo-analysis/family-ota/public/`；只放公开发行物，不公开固件、私钥或私人文件。
- 包名：`site.zhangyue.hongguo.mobile`、`site.zhangyue.hongguo.tv`。两者都是ARM32/ARM64通用测试包。
- 签名：既有乐天B5家族；私钥只在106的现有vault。原包和旧个人版可共存，不自动迁移数据。

首次安装后，应用启动会检查更新，有新版才提示；原应用更新页的检查按钮也转入新渠道。客户端只接受指定HTTPS来源，拒绝重定向，限制清单/包体大小；下载后校验SHA256、实际包名、递增版本及APK证书。清单没有独立数字签名；信任边界为HTTPS与固定APK证书。系统安装仍需用户确认和未知来源授权。

## 后续发版

1. 在此独立项目修改代码；更新 `release-config.json` 的versionCode（严格增加）、versionName（新文件名）和notes；手机盒子可同步发版。
2. `python3 build-family.py`。本机只生成unsigned构建，不把旧个人签名带入家族渠道。
3. 将 family-build 中两份 `*-universal-unsigned.apk`、release-config.json 和 tools/sign-family-106.py 上传到106的 `/opt/hongguo-analysis/family-ota/incoming/`（后两者放上一级）。
4. 106运行 `python3 /opt/hongguo-analysis/family-ota/sign-family-106.py`。脚本拒绝覆盖已存在的同版本APK，并检查实际证书、包名和versionCode。当前脚本将两渠道清单生成在106公开缓存，发布前应先在staging完成实机验收，再切换清单；本次是明确标注的测试版。
5. 下载public下两渠道到本机family-releases，运行 `/tmp/minis-nas-venv/bin/python tools/publish-nas.py`。此venv是现有临时运行环境，失效时在独立venv安装smbprotocol；不要把密钥或vault内容上传NAS。
6. 两边都必须读回文件哈希，HTTPS下载须与清单大小和哈希一致；用上一版本真实安装走一遍系统覆盖更新。保留旧版本包，回退清单只能停止推荐新版本，不能绕过安卓版本降级限制。

## 当前验证边界

0.3.0-douyin已完成构建、B5证书签名与发布。个人云文件逐个读回哈希通过；外网HTTPS清单和两包下载哈希通过（沙箱外网4/4，106出口偶发抖动以沙箱为准）。真实旧版本覆盖升级已验证：redroid内 0.2.0(vc2) 经App内OTA全链路（自检→清单校验→下载→哈希→签名→未知来源授权→系统覆盖→数据保留）升到 0.3.0(vc3)，详见verification/family-ota-test.txt 2026-10-19节。实体播放、遥控器按键仍待真机验证；模拟器播放受限不作为播放功能验收依据。0.3.3起手机端提醒门槛适配抖音式UX：播放中沉默，退出播放回浏览面才提醒；忽略/稍后/每日节流均已在模拟器真实验证。

Nginx仅新增nas.zhangyue.site的/hongguo-ota/静态路径；修改前备份在106 `/opt/hongguo-analysis/family-ota/nginx-before.conf`（受控权限）。没有开放整个NAS公共空间。

## 工具

- `tools/publish-verify.py`：发布校验流水（私存读回→外网HTTPS双包哈希比对），发新版先跑它。106出口对该域名偶发抖动时，以沙箱外网执行结果为准。

## 2026-10-20 OTA签名校验致命bug修复（0.3.7 / vc10）

- 根因：ota-src-v2 的 FamilyOtaClient.verify() 用 GET_SIGNING_CERTIFICATES 取包信息，但 FamilyOta.signed() 只读旧字段 signatures（仅 GET_SIGNATURES 填充）→ Android 9+ 上更新包校验必失败，OTA 自 0.3.1 起静默死亡（0.2.0→0.3.0 成功是因 v1 用的 GET_SIGNATURES 自洽）。
- 修复：signed() 增加 API28+ signingInfo 分支（hasMultipleSigners→getApkContentsSigners，否则 getSigningCertificateHistory）；verify() 双 flag（GET_SIGNING_CERTIFICATES|GET_SIGNATURES）兜底。备份 .bak-signfix-20261020。
- E2E：模拟器 0.3.7→清单 0.3.8-e2e(vc11)→下载→修复版校验通过→系统安装成功，随后清单回退 0.3.7 并删除 0.3.8 产物。
- 坑：①构建 fast path（复用 template-*.apk）不会更新 apktool.yml 版本号，发新版必须 --family 全量构建；②sign-family-106.py 读顶层 release-config.json，与 src-work/ 的要同步；③已装 0.3.1~0.3.6 的设备内是坏校验代码，须手动装一次 0.3.7 恢复应用内更新；④apk 上传 124 后要 chmod 644（scp 600 权限会导致 nginx 403）；⑤106 本机 curl nas.zhangyue.site 回环超时是假阴性，用 124 或本机 8443+Host 头验证。
