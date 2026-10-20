# hongguo-family-ota-v2 ｜ 0.3.3 已发布 + 商店已上架

## 现状（2026-10-19 晚，全部完成）
OTA v2 按原版框架重做完毕并发布 0.3.3 (vc6)；红果已上架乐天应用商店，公网验收通过。

## 成果与证据
- **OTA**：见上一节（框架/礼仪/覆盖升级/签名审计全绿，verification/family-ota-test.txt）。
- **商店上架**（用户提醒"应用商店还没有"）：
  - 发布物：124:/www/wwwroot/download-hub/apps/hongguo/releases/0.3.3/hongguo-0.3.3.apk（sha 601bf5d3…，与 106 OTA 端同一包）
  - 图标：apps/icons/hongguo.png（包内 drawable/icon.png）
  - 条目：slug=hongguo，娱乐分类，dev=渠道有数/乐天家族适配，official=null，source/license 标注原作者
  - 合并方式：锁内重读→备份 apps.json.before-hongguo-033-20261019→append→原子替换，self 与其他 12 条未动
  - 公网验收：apps.json 200 含条目、APK 200+sha 一致、icon 200、store-v2 页 200
- **坑**：scp 上传文件默认 600，nginx 403——上传后必须 chmod 644（文件）/755（目录）。

## 关键路径
- 商店数据源：124:/www/wwwroot/download-hub/apps/apps.json（106 上同名目录是空壳）
- 上架规则：124:/root/.agents/skills/publish/SKILL.md + references/store.md；store_catalog.py 只管已有应用升级，新增走手工锁内合并
- OTA 端：106:/opt/hongguo-analysis/family-ota/（public/ 双渠道 latest.json + 包）

## 下一步（真机项，等用户）
- [ ] 实体手机装 0.3.3 验证播放/提醒/商店下载
- [ ] TV 盒子遥控器按键验证

## 滴答
任务键 hongguo-ota-v2，滴答 ID 6ad58aace4b0be9ee81902d3（桥已通）。
