# 红果｜跟版上游 1.0.26 / tv 0.5.9 优化安卓统一客户端（2026-11-10 深夜）

## 现状

用户指示：REA 解剖的红果 PC 端更新了，要求跟版优化。已完成情报收集与方案定型，尚未改代码。

- 上游桌面版最新 **1.0.26**（2026-11-10 04:04Z 发布，setup.exe sha256 `144e3522…f7ad8`，已下载 106:/opt/hongguo-up26/ 并校验官方 SHA256SUMS ✅）。
- 上游安卓 TV 线最新 **tv-v0.5.9**（2026-10-24，versionCode 19）：**官方修复了安卓端两大病灶**——①"主取源改为按本集请求批量接口并准确解析本集视频模型，修正旧单集请求为空后只能落到预览片源"；②"正式接入真人剧、漫剧关键词搜索（设备登记+同意）"。官方实测第4/5/10集真实 720p/1080p 持续播放。
- APK 已下载 106:/opt/hongguo-up26/tv059/（arm64 sha256 `ceac7f4f…41add`，arm32 `c8311b11…77051`，与官方 TV-SHA256SUMS 一致 ✅）。
- 桌面版协议细节（纯 Python，backend/*.py）：搜索已换 `GET api5-normal-sinfonlinea.fqnovel.com/reading/bookapi/search/tab/v`（SM3+medusa v3 签名帧+工作量票据选择+游客 cookie）；播放新增匿名设备注册+批量 video_model+codec 回退。已拷至 106:/opt/hongguo-up26/extracted/backend/ 与本机 /var/minis/workspace/hg26-src/ 供参照。
- 我们的工作树已恢复：106:/opt/hongguo-family-work/repo（zhangyue-site/hongguo-family，HEAD b127a8b）。当前发布态：0.8.4-unified vc23（mobile/tv，B5 家族签名），CI 产物存 106:/opt/builds/run-39*/hongguo-signed-{3,4}。

## 关键证据

- 0.8.4 病灶（既有交接）：搜索 POST /novelfm/bookmall/search/page/v1 返回 200 空响应；非预览集 video_model 空响应软拒 → 只能放公开 360p 预览/前3集。
- 上游 zhangbaio/hongguo 源码仓 2026-07-14 冻结（5f8a58d），1.0.18~1.0.26 的 API 修复只存在于编译后 EXE 与 tv-0.5.9 APK。
- 第三方源码 zip 自 1.0.19 起字节数不变（纯第三方依赖），不含作者业务代码。
- hongguoduanju.com（SSR 回退源）：106 出口 TLS 被掐（000），R5C 家宽出口 200 正常 —— 客户端在家用 WiFi 上 SSR 仍可用。
- OTA 清单 https://nas.zhangyue.site/hongguo-ota/ 当前 **404**：NAS 公共空间红果目录在 11-10 大迁移中丢失/移动，需在发版时一并恢复。

## 方案（已定）

基座替换：安卓统一客户端引擎从 0.5.8 → **0.5.9**（同作者同血统，含搜索+批量取源修复），保留我们 site.zhangyue.hongguo.mobile 包名、UnifiedActivity 统一 UI、FamilyOta 升级链与 B5 签名。

1. apktool 解包 pristine tv-0.5.8 arm64（106:/var/lib/rea/workspace/hongguo-ios-compat/original-tv.apk，4092959B）与 tv-0.5.9 arm64。
2. diff(0.5.8 pristine ↔ 我们 mobile-decoded) 提取我方补丁集；diff(0.5.8 ↔ 0.5.9) 提取上游变更集。
3. 新基座 = 0.5.9 + 我方补丁（包名/UnifiedActivity 入口/LEANBACK/FamilyOta/版本号）；mobile-src Java 与上游新类名/方法签名冲突逐个核对。
4. build-family-106.py --family 构建 0.8.5-unified vc24（release-config.json + build 脚本 versionCode 同步）。
5. 106 签名（tools/sign-family-106.py，B5 密钥在 vault）→ publish-nas.py + publish-verify.py；**先恢复 NAS 红果 OTA 目录**再切清单。
6. 验收：redroid API31 装包冷启动；签名接口从 106 出口实测搜索与批量取源（SSR 出口受限不影响）；实体手机/投影覆盖升级与真实播放由用户验收。
7. 文档与知识库：更新 repo README/release/VERIFICATION.md，rea-knowledge-inbox 写脱敏报告（自动同步），本文件与滴答同步。

## 已完成（2026-11-10 深夜）

- [x] 基座更换 0.5.8→0.5.9 + 手补丁重放（AppOrigin/UpdateClient.architecture；sourceFailure 双参上游已自带）
- [x] 构建脚本锚点动态化（playEpisode 首帧 lambda 按函数体定位；arm32 指向 0.5.9）
- [x] stub 扩面（Catalog.requiresSearchSetup/activateSearch、playEpisode(IJZ)）+ UnifiedActivity 覆写迁移到 (IJZ) + 搜索登记一次性同意 UX
- [x] 0.8.5-unified vc24 构建 + B5 签名 + dex 接线验证 + OTA 发布（含 0.8.4 回滚与下载页）
- [x] rebase-tv059 分支推送 GitHub

## 还缺什么

- [ ] 用户实体手机 0.8.4→0.8.5 覆盖升级 + 真实搜索/播放验收（OTA 已就绪）
- [ ] 124 商店两渠道从 0.8.2(vc21) 同步到 0.8.5(vc24)
- [ ] iOS Flutter client（client/lib/data/content.dart）同样受益于上游协议修复，另行立项
- [ ] 澄清：OTA 由 106 本地 /opt/hongguo-analysis/family-ota/public 直接服务（非 NAS），磁盘清理时不得再删该目录

## 边界

- 不动 iOS Flutter client（用户此前已单独划范围）。
- 签名材料、带签名媒体 URL、账号凭据不入 Git/聊天。
- 模拟器验收不冒充实机验收；上游登记接口的服务端行为不受我们控制，如实呈现。
