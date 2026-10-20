# 红果家庭版 · Flutter 客户端

iOS与Android共用目录、搜索、播放、深色选集、收藏和观看进度代码。公开源未开放的剧集显示锁定，不绕过内容访问权限。收藏与历史只保存在本机。

iOS Bundle ID: `site.zhangyue.hongguo.ios`。Android预览包：`site.zhangyue.hongguo.preview`，与正式安卓0.8.2并存；此预览不切换现有OTA。没有宣称旧安卓记录会自动迁入新包。

构建使用Flutter3.44.0。正式云构建见仓库 `.github/workflows/flutter-client.yml`，iOS在GitHub macOS/Xcode26.3构建，106签名及上传Apple，私钥不入GitHub。最低iOS15。

```sh
flutter pub get
flutter analyze
flutter test
flutter build apk --release
flutter build ios --release --no-codesign
```

真实iPhone模拟器旅程（会清空该专属测试安装的本地记录；只在隔离测试设备运行）：

```sh
flutter drive --driver=test_driver/integration.dart --target=integration_test/app_test.dart -d DEVICE_ID
```

真实网络契约检查见test/fixtures/README.md。iOS测试与发布状态见仓库release目录，未将上传成功等同于外部TestFlight审核通过。
