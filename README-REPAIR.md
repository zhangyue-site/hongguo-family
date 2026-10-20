# 红果 0.8.0 统一版

目标：修复手机版不能正常观看的问题，统一手机与投影的实现、版本和升级体验。

主安装包保留 `site.zhangyue.hongguo.mobile` 与原 B5 签名，versionCode 19。手机与 LEANBACK 启动入口均进入 `UnifiedActivity`。原独立 TV 包 `site.zhangyue.hongguo.tv` 提供同版本兼容升级，不能跨包名直接覆盖；可导出/导入收藏与观看记录迁入主包。

## 实现

- 新的共享浏览页：推荐、剧场、追剧、我的；按窗口宽度排版，自动识别电视并提供手动显示模式。
- 新播放器展示层：透明控制、中央播放/暂停、轻量进度/选集/倍速；加载封面以真实首帧回调退场，失败显示重试。
- 保留原媒体引擎及签名客户端，不再使用旧的全屏 FeedPager 与强制隐藏错误提示循环。每次跨剧传入完整 series + episodes。
- 同剧上下滑切集，前后 15 秒、暂停、选集、续播；旋转重算完整画面比例。
- 公开网页 SSR 搜索作为旧搜索 API 200 空响应时的备用路径。没有添加账号同步、伪造分页或片源权限绕过。
- 封面磁盘缓存、取消过期请求、保留较新本地进度的有界记录导入。
- 修正 OTA 状态序列化字段与 Android 5–8 的版本读取；固定证书校验仍保留。

## 构建

106 构建依赖现有 `/opt/android-sdk`，不依赖终端 Flutter。完整构建：

```sh
python3 build-family-106.py --family
```

修改版本号、smali 或 Manifest 后必须完整构建，不能用旧模板的快速路径。普通 Java 展示层修改可使用 `python3 build-family-106.py`。

`mobile-stubs/` 仅用于编译，构建脚本明确排除其 class，不进入 dex。原始引擎仍来自 `android/mobile-decoded/smali/`。

签名只在 106 上进行，密钥始终留在现有 vault。`tools/sign-staging-106.py` 是本次隔离目录的签名脚本，不切换线上清单。未来发行使用现有签名流程，在更新 APK 前保留旧清单及源码快照，先验收再原子切换清单。

## 验证与边界

- `verification/PresentationPolicyTest.java`：设备选择、手机/平板列数、横竖视频 contain 比例与零尺寸防护。
- `verification/DataContractTest.java`：OTA 保存恢复、迁移合并、非法 ID 拒绝、真实搜索 HTML 解析。
- 106 Android API31：旧手机包 vc18、旧 TV 包 vc9 的覆盖安装路径，包名/版本/签名保持；该环境没有可枚举视频解码器，不作为播放验收依据。
- 本机独立 `HongguoRepairQA` ARM64 Android API28：真实视频 H.264/AAC 解码、首帧、暂停、切集、续播、搜索、收藏保留及横竖屏操作验证。运行中播放器截图及日志保存在项目外层 `hongguo-audit/`。
- 尚未连接用户实际手机或实体投影。模拟环境的通过不能保证每种手机 ROM/解码器表现；实体投影遥控与播放仍待实机验收。

审计原始记录见项目外层 `hongguo-audit/审计与统一版本方案.md`。0.7.4 源码及公开旧 APK 已保留，回退清单只能停止推荐新版，不能绕过 Android 版本降级规则。
