# 回家接续：iOS 全集高清（2026-10-20，北京时间）

## 用户最终范围

唯一目标：iOS 同一部剧能播放与现有原生安卓相同的全部集数，并达到真实高清。安卓不要继续修改。配置清单、界面优化、自动选画质、前3集预览均不能算目标完成。不要为无关改动继续发布。

## 已发布及已验证

- iOS 0.9.2(6)：106协调GitHub云端构建，106签名、Apple API上传，内部状态IN_BETA_TESTING；构建ID `e514392b-ec20-4bb9-b622-c2dd83ae2c85`。源提交 `f76f2701de2e1e6dde0e650db00a3f286a268aa5`；云构建运行39418846786。签名IPA SHA256 `ed1211d41d312f73826e29398a56f81c0ea7444b9dc245afb97cede4c5a655d6`。
- 固定内部测试名单沿用账号私有配置，发布完成适配器已同步；不启用外部测试，不提交App Store。真实邮箱、Apple/GitHub凭据和签名材料不入Git。
- iOS模拟器：《王妈》和《重生八五》实际播放、暂停、切第2集、保存8秒以上进度、销毁应用并重建后的续播通过。`flutter analyze`通过；包含在线内容契约的19项测试通过。这证明当前公开预览链路，不证明全集或高清。
- Flutter安卓预览包启动白屏已修复：R8遗漏JNI动态引用的Kotlin协程/Result边界。云端0.9.2(5)发布APK在专用API28 ARM64模拟器实际启动/播放/切第2集/强制关闭续播验证通过。该预览包与正式安卓包名不同。
- 原生安卓0.8.3(v22)修复简称及跨剧场搜索，0.8.4(v23)补系统栏/刘海安全区。两渠道已在106签名并切换OTA清单。手机包0.8.2→0.8.3→0.8.4覆盖升级，收藏/历史保持；普通竖屏、模拟刘海及横屏的标题和导航操作均未越过系统安全边界。尚未连接Android15实体手机；切换模拟刘海/旋转时API28模拟器SystemUI曾自行崩溃重启，应用进程未崩溃，不能把这些测试说成实体设备全面通过。
- 0.8.4 mobile SHA256 `3fc44f9c554ce720c61b3c90017eb7502ccd280cdc69324eafec9065260896ed`；tv SHA256 `5272460d2b2f05051412ece50bb8a45c437a24719b10e5770bae4cfaba2a45e2`。原B5家族签名，versionCode23。
- **未完成**：0.8.4应用商店同步、NAS独立落盘、GitHub Release二进制附件及0.8.4真实旧客户端完整OTA流程验收。`publish-store-083.py`和`publish-store-084.py`已保存但未执行。用户随后明确安卓不用再动，保留当前状态，不擅自恢复安卓发布工作。

## iOS全集高清仍未完成

目标剧：《重生八五，靠购物返现系统赢麻了》，series_id `7694648775943392280`，100集。搜索“重生85”能找到。来源将其归类为漫剧（genre205），原先真人剧过滤导致漏搜，已经修复。

当前Flutter内容服务只接网页公开播放，前3集可播，实际360p。公开720p/1080p路径实测404。不能编造高清地址，不能把分辨率标签或自动选源当作实播高清。

106原生安卓视频模型的元数据包含360/480/540/720/1080档，但所查轨道为bytevc1、CENC加密；EXE提取后端的/play返回加密CDN地址，/stream调用离线解密后输出视频。该解锁路径未移植到iOS，也不应以绕过保护完成目标。仍需可授权使用的全集高清接口、播放服务或官方许可SDK。

REA已只读检查原APK和EXE。EXE的SHA256为 `28d8aa65584486d10e6525da205cb042b67d1a41adfaf39897a8d4ddd5acae67`。静态证据、包含签名媒体URL的探测结果只留106私有目录，不上传GitHub。

## 用户指定参考：CM

用户确认参考仓库是私有 [YangLuSE/cmsplayer](https://github.com/YangLuSE/cmsplayer)。只读分析，没有将它的私有源码复制进本项目或公开技能。

- iOS播放位于 `Sources/iOS/iOSDetailView.swift`：AVPlayer、AVURLAsset、逐集解析URL，按来源携带User-Agent和会话Cookie。
- `Sources/CMSPlayer/Api/Api.swift`：支持MacCMS JSON、若干HTML模板及配置解析前缀，取得普通视频/HLS地址后交给原生播放器。
- `Sources/CMSPlayer/Api/SiteStore.swift`：站点来自用户本地/iCloud配置，缺配置返回空列表；仓库并没有附带可验证的红果全集高清站点。
- 所查iOS链路没有红果授权SDK或对应CENC处理。CM播放器能播放自身来源，不等于已经解决红果正片来源。
- 用户曾提出仿照CM配置清单，随后明确仅iOS、最终只要全集高清；尚未新增配置UI或伪造片源，也未接入实际CMS站点。

## 接续位置

代码入口：`client/lib/data/content.dart`、`client/lib/ui/player_page.dart`；服务器只读参考在 `/opt/hongguo-analysis/references/cmsplayer`。原EXE/提取源码在106 `/opt/hongguo-analysis/1.0.11/`，REA受控工作区 `/var/lib/rea/workspace/hongguo-exe-review/`。不要输出或提交原接口签名密钥、加密参数、临时CDN签名URL。

用户只允许106通过API提交GitHub/Apple。复用 `server-testflight` 技能和现有106协调器，实际播放/切集/续播及高清验收通过后才发布与目标有关的iOS新版。私有服务器状态在 `/opt/hongguo-analysis/server-releases/0.9.2-6/`；不要重新分配同一构建号或重复上传。
