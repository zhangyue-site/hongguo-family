公开网页契约样本，2026-10-20（北京时间）采集。

- catalog.html: https://hongguoduanju.com/category/real-drama 的前两条 recommendList。
- detail.html: https://hongguoduanju.com/detail?series_id=7694653385668037657 的 seriesDetail（86集、accessible_episode_cnt=3）。
- search.html: https://hongguoduanju.com/search/2 的前两条 searchList.video_data。
- player.html: https://hongguoduanju.com/player/7694653385668037657/7694655440692448281 的 publicVideoSeo。

样本已删除请求上下文、用户标识、评论和无关内容，只保留解析所需公开字段。媒体测试只请求公开的第1集，使用 Range: bytes=0-1023 验证206/video/mp4/ftyp，不保存视频本体。受限集不可构造播放地址，播放前再次校验 publicVideoSeo.available 和 seriesId/itemId。

离线：`flutter test test/content_test.dart`
在线契约：`flutter test test/content_test.dart --dart-define=LIVE_CONTENT=true`

分类走公开服务端路径；每页目前仅展示公开返回的首批24条。AI公开搜索缺少可靠分类契约，因此AI搜索只匹配该分类当前推荐的标题/简介/标签，界面须明确这个范围。
