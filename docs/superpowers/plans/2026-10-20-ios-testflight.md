# 红果 iOS / TestFlight Implementation Plan

**Goal:** 交付与安卓统一视觉的真实 iOS 客户端、可编译代码和 TestFlight 外部测试发行。

**Architecture:** Flutter 共用目录、播放、选集UI与本地收藏/历史，video_player使用iOS AVPlayer及Android原生播放器；独立内容接口层复用现有公开目录/剧集来源，先验证数据契约再做界面。106保留ASC凭据、分发证书和描述文件，通过既有GitHub macOS编译链构建iOS，106签名/上传；仓库只包含源码和公开构建说明。

**Tech Stack:** Flutter、Dart、video_player、Xcode、106 App Store Connect API、GitHub Actions。

- [ ] 验证公开目录/剧集/视频数据契约，确保iOS可播。
- [ ] Flutter共享首页、搜索/分类、收藏历史和深色当前集面板。
- [ ] 播放进度、暂停/续播、切集、错误/重试和安全区。
- [ ] iPhone模拟器编译、实际数据/视频及页面截图验证。
- [ ] 核实现有证书权限，注册独立BundleID、创建App Store分发描述文件。
- [ ] GitHub macOS构建，106受控签名与上传，核对处理状态。
- [ ] TestFlight测试资料、外部组和可分享入口；需要苹果审核则如实记录等待状态。
- [ ] 源码和无密钥发布证据提交到同一个hongguo-family仓库。
