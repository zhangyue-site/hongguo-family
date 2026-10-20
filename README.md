# 红果 · 手机与投影统一适配

当前正式分发：**0.8.4-unified / versionCode 23**。主包 `site.zhangyue.hongguo.mobile` 自动适配手机触控和投影遥控；旧 TV 包保留同版本兼容升级渠道。

基于渠道有数第三方安卓端的个人适配，非红果官方发行。仓库包含解包后的基础 smali/资源与新增 Java 代码，保留原许可和来源说明。

## 本次改动

保留深色底部选集面板与当前集标记；新增跨剧场简称搜索，修复状态栏、导航栏及刘海安全区遮挡。后续工作仅限 iOS 全集高清接入，安卓停止改动。接续请先读 [当前交接](docs/handoff/2026-10-20-ios-hd-resume.md)。

## 下载与验证

- [应用商店](https://d.zhangyue.site/) / [OTA 下载页](https://nas.zhangyue.site/hongguo-ota/)
- 旧版可从“我的 → 检查更新”升级，保留同包名数据；不要先卸载。
- 具体包哈希、测试与限制见 [发布记录](release/VERIFICATION.md)。模拟器验收不代表用户实体手机/投影验收。
- 新增 `client/` Flutter 跨平台客户端，共享 iOS/Android 手机界面；云端编译、106签名与 TestFlight 发布脚本在 `tools/ios/`。当前 iOS 0.9.2(6) 已在 TestFlight 内部组开放；《重生八五》当前来源仍只有前3集、360p，全集高清尚未完成。安卓 OTA 清单为 0.8.4，商店同步及该版本真实客户端 OTA 验收状态见交接。

## 构建

JDK 17、Python 3、Android SDK platform 35 / build-tools 35.0.0。设置 `ANDROID_SDK_ROOT` 或 `ANDROID_HOME` 后运行：

```sh
python3 build-family.py
```

完整构建默认启用 `--family`，产物在忽略的 `family-build/`。106可用 `HONGGUO_ANDROID_API=34 python3 build-family-106.py --family` 复用既有SDK。

签名凭据留在受控环境，不进入本仓库。正式发行包来自106签名暂存，GitHub Releases保存同一包体；CI生成的候选不能静默替换已发布版本。详见 [OTA流程](docs/OTA.md) 与 [修复说明](README-REPAIR.md)。
