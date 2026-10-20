# 0.8.0 发布验证记录

2026-10-20，北京时间。versionCode 19。

## 已完成

- 完整构建后生成签名 APK，ARM32/ARM64 原生库保留；zipalign 检查通过。
- 固定 B5 证书、实际包名、实际版本检查通过。手机与 LEANBACK 两个 launcher 均指向 UnifiedActivity。
- 9 项展示策略行为检查通过；OTA 状态保存恢复、记录合并/拒绝非法记录、真实搜索 HTML 解析检查通过。
- 旧手机版 vc18、旧 TV 包 vc9 的同包名签名覆盖安装已在 106 API31 测试环境通过；最终 TV 包也重新覆盖安装通过。未卸载旧包。
- 独立 ARM64/API28 手机模拟环境中，真实视频 H.264 + AAC 播放通过；第 1、2、3 集都有实际解码/首帧证据。最终发行 APK 的第 1 集首帧日志为 17:03:15。
- 暂停后 media.player 为 state(6)，播放时为 state(5)。首次真实播放达到两千余帧，非封面或静态模拟。
- 切集日志由第 2 集切到第 3 集，新的真实首帧回调出现；封面不再按固定时间强制退场。
- 播放中切横屏，进程 PID 19010 与 connId(5) 保持，解码帧数继续增加。竖屏视频在横屏中完整居中，Surface 实测边界 `[866,0][1474,1080]`。
- 收藏“雾锁情迷”后覆盖安装最终 APK，追剧页仍显示已保存 1 部；旧观看记录保留到第 3 集。
- 真实搜索词“2”通过公开搜索备用路径返回 8 部真人短剧，目录/封面可正常呈现。
- 已恢复 106 测试环境原 density=160；测试时短暂尝试的 ccodec 属性也已恢复原值 0。用户实体设备未被安装或操作。
- 下载页、mobile/latest.json、tv/latest.json 已更新为 0.8.0；从本机外网重新下载两包，比对大小与 SHA256 均通过。
- 0.7.4 源码压缩备份、旧 APK 和旧更新清单保留。正式 src-work 已同步新源码及版本配置。

## 发行物

统一主包：`site.zhangyue.hongguo.mobile`，4,982,167 字节。

SHA256：`9492032345aa6ee272c3fdfd286e2b625f3157bddef2adba7760d196ebcb0276`

旧 TV 兼容升级包：`site.zhangyue.hongguo.tv`，4,982,167 字节。

SHA256：`25b53f0e4a7f56c0461437cc3a4d0bf711354352aa83a0b6eb9d1e39be2b8679`

主下载入口：https://nas.zhangyue.site/hongguo-ota/

## 仍需如实保留的边界

- 未连接用户实际手机或实体投影，不能把 ARM 模拟器验证写成用户真机验收。实体投影的遥控和音画仍待验证。
- 个别上游片源在本轮出现 SocketTimeoutException；已验证错误会结束加载动画并提供重试，不能承诺所有片源及网络条件始终可播。
- 跨设备云同步未实现；导出/导入用于本地记录迁移。旧 TV 包与统一主包不能跨包名覆盖，兼容包作为过渡渠道保留。
- 已验证覆盖安装与清单/包体校验；本轮未从用户实际旧手机走完整的系统交互安装流程，也未验证每条音轨听感。

详细日志与截图在外层 `hongguo-audit/`：`release-playback.log`、`release-media-player.txt`、`modern-paused.png`、`release-home.png`、`release-landscape.png`、`release-https-verification.json`。

## 商店补齐与旧版真实 OTA（2026-10-20 17:17）

- 按既有 publish 流程，124 商店 apps/apps.json 的 hongguo、hongguo-tv 均从旧版本升级至 vc19；实际 APK 经 store_catalog.py 校验证书、包名、版本、大小、哈希后预览及加锁合并，其他应用保留。旧包保留。
- 商店不可变下载为 /apps/hongguo/releases/0.8.0/hongguo-0.8.0.apk 与 /apps/hongguo-tv/releases/0.8.0/hongguo-tv-0.8.0.apk。两包公网完整下载与既有 OTA 清单 SHA256/大小一致。证据外层 hongguo-audit/store-release-verification.json。
- 专属 HongguoOtaQA / emulator-5584 / ARM64 API28，安装真实旧版 0.7.4 vc18，经客户端自动发现 vc19→查看更新→下载并安装→校验通过→未知来源系统授权→系统 INSTALL→App installed，dumpsys 确认 vc19/0.8.0-unified。原有 8 项偏好键和值均保留；本轮不是用户实体手机验收，也未单独实测旧 TV 客户端全链路。
- 首页、暂停播放、选集截图来自正式包，位于外层 hongguo-audit/current-home.png、current-player.png、current-episodes.png。
- 商店目录备份在124 /root/.local/state/release-catalog-backups/20261020T171306-a37a79c7d78d.json 与 20261020T171312-1074b2b38e76.json；展示文案修改前备份在 /var/lib/download-publisher/hongguo-0.8.0/before-metadata.json。回退时只合并目标条目，不整表覆盖其他后续发布。
- 本轮完成106 OTA与124商店同步；家庭NAS私存副本本轮未核实，滴答同步未执行。账号场景不适用（本地记录，无本次新增账号服务）。

## 0.8.2 深色选集面板 / vc21（2026-10-20）

- 全量构建、B5签名、包名/版本核验通过。主包SHA256 `031383860c2ce2ecbe77f37f92c9aef0314c3985084336348dcf972154eda391`；TV兼容包 `7a25d96ed7ecf9c96dbd8436525d51adcb7916a9efa93252426cb37a5c8efe89`。两包均4,982,167字节。
- 深色底部面板、当前集红底/播放中、历史集看过；点击当前集不增加playEpisode日志。第60集打开后定位到56–85区间，当前集可见。手机正常竖屏、横屏及320dp窄屏人工截图检查通过，窄屏历史标记由四字缩为两字。
- 0.8.1曾完成0.8.0真实客户端OTA和数据保留；窄屏优化后递增到0.8.2，不覆盖旧发行文件。最终0.8.2 OTA与公网验证见同目录 JSON。
- 9项展示策略行为检查再次通过。可移植build-family.py现在调用同一完整构建，SDK路径来自环境变量；106完整入口实编译通过。窄范围设计/实现审查无阻塞问题。
- 106 OTA、下载页、124商店两渠道同步为21；旧APK与旧清单、商店目录备份保留。
- 本轮个别上游片源超时，不声称所有片源均可播放；实体手机/投影未连接，TV旧客户端OTA全链路未单独实测。家庭NAS私存、滴答本轮未同步。
- iOS：106找到其他项目ASC受控配置，直连GET /v1/apps返回200，当前无红果App；默认代理超时。红果没有iOS源码/构建/签名/描述文件/IPA或TestFlight条目。本轮不能把安卓发布当作iOS发布完成。

- 最终0.8.2第一帧日志：17:32:41.395，第2集实际解码。最终截图 docs/screenshots/082-playing-sheet.png 来自暂停真实视频后的选集面板。
