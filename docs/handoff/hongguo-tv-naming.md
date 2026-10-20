# hongguo-family-ota-v2 ｜ 0.3.4 命名版已发布 + 商店双条目 + 官方TV交互已解剖

## 现状（2026-10-19 深夜）
0.3.4(vc7) 双渠道已发布；商店 hongguo + hongguo-tv 双条目已上架；官方 TV 交互已完成源码+实机解剖。

## 用户需求与结论
1. 命名对齐抖音体系：手机=「红果短剧」、电视/投影=「红果短剧电视版」✅ 已发布
2. 平板用手机包（竖滑 feed），投影/盒子用 TV 包（侧栏+网格）✅ 架构本就如此
3. 官方红果 TV 交互实测结论：**不是三列**——左 rail(88dp: 首页/分类/收藏/历史/设置) + 顶 tab(真人剧/漫剧/AI剧+搜索) + 分类 chips 行 + 海报网格（TV 密度 6 列，≥1100dp 6 列否则 5 列，卡高=宽×1.38，每页 20 张焦点到底自动续页，FocusGraph 纯函数焦点导航）。分类页=题材 chips 4 列。
4. 我们的 TV 版(FamilyTvActivity)继承原 MainActivity 全套 TV UI，**官方式交互已就绪**，无需另做三列。

## 0.3.4 交付证据
- 构建签名：mobile a2a1771e… / tv 035e3b68…（B5 家族），label 实测「红果短剧」「红果短剧电视版」
- OTA 外网：双渠道 latest.json vc7 sha 一致 PASS
- redroid：0.3.3→0.3.4 覆盖升级成功
- 商店公网验收：双条目 APK sha/icon 200 PASS（14 个应用）

## 下一步（等用户反馈）
- [ ] 真机验证：手机播放体验、TV 遥控器按键、平板横竖屏
- [ ] 如用户仍要"三列"变体（内容列+分类列+AI列并存），在 TV 版 body 做双面板（左网格右 rail-2）再议
- [ ] 0.9.9 提醒礼仪测试残留已清（线上清单已还原真实版本）

## 关键路径
- OTA：106:/opt/hongguo-analysis/family-ota/（build → incoming → sign → public/）
- 商店：124:/www/wwwroot/download-hub/apps/（apps.json 锁内合并，scp 后必须 chmod 644/755）
- 官方源码：106:/opt/hongguo-analysis/android-tv-decompiled/sources/cn/hongguo/tv/
- 验证：verification/family-ota-test.txt（含 0.3.4 节）

## 滴答
hongguo-ota-v2，ID 6ad58aace4b0be9ee81902d3
