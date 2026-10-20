import 'package:flutter/material.dart';
import '../data/content.dart';
import '../data/library.dart';
import 'episode_sheet.dart';
import 'player_page.dart';

class HomePage extends StatefulWidget {
  final Library library;
  final ContentService? service;
  const HomePage({super.key, required this.library, this.service});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final service = widget.service ?? ContentService();
  final search = TextEditingController();
  int tab = 0, ticket = 0;
  String mode = 'short', genre = '全部', query = '';
  List<Series> items = [];
  bool loading = true;
  String? error;
  bool historyOnly = false;
  Library get library => widget.library;
  @override
  void initState() {
    super.initState();
    library.addListener(changed);
    load();
  }

  void changed() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    ticket++;
    library.removeListener(changed);
    search.dispose();
    service.close();
    super.dispose();
  }

  Future<void> load() async {
    final id = ++ticket;
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final rows = query.isEmpty
          ? await service.browse(mode, genre)
          : await service.search(query, mode);
      if (!mounted || id != ticket) return;
      setState(() {
        items = rows;
        loading = false;
      });
    } catch (e) {
      if (!mounted || id != ticket) return;
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  void selectTab(int value) {
    setState(() {
      tab = value;
      historyOnly = false;
    });
  }

  void message(String text) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    }
  }

  Future<void> open(Series series) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 86,
                        height: 116,
                        child: poster(series),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            series.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '全 ${series.count} 集',
                            style: const TextStyle(color: Colors.white60),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            series.tags.join(' · '),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (series.intro.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      series.intro,
                      style: const TextStyle(
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () async {
                        await library.toggle(series);
                        if (sheetContext.mounted &&
                            ModalRoute.of(sheetContext)?.isCurrent == true) {
                          Navigator.pop(sheetContext);
                        }
                      },
                      icon: Icon(
                        library.contains(series.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      label: Text(library.contains(series.id) ? '已追剧' : '追剧'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pop(sheetContext);
                          prepare(series, false);
                        },
                        child: Text(
                          library.progress(series.id) == null ? '立即播放' : '继续观看',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(sheetContext);
                      prepare(series, true);
                    },
                    child: const Text('查看全部选集'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> prepare(Series s, bool choose) async {
    BuildContext? loadingContext;
    bool cancelled = false;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (c) {
        loadingContext = c;
        return PopScope(
          onPopInvokedWithResult: (popped, result) {
            if (popped) cancelled = true;
          },
          child: AlertDialog(
            content: const Row(
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 16),
                Text('正在加载剧集…'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  cancelled = true;
                  Navigator.pop(c);
                },
                child: const Text('取消'),
              ),
            ],
          ),
        );
      },
    );
    Detail? detail;
    String? failure;
    try {
      detail = await service.detail(s);
    } catch (e) {
      failure = e.toString();
    }
    if (!mounted ||
        cancelled ||
        loadingContext?.mounted != true ||
        ModalRoute.of(loadingContext!)?.isCurrent != true) {
      return;
    }
    Navigator.of(loadingContext!).pop();
    if (detail == null) {
      message(failure ?? '剧集暂不可用，请稍后重试');
      return;
    }
    final d = detail;
    int ep = library.progress(s.id)?.episode ?? 1;
    if (choose) {
      final selected = await showEpisodeSheet(
        context,
        detail: d,
        selected: library.progress(s.id)?.episode ?? 0,
        playing: false,
      );
      if (selected == null || !mounted) return;
      ep = selected;
    }
    if (ep < 1 || ep > d.episodes.length) ep = 1;
    if (!d.episodes[ep - 1].available) {
      message('上次观看的剧集暂无公开片源，请从选集选择可播放集数');
      return;
    }
    if (mounted) {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PlayerPage(
            detail: d,
            initialEpisode: ep,
            library: library,
            service: service,
          ),
        ),
      );
    }
  }

  Widget poster(Series s) => Image.network(
    s.cover,
    fit: BoxFit.cover,
    errorBuilder: (_, e, st) => Container(
      color: const Color(0xff30232c),
      alignment: Alignment.center,
      child: const Icon(Icons.movie_outlined, color: Colors.white38, size: 38),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final saved = historyOnly
        ? library.history.map((r) => r.series).toList()
        : library.favorites;
    final rows = tab == 2 || historyOnly ? saved : items;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        titleSpacing: 20,
        title: Row(
          children: [
            const Text(
              '红果',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color(0xffff526e),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextField(
                controller: search,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: mode == 'ai' ? '在 AI 推荐中搜索' : '搜索短剧或演员',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                onSubmitted: (text) {
                  setState(() {
                    tab = 0;
                    historyOnly = false;
                    query = text.trim();
                  });
                  load();
                },
              ),
            ),
          ],
        ),
      ),
      body: tab == 3 && !historyOnly
          ? mine()
          : RefreshIndicator(
              onRefresh: () async {
                if (tab < 2 && !historyOnly) await load();
              },
              child: CustomScrollView(
                slivers: [
                  if (tab < 2 && !historyOnly)
                    SliverToBoxAdapter(child: filters()),
                  if (historyOnly || tab == 2)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                        child: Text(
                          historyOnly ? '观看历史' : '我的追剧',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  if (tab < 2 && !historyOnly && loading)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  if (tab < 2 && !historyOnly && error != null)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              error!,
                              style: const TextStyle(color: Colors.white60),
                            ),
                            TextButton(
                              onPressed: load,
                              child: const Text('重新加载'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (tab == 0 &&
                      !historyOnly &&
                      query.isEmpty &&
                      library.history.isNotEmpty)
                    SliverToBoxAdapter(child: continueCard()),
                  if (!loading || tab == 2 || historyOnly)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                        child: Text(
                          rows.isEmpty
                              ? historyOnly
                                    ? '看过的短剧会保存在这里'
                                    : tab == 2
                                    ? '把喜欢的故事加入追剧'
                                    : '暂无结果，请换个分类或关键词'
                              : '${tab == 2 || historyOnly ? '已保存' : '找到'} ${rows.length} 部',
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                    sliver: SliverLayoutBuilder(
                      builder: (context, constraints) {
                        final columns = (constraints.crossAxisExtent / 190)
                            .floor()
                            .clamp(2, 6);
                        return SliverGrid(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final s = rows[index];
                            return InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => open(s),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: SizedBox.expand(child: poster(s)),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    s.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    historyOnly
                                        ? '第 ${library.progress(s.id)?.episode ?? 1} 集 · 继续观看'
                                        : '全 ${s.count} 集',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }, childCount: rows.length),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                mainAxisSpacing: 22,
                                crossAxisSpacing: 12,
                                childAspectRatio: .55,
                              ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: const Color(0xff121316),
        indicatorColor: const Color(0xff35202a),
        selectedIndex: tab,
        onDestinationSelected: selectTab,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '推荐',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view),
            label: '剧场',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: '追剧',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }

  Widget filters() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
        child: Row(
          children: [
            for (final item in [
              ('short', '真人短剧'),
              ('manju', '漫剧'),
              ('ai', 'AI 剧'),
            ])
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(item.$2),
                  selected: mode == item.$1,
                  onSelected: (_) {
                    setState(() {
                      mode = item.$1;
                      genre = '全部';
                      query = '';
                      search.clear();
                    });
                    load();
                  },
                ),
              ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
        child: Row(
          children: [
            for (final g in [
              '全部',
              ...(mode == 'short'
                  ? ContentService.realGenres.keys
                  : ContentService.animationGenres.keys),
            ])
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(g),
                  selected: genre == g,
                  onSelected: (_) {
                    setState(() {
                      genre = g;
                      query = '';
                      search.clear();
                    });
                    load();
                  },
                ),
              ),
          ],
        ),
      ),
      if (query.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '“$query”的搜索结果',
                  style: const TextStyle(color: Colors.white60),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    query = '';
                    search.clear();
                  });
                  load();
                },
                child: const Text('清除'),
              ),
            ],
          ),
        ),
    ],
  );
  Widget continueCard() {
    final r = library.history.first;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Card(
        margin: EdgeInsets.zero,
        color: const Color(0xff202126),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => prepare(r.series, false),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '继续观看',
                  style: TextStyle(color: Color(0xffff526e), fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  r.series.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '第 ${r.episode} 集 · 接着上次的故事',
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mine() => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Text(
        '我的',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 24),
      ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: const Color(0xff202126),
        leading: const Icon(Icons.history),
        title: const Text('观看历史'),
        subtitle: Text('${library.history.length} 部'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          setState(() {
            historyOnly = true;
          });
        },
      ),
      const SizedBox(height: 12),
      ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: const Color(0xff202126),
        leading: const Icon(Icons.favorite_border),
        title: const Text('我的追剧'),
        subtitle: Text('${library.favorites.length} 部'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => selectTab(2),
      ),
      const SizedBox(height: 28),
      const Text(
        '红果家庭版 · 0.9.0\n收藏与观看进度保存在本机。\n个人适配测试版，非红果官方发行。',
        style: TextStyle(color: Colors.white38, height: 1.8, fontSize: 12),
      ),
    ],
  );
}
