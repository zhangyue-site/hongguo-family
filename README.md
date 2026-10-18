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

需要 JDK 17、Android SDK platform 35、build-tools 35.0.0，以及 Python 3。当前脚本使用 macOS SDK 默认位置 `$HOME/Library/Android/sdk`，其他机器需调整脚本中的 `S`。

```sh
python3 build-family.py
```

输出位于忽略的 `family-build/`，为未签名安装包。`mobile-stubs` 仅供编译，构建不会把 MainActivity stub 放入 APK。`android/mobile-decoded` 保存修改后的基础工程；构建时分别生成手机、盒子 Manifest，并合入独立新增 dex 与 ARM32 库。

发版前修改 `release-config.json`，严格增加 `versionCode` 并使用新文件名。签名由 106 现有受控环境执行，私钥与签名密码不在 Git 中；请参阅 [OTA 运维说明](docs/OTA.md)。脚本不会自动把新构建升级为已验收版本。

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

附带构建工具 apktool 3.0.3 来自 <https://github.com/iBotPeaches/Apktool>。Windows 原安装包、完整运行时、投影固件、私钥和密码均不纳入仓库。
