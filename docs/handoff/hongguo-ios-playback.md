# 红果｜iOS 对齐安卓播放入口

> 🔴 受阻 · 更新：2026-10-20 22:47 Asia/Shanghai
>
> 已定位仓库及当前实现；尚未实现全集高清播放，缺少可正常接入的全集播放接口或官方 DRM 播放服务。

## 本轮核验

- Codex 桌面会话接手；仓库 https://github.com/xiaoletian64/hongguo-family ，main，HEAD b5fd85257dfea0a2664085a174071bb8efe17720；克隆后工作区干净，无他人未提交改动。
- `client/lib/data/content.dart` 只请求 hongguoduanju.com 公开页面，根据 accessible_episode_cnt 生成可播放状态；mediaURL 检查 publicVideoSeo 并提取公开 MP4。
- `client/lib/ui/player_page.dart` 使用 video_player，未开放集数在进入播放器前也会被拦截。
- 历史证据：`2026-10-20-ios-hd-resume.md`、`docs/ios/quality-0.9.1.md` 记载目标剧前3集360p；安卓全集来源涉及 CENC 加密和离线解密。该服务本轮未重新探测，历史验收不算本轮实测。
- 用户目标：苹果客户端通过与安卓相同的入口正常播放。沿用既有仅修改 iOS/Flutter 范围，安卓保持不变。

## 待处理

- [ ] 提供可正常使用的全集视频接口、非受保护的测试片源，或官方 DRM SDK/许可证服务后接入。
- [ ] 验证首集、第4集、中间集、末集，实际分辨率、切集及续播；完成前不发布新版。
- [ ] 本轮无产品代码变更、未构建、未运行播放测试；不宣称修复成功。

## 下一步

取得接口文档和必要接入配置，先验证一集预览范围以外的媒体可由 iOS 正常播放，再实现内容服务适配。不能通过移植绕过保护的离线解密完成目标。

## 接力入口

- 工作区：`/Users/yuezhang/Documents/ChatGPT/hongguo-family`
- 当前仅本交接文件未提交；无运行中的构建或发布，无提交或推送。
- 稳定任务键：`hongguo-ios-full-hd`；滴答任务：`6ad77efde4b0ae0eea479852`；同步已读回验证（verified:true）。
- 保存/代码核验：2026-10-20 22:47 Asia/Shanghai；最后成功同步：2026-10-20 22:47 Asia/Shanghai。

## 安卓实际代码复核（2026-10-20，Codex 本轮续查）

用户说明现有安卓客户端已经完整可用；这是用户实测陈述，本轮未连接实体设备重复验收。

- 已读仓库实际 smali，修正此前将桌面 EXE 后端与安卓默认链路混同的描述。MainActivity.onCreate 调用 Api.local，反射构造 StandaloneApi；仅本地实现不可用时才退回普通 Api。
- StandaloneApi.load 调用 DirectContentClient.episodes 获取剧集列表；media 路径调用 DirectContentClient.mediaModel 和 DirectMediaSource.prepare。
- MediaTrackPolicy 按解码能力、尺寸/资源预算与画质上限选轨；支持480/720/1080上限和自动模式，具体实际分辨率仍需播放验收。
- DirectMediaSource 在本地缓存媒体，包含受保护样本处理分支。MainActivity 接收 Api.Source，本地文件交给 MediaPlayer.setDataSource；网络源另带 headers，随后 prepareAsync。
- PublicMediaSource 为另一条公开预览路径，不能代表安卓默认完整媒体实现。iOS ContentService 目前仅有这类公开网页路径。
- 本轮结论来自静态代码；没有宣称安卓/苹果实体设备新验收，没有产品代码修改。继续接入仍须正常可用的媒体服务或官方 DRM 播放方案，不移植绕过保护路径。

证据入口：android/mobile-decoded/smali/cn/hongguo/tv/{MainActivity,Api,StandaloneApi,DirectMediaSource,MediaTrackPolicy}.smali。
