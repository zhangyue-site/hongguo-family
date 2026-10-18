# 红果｜适配安卓手机并验证安卓盒子

现状：进行中。安装包已上传106并静态解包；手机适配包已签名、构建、安装、启动并加载真实目录和双列封面。点击剧目后资源获取/准备失败，尚未通过实际播放验收。
目标：手机竖屏触控与安卓盒子遥控两端可浏览、选集和播放。

## 本轮已核验
- 原文件是Windows NSIS安装包，非APK。SHA256: 28d8aa65584486d10e6525da205cb042b67d1a41adfaf39897a8d4ddd5acae67。
- 已上传 root@106.52.123.149:/opt/hongguo-analysis/1.0.11/input/，哈希一致。本机完整解包在1.0.11/extracted；服务器 extracted-sources 保存去除Windows Python/JRE等运行时的源码与主体。
- 第三方作者渠道有数，发行仓库 https://github.com/waligoraamodio288-rgb/hongguo-desktop-releases 。包内引用源码 https://github.com/zhangbaio/hongguo 。已克隆upstream-hongguo，HEAD 5f8a58d，工作区干净。该上游仓库不含安卓UI源码。
- 找到同作者安卓盒子APK 0.5.8，ARM32/ARM64原包保留原签名和许可；未声称由本次重写。
- 手机个人适配基于该安卓包的smali与独立新增MobileActivity.java；独立包名cn.yue.hongguo.mobile与签名，保留原作者署名，来源提示如实写个人适配版。禁用原版更新检查，避免不同签名混装。
- 手机布局实现竖屏、底部导航、双列海报、横向操作栏；合并ARM32/64原生组件。源码mobile-src、mobile-stubs、android/mobile-decoded；构建脚本build-mobile.py。编译stub不进入APK。
- artifacts/Hongguo-Mobile-0.1.0-arm-universal.apk SHA256 b99bc84efd3796b26e63f6906a88c048ca10f8ed9cce0596a86e0d37276facbf；签名SHA256 31ce25fa09ca18264003975885cd5aaa6c294b240bc600f633ae0f149f734363。
- 手机首次海报布局改动曾产生重复嵌套；已用mobile-card-row标记修复并重新安装最终包，最终首页双列截图artifacts/mobile-home.png。
- 106 redroid测试设备127.0.0.1:15555，x86_64+ARM64翻译支持。原有代理导致目录不可用；短暂测试直连后真实目录正常，每次finally恢复原代理。不可把模拟环境测试视为实体ARM手机/遥控/音画验收。
- 当前手机点击真实剧目后进入播放器，但显示“播放资源获取或准备失败，请重试”。下一步需在同网络对照原版盒子包并记录底层异常。MainActivity.sourceFailure(MediaPlayer, Exception)当前丢弃了详细异常。

## 恢复入口与剩余
1. 先读本交接与verification/test-mobile.py、MainActivity.java第2510行附近，获取sourceFailure真实异常，判断签名/网络/ARM翻译/媒体兼容原因。日志不要记录密钥和完整媒体URL。
2. 对照未修改的盒子原包；手机和盒子播放、切集、续播未验收。32位原生库组合尚未在ARM32设备运行。
3. 服务器redroid可能同时被别的开发任务使用；不要控制无关应用，不长期修改全局代理。
4. 本机signing保留独立签名私钥用于后续升级，不将其打入源码包或公开目录。
5. 源码包artifacts/hongguo-mobile-source-0.1.0.tgz；APK、来源、校验和在artifacts及服务器/opt/hongguo-analysis/1.0.11。

## 同步
稳定任务键：hongguo-android-phone-box-20261018
快照与代码核验时间：2026-10-18 12:24 Asia/Shanghai
最后成功同步：2026-10-18 12:27:52 Asia/Shanghai；滴答任务6ad449f7e4b0fc223bbc4126，状态进行中，已读回核验。
下一改动单元：为手机资源准备失败补充去除URL的诊断日志，并对照原版盒子播放。
本任务是独立分析目录，无本地git提交；原波波攒项目未改动。

## 最新核验 2026-10-18T12:27:02+08:00
- 手机新增去URL的sourceFailure诊断，并修复prepareSource捕获异常时丢失异常对象的问题；源码可构建，签名校验通过。最终手机APK SHA256 b99bc84efd3796b26e63f6906a88c048ca10f8ed9cce0596a86e0d37276facbf。
- 手机最终包安装后真实目录和双列海报成功，点击真实剧目失败；日志为 java.io.IOException: No supported media track within budget，来自 MediaTrackPolicy.choose，经DirectMediaSource/PublicMediaSource链返回。不能断言唯一原因是硬件，仍可能是轨道尺寸/预算等兼容限制。redroid没有media.codec服务。
- 对照原版盒子0.5.8 ARM64：直连网络真实目录与封面成功，点击同剧也出现同样的通用资源准备失败；不能算播放通过。原版没有具体异常日志。
- 每次临时直连测试都在finally恢复172.17.0.1:18889；未保留全局网络变更。
- verification/test-box.py为盒子对照脚本；服务器/opt/hongguo-analysis/verification保存截图和XML。下一步应在真实ARM手机和安卓盒子验证对应ABI包的解码能力与播放，不把模拟环境失败包装成完成。
- 当前状态：待实机验证；滴答任务保持未完成。实体型号和连接未提供。
- 全量Windows运行时已补齐上传并解包，服务器extracted-sources为完整解包目录（含Python/JRE、插件与主体）。

- 完整解包交叉校验：本机4033个文件在106均存在且SHA256一致，mismatches=[]。
- 滴答任务已更新至最新验证结果并读回，status=0保持未完成，等待实体设备型号/ADB信息。

## 继续实机验证 2026-10-18T12:32:47+08:00
用户指定81服务器和局域网极米作为验证资源，授权继续核对及测试。旧记录极米Play5固定IP192.168.6.224，81地址在106 SSH配置为81.71.127.221（本轮尚未连通核验）。本机ADB无设备且直连极米5555未通；下一步核对81环境与R5C局域网链路。手机APK代码未变化；实体播放仍未验收。

## 本轮连接核验 2026-10-18T12:34:20+08:00
- 极米Play5目标192.168.6.224：本机ping成功，8080 HTTP在线。少量已知服务端口检查仅8080开放，5555/5554/5556/9222等ADB常用入口未开放。8080网页JS只有addImg/screenAlignment，为校正页面，不冒充应用安装入口，未调用其写操作。
- 本机adb devices为空；没有安装APK或控制投影画面。已请用户在极米开启ADB/网络调试并提供显示端口/授权提示。极米适合盒子版验收，不能替代手机触控实机验收。
- 81.71.127.221由106 SSH别名orion确认；106直连其22端口超时，本机TCP22也未连通。未改服务器/路由配置，未重启服务。81当前环境尚未读取。
- 下一步：用户开通ADB后连接准确极米IP与端口，先读取型号、Android版本、ABI和现有同包应用签名；匹配ARM32/64原盒子包安装，再进行实际播放和遥控验证。未知签名不能先卸载。

本轮最后成功同步：2026-10-18 12:34:36 Asia/Shanghai，滴答任务6ad449f7e4b0fc223bbc4126已读回核验；等待极米ADB开启，未完成。

## Play5 ADB入口调查 2026-10-18T12:37:08+08:00
用户明确Play5设置内未找到ADB。纠正此前通用开发者选项入口未经型号核验的问题。查到原作者实测的旧Play标准版（非Play5）教程 https://www.znds.com/tv-1223269-1-1.html ，其中为系统信息页长按左键进入工厂菜单，第二页ADB；该旧机型入口不能当作Play5当前固件确认事实，不执行其刷机/删系统应用步骤。尚未找到Play5官方ADB开启说明。下一步请用户提供系统信息页照片及系统版本，确认入口；当前不修改系统或刷机。手机/盒子播放验收仍未完成。

## Play5专属资料复查 2026-10-18T12:43:51+08:00
用户已实测系统信息长按左键无反应，明确禁止再套旧款方法；该方法对当前实机无效。仅查Play5、XN03A与极米官方源。官网 https://order.xgimi.com/host_list 的公开allHost接口确认Play5机型id132，说明书 https://file02.xgimi.com/xgimi/mall/official/d8d61631fd004cd5a11620ff1dce513c.pdf 。已下载并渲染人工核对，1页折页手册不含ADB或开发者选项。官方hostEdition/132接口列出WN开头V2.5.3与VF开头V1.3.19两个固件条目，不能当作最新版本，也不能据此证明ADB已永久禁用。公开检索没有找到Play5对应当前系统的可复核ADB开启步骤；不提供猜测按键或刷机/降级步骤。下一步需用户提供系统版本及SN前两位（其余隐藏），按批次核对官方支持；当前未改设备、APK或系统。研究证据在verification/xgimi/official-hosts.json、play5-official-firmware.json、Play5-official-manual.pdf/png。

本轮研究结论已于2026-10-18 12:43:54 Asia/Shanghai同步既有滴答任务并读回核验；待系统版本和SN前两位，任务未完成。

## 局域网读取核验 2026-10-18T12:46:38+08:00
用户提供Play5系统信息6.17.100.03，SN前两位VF（只记录所需前缀，不复制更多SN字符）。这些值来自用户，并非本次网络读回。局域网192.168.6.224:8080再次HTTP200；页面JS为图像上传/校正界面，没有发现版本或SN查询接口。对该准确IP发送标准SSDP只读发现请求，3秒内0响应，证据verification/xgimi/ssdp-query-results.json；现有网关控制代码仅提供遥控按键/探测，无系统信息返回。ADB未开，当前未能通过现有可达接口独立读回版本和SN。公开检索6.17.100.03/Play5 VF无可核实ADB开启说明；不能将官网历史固件V1.3.19与用户显示6.17.100.03直接比较版本新旧，可能属于不同组件/命名。未操作按键、校正、安装或配置变更。待获取适配该实际系统的可靠ADB入口，实体播放仍未验收。

最后成功同步：2026-10-18 12:46:41 Asia/Shanghai，滴答任务已读回，保持未完成。

## 按6.17.100.03/VF继续复查 2026-10-18T12:49:30+08:00
本轮再次精确检索、补查GitHub/原开发者及俄语用户索引，仍无目标三项匹配并展示ADB连接成功的公开记录。新增排除：Lumen OS开发者明确只列Z9X/Play6；4PDA Play5提问索引正文403，不能当作实测；旧教程评论只问上电开机，不是ADB报告。无效的GitHub空格版本搜索产生编号5的无关结果，不计入证据。结论是证据不足，不是证明永久禁用。不让用户再试任何旧机型步骤。完整研究记录verification/xgimi/play5-vf-adb-evidence.txt；本轮没有代码或设备变更，实体播放仍待验证。

本轮最后成功同步：2026-10-18 12:49:34 Asia/Shanghai；既有任务已读回，保持未完成。

## 静态分析与OTA实施接手 2026-10-18T12:54:49.765123+08:00
用户授权只分析Play5/VF/6.17.100.03对应固件或设置入口，不刷机。已核验NAS 192.168.1.4/公共空间访客可读；选择个人云存包、106提供更新入口。官网VF历史包V1.3.19尚未与屏显版本建立映射。下一步106静态提取系统设置、核对版本；实现手机/盒子独立OTA渠道并按乐天B5家族签名规则发布新包，保护旧安装数据。实体播放仍未验收。本轮APK及设备均未变更。

## OTA实施与发布校验 2026-10-18 13:02 Asia/Shanghai
已发布两个B5家族独立包：site.zhangyue.hongguo.mobile/tv，0.2.0-family-beta/code2。个人云\\192.168.1.4\公共空间\红果逐文件读回校验通过；106 https://nas.zhangyue.site/hongguo-ota/{mobile,tv}/latest.json 与两份完整APK经外网HTTPS下载校验通过。手机SHA049c855b4d8dd103bccb7e1212ceee6209d04905ecb2263e9a00fd8b21eb1ea3；盒子SHA94504c75642d6ff1e11f80845581225fa547a57d27b05bb12f30870419740a19。Android12 redroid上17项OTA清单/来源/摘要校验通过，两包安装与冷启动成功。尚未验证真实覆盖安装、ARM播放和遥控。代码ota-src、build-family.py、release-config.json、tools，使用方法docs/OTA.md。旧个人版及原作者包保留，新包并存。
Play5 VF官方历史包下载到106分析中；前4MiB带REE偏移标记、MTK头，高熵载荷无可识别文件系统，未提取Settings APK；不能确认与6.17.100.03的映射。未刷机、未改投影设置。

## 本轮交接 2026-10-18T13:05:12.763802+08:00
结论：个人云存包+106稳定OTA入口已部署并校验；Play5隐藏ADB入口未查明，任务保持未完成。官方下载VF历史固件1855328832字节，SHA256 7c3e1e1c9e5cab4323df36bb12435fb4c1c38d297490b60201970c80a1ad55fb，完整保存在106/opt/hongguo-analysis/play5-vf/。全包特征扫描没有有效ZIP/Android boot/sparse/squashfs/EROFS镜像，两个ZIP魔数命中经结构校验是随机误报。REE/MTK封装未解开，无法提取设置APK，无法建立V1.3.19与6.17.100.03映射；不能给出当前系统ADB按键入口。未刷机或更改投影仪设置。
证据：verification/xgimi/play5-vf-static-analysis-full.json；OTA验证verification/family-ota-test.txt。追加Android app_process网络/归档集成测试被系统终止(exit137)，无结果，不算通过；已通过的是17项输入验证、两包安装冷启动、macOS外网HTTPS完整下载校验和NAS逐文件读回。
下载页 https://nas.zhangyue.site/hongguo-ota/ ，NAS公共空间/红果。后续发版配置release-config.json；构建build-family.py；106签名和NAS发布脚本tools/；使用docs/OTA.md。源码包artifacts/hongguo-family-source-0.2.0.tgz，不含私钥。
下一步：获得当前6.17.100.03的可解析系统设置APK/更新组件或能解此VF容器的对应格式信息，先静态确认ADB入口与版本匹配；实机开放ADB后再安装盒子包验收播放和遥控。手机实机与版本覆盖升级也仍待验收。没有启动后台定时任务。

本轮最后成功同步：2026-10-18T13:05:15.632603+08:00；原滴答任务已读回，保持未完成。

## 首次本地安装澄清 2026-10-18T13:06:08.926711+08:00
用户明确先从联想个人云在Play5本地安装一次，后续再OTA。本轮在公共空间/红果额外放置易识别别名红果-盒子-0.2.0.apk，SHA256读回一致。尚未在Play5执行安装；可达8080仍仅校正页，ADB未开且无可见投影画面，不冒充已安装或已确认Play5共享菜单。下一步由实际文件管理器页面确认是否提供SMB/个人云访问，打开该APK并由用户确认系统安装。未继续更改OTA架构。

## 私有Git与合作者分享接手 2026-10-18T13:21:21.984573+08:00
用户授权将本项目上传本人私人Git仓库并分享给既有其他项目合作者，且授权自行查找该合作者。正在核对实际GitHub身份与已有仓库直接合作者。当前目录尚无Git仓库；准备仅纳入Android适配源码、解包工程/来源许可、构建及OTA脚本、验证说明与两份测试APK，排除签名私钥、凭据、Windows运行时和固件。实机验收仍未通过；不会因上传而更改此状态。确认唯一合作者后以最小只读权限邀请（未授权写入权限）。
