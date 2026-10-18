# 红果 · 乐天安卓适配

私人协作项目：手机竖屏适配、盒子/投影横屏适配，以及独立应用内 OTA。当前发布版本 **0.2.0-family-beta / versionCode 2**。

本项目基于「渠道有数」发布的第三方 Hongguo TV 0.5.8 APK；不是红果官方客户端，也不是原作者发行。本仓库保存解包后的 smali/资源工程与新增 Java 源码，不冒充完整原生 Android 上游源码。

## 当前状态

- 已构建手机和盒子 ARM32/ARM64 通用测试包，使用两个独立包名与既有乐天 B5 家族证书。
- 已接入检查更新、下载大小/SHA-256/包名/版本/签名校验和系统安装入口。
- 两包在 Android 12 redroid 安装、冷启动通过；17 项 OTA 输入校验通过；个人云和外网完整 APK 哈希校验通过。
- **尚未完成实体 ARM 播放、遥控、版本覆盖升级验收。** 先前模拟播放报 `No supported media track within budget`，不能声称已解决。
- Play5（用户提供 6.17.100.03、VF）尚未开启 ADB，也尚未安装本项目；已分析的官网 VF 历史固件未解开封装，未确认与屏显版本对应。未刷机。

## 安装与更新

- 下载入口：<https://nas.zhangyue.site/hongguo-ota/>
- 首次本地安装：联想个人云 **公共空间 → 红果 → 红果-盒子-0.2.0.apk**。
- 手机包名：`site.zhangyue.hongguo.mobile`；盒子包名：`site.zhangyue.hongguo.tv`。
- 私人仓库的 Releases 也保存当前两份测试包、更新清单与校验值。
- 新包与原作者版本、旧个人手机版使用不同包名，可共存；旧数据不会自动迁移。
- 以后更新仍需安卓系统确认安装。个人云存包，106 提供 HTTPS 更新入口与指定发行包缓存。

## 构建

需要 JDK 17、Android SDK platform 35、build-tools 35.0.0，以及 Python 3。脚本优先使用 `ANDROID_SDK_ROOT` 或 `ANDROID_HOME`；macOS 默认使用 `$HOME/Library/Android/sdk`。

```sh
python3 build-family.py
```

输出位于忽略的 `family-build/`，为未签名安装包。`mobile-stubs` 仅供编译，构建不会把 MainActivity stub 放入 APK。`android/mobile-decoded` 保存修改后的基础工程；构建时分别生成手机、盒子 Manifest，并合入独立新增 dex 与 ARM32 库。

发版前修改 `release-config.json`，严格增加 `versionCode` 并使用新文件名。签名可由 106 现有环境执行，也可按下方协作流程打包；签名私钥与密码不写入 Git 历史。请参阅 [OTA 运维说明](docs/OTA.md)。脚本不会自动把新构建升级为已验收版本。

## 目录

- `mobile-src`：竖屏、底部导航、双列海报与诊断代码。
- `ota-src`：两个渠道共用的更新校验、下载与系统安装逻辑。
- `android/mobile-decoded`：基础 smali、资源、原生库与原作者许可/来源说明。
- `tools`：106 签名、NAS 发布、VF 历史固件静态分析脚本；依赖本人运行环境。
- `verification`：OTA 输入验证及测试结果。
- `docs/handoff`：持续交接与验证边界。

## 来源与许可

原作者：**渠道有数及贡献者**。原发行仓库：<https://github.com/waligoraamodio288-rgb/hongguo-desktop-releases>。

保留 `android/mobile-decoded/assets/ORIGIN-NOTICE.txt`、`APACHE-2.0.txt`、`JNA-LICENSE.txt` 和个人修改说明。Apache-2.0 文本对应第三方组件 JNA，不据此宣称整个原应用由 Apache-2.0 授权。品牌、剧集和海报等权利归各自权利方所有。

附带构建工具 apktool 3.0.3 来自 <https://github.com/iBotPeaches/Apktool>。Windows 原安装包、完整运行时、投影固件、私钥和密码均不纳入 Git 源码历史。按仓库所有者明确授权，加密 keystore 作为私人 Release 附件共享，密码存仓库 Actions Secret。

## 合作者同签名打包

仓库所有者已授权共享现有乐天B5签名。加密签名文件和Actions Secret已上传。当前OAuth授权缺少workflow权限，**工作流尚未启用**。接受邀请后，在GitHub网页 **Actions → New workflow → set up a workflow yourself**，将 [流程模板](docs/workflows/build-signed.yml) 保存为 `.github/workflows/build-signed.yml` 并提交。随后打开 **Actions → Build signed Android APKs → Run workflow**；成功后下载该次运行的 `hongguo-signed-*` Artifact，包含手机/投影 APK、两个渠道清单和校验值。该云端流程尚未实跑验收。

- 加密密钥：[私人 Release 附件 hongguo-family.keystore](https://github.com/xiaoletian64/hongguo-family/releases/tag/v0.2.0-family-beta)，别名 `notesvault`。
- 密码：仓库 Actions Secret `HONGGUO_STORE_PASSWORD`，自动注入签名步骤，不显示在日志。
- 构建脚本：`build-family.py`；独立跨机器签名脚本：`tools/sign-family.py`，密码从同名环境变量读取。
- 证书 SHA256：`b5aaac0eb0369165d34ee3bae1cddd637eaa2bc3566adf9e3f2dc2f5a1a473e4`；签名后会检查证书、包名、版本。
- 模板启用后只手动触发并生成候选包，不会自动发布到个人云或106，不会替换现有版本。正式发新版本前必须增加 release-config.json 中的 versionCode/versionName 并验收。
