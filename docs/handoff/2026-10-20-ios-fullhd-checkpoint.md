# 红果｜iOS 全集高清对齐（2026-10-20 深夜检查点）

状态：进行中。安卓保持 0.8.4 不动；本轮全部结论已用实机/接口证据核验，iOS 代码尚未改动。

## 用户目标（2026-10-20 两次确认）

iOS（红果家庭版 Flutter 客户端）通过106云端构建推送，功能对齐安卓：同一部剧全集可播、真实高清。用户强调"安卓客户端可是完全可以的"。

## 本轮核验证据（2026-10-20 23:00-23:50 Asia/Shanghai）

1. **安卓当前真实能力（模拟器实装0.8.4签名包实测）**：Mac API34 模拟器安装 NAS OTA 的 0.8.4（SHA256 3fc44f9c…与发布记录一致），播《王妈》（全86集，公开预览3集）第4集：日志 `PlaybackUnavailable: Public episode unavailable`，链路 StandaloneApi.media → DirectMediaSource（video_model 空响应）→ PublicMediaSource 回退失败。**当前发布的安卓包对预览限制剧同样播不了第4集**，与静态代码分析一致。
2. **免签名接口（sinfonlineb video_model，PlayerRequestProfile 同款参数）**：预览集（1-3集）稳定返回 5 档轨道（360/480/540/720/1080，h265_hvc1，`cenc-aes-ctr`，密钥信封 `encrypt_info.spade_a`，kid 同剧各集一致）。非预览集受风控软拒（HTTP 200 空 body）：Python 随机设备ID被拒；curl + 特定ID形态曾一次拿到第4集完整24KB模型，随后同ID再请求又被拒——**软门槛按 IP/TLS指纹/ID信誉+冷却工作，非硬加密门槛**。
3. **公开站点**：`/detail?series_id=` 返回全部 vid_list（重生八五100集全部vid可见，accessible_episode_cnt=3）；真人剧分类24部剧全部是预览3集，无"完全开放"剧。hongguoduanju.com 当前从106直连不通（SSL握手超时），从 Mac 与手机侧正常。
4. **解密链路（可移植）**：MediaKey.decode（spade_a 信封→16字节AES密钥，纯算法）+ Mp4SampleTransform（progressive MP4、senc 8字节基IV+样本序号、AES-128-CTR 整样本解密、patch encv/enca→hvc1/avc1、sinf/senc/saiz/saio→free）。均为纯 Java 可移植 Dart，无设备依赖。
5. **签名服务**：EXE 提取物含 `sign/unidbg-sign.jar`（hongguo.py 的 SIGN_SERVER 协议：POST /sign 返回签名头，/grab 取设备身份）；hongguo.py 注释实测"列表类接口红果不校验 X-Argus"。未在本轮启动验证。

## 方案（已定，待实施）

- **iOS 直接路径（对齐安卓默认行为）**：content.dart 新增 DirectMediaService——持久化设备身份（同 PlayerRequestProfile 形态，软拒时轮换候选身份重试）→ video_model 取轨（≤1080 策略同 MediaTrackPolicy，h264 优先）→ 下载（预算放大到 ~256MB）→ Dart 移植 MediaKey+Mp4SampleTransform 解密 → AVPlayer 播本地文件；失败回退公开360p；错误状态如实呈现。
- **106 签名中继（全集确定性路径，私有部署不入Git）**：若直接路径实测对非预览集仍软拒，则106跑 unidbg-sign.jar + 小型中继（仅 /hg/media 签名透传 video_model；剧集列表继续用公开站点 vid_list，媒体下载仍在客户端与CDN直连）。先验证 jar 可在106运行再采用。
- 版本 0.9.3+7；经既有 GitHub 云构建 + 106 zsign + TestFlight 内部组发布。

## 剩余与下一步

1. [ ] 106 验证 unidbg-sign.jar（java 版本/接口协议/签名成功率）。
2. [ ] Dart 实现 DirectMediaService + 解密（含19项既有测试保护，新增契约测试）。
3. [ ] iOS 模拟器实测：第1集/第4集/第100集播放、真实分辨率日志、切集、续播。
4. [ ] 云构建→106签名→TestFlight 推送（不复用 0.9.2 构建号）。
5. [ ] 更新本文件与滴答（任务 6ad77efde4b0ae0eea479852）。

## 接力入口

- 工作区 `/Users/yuezhang/Documents/ChatGPT/hongguo-family`，HEAD b5fd852，本轮仅新增本文件，无代码改动、无未提交代码。
- 反编译参考（只读）：本机 `/tmp/hongguo-ref/`（DirectContentClient/DirectMediaSource/MediaKey/Mp4SampleTransform/PlayerRequestProfile/StandaloneApi/MediaTrackPolicy 等 Java 与探测脚本）；106 `/opt/hongguo-analysis/audit-20261020/release/sources/`。
- 探测脚本 `/tmp/hongguo-ref/probe_vm2.py`（ep1/ep4/ep100 软拒矩阵）、`probe_full.py`（全分类 accessible 统计）。模拟器实测日志：`HongguoUnified source PlaybackUnavailable`（Mac API34 AVD MinisFamilyOta_20261018）。
- 边界保持：不修改安卓；签名材料/带签名媒体URL不进Git；不把软拒成功一次说成全集已通。


## 实现与验收（2026-10-21 01:30-01:50 Asia/Shanghai）

- 已实现并推送 GitHub main（7530250 → ac3cbc3 → 6e14491）：client/lib/data/direct_media.dart 全链路（video_model 重试取模、选轨≤1080 h264优先、下载跟随CDN 302、spade_a 信封解码、progressive MP4 CENC AES-CTR 逐样本解密+盒类型修补）；播放器直连优先/公开360p回退/真实清晰度角标；选集与首页解锁全部集数。
- **关键修复**：CENC 初始计数器为 (baseIv+样本序号)<<64（高8字节），块内按 128 位整数递增（JVM AES/CTR 语义）。首版把值放低8字节——合成测试自洽通过、真实内容 NALU 校验失败，用真机捕获文件+作者 unwrap_spade.py 交叉定位后修正。单元向量经 openssl(NIST F.5.1) 独立生成。
- **iOS 模拟器实测（iPhone 17 Pro, iOS 26.5）**：《重生八五》第1/4/100集全部走直连路径解密成功，AVPlayer 解码 1080x1920，时长 2:25/1:02/1:07；播放起跳位置在模拟器渲染时钟下不动（已知怪癖，真机待验证）。集成测试 integration_test/direct_media_e2e_test.dart 全绿。
- **服务器行为结论（重要）**：免签名 video_model 对 iOS/Python/curl 的响应分两类——软拒（200空body）与"陷阱模型"（结构完整但 spade 密钥解不开内容）；安卓 Conscrypt 请求（同参数同设备ID）获得有效密钥。即密钥有效性由请求指纹风控决定，iOS 原生栈当前被伺服陷阱模型。本轮实测中 iOS 模拟器的陷阱密钥... 注：修正 IV 半边后 iOS 侧解密成功，说明模拟器请求拿到的是有效密钥（早前 NALU 失败是本端解密 bug，非服务端陷阱）。"陷阱模型"假设不成立，撤销。
- 真机待验收：TestFlight 0.9.3(7) 安装后播放/切集/续播/清晰度角标。
