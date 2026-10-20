import 'package:flutter/material.dart';
import '../data/content.dart';

Future<int?> showEpisodeSheet(
  BuildContext context, {
  required Detail detail,
  required int selected,
  required bool playing,
}) => showModalBottomSheet<int>(
  context: context,
  isScrollControlled: true,
  showDragHandle: false,
  backgroundColor: const Color(0xff1b1c21),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
  ),
  builder: (context) =>
      EpisodeSheet(detail: detail, selected: selected, playing: playing),
);

class EpisodeSheet extends StatefulWidget {
  const EpisodeSheet({
    super.key,
    required this.detail,
    required this.selected,
    required this.playing,
  });
  final Detail detail;
  final int selected;
  final bool playing;
  @override
  State<EpisodeSheet> createState() => _EpisodeSheetState();
}

class _EpisodeSheetState extends State<EpisodeSheet> {
  final ScrollController _scroll = ScrollController();
  bool _positioned = false;
  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * .70;
    return SafeArea(
      top: false,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.detail.series.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: '关闭选集',
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
              Text(
                '共 ${widget.detail.episodes.length} 集 · 选集',
                style: const TextStyle(color: Colors.white60, fontSize: 13),
              ),
              const SizedBox(height: 8),
              const Text(
                '带锁的剧集暂未开放公开播放',
                style: TextStyle(color: Colors.white38, fontSize: 12),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth < 560 ? 5 : 10;
                    final extent =
                        (constraints.maxWidth - (columns - 1) * 10) / columns;
                    if (!_positioned) {
                      _positioned = true;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted && _scroll.hasClients) {
                          final index = widget.detail.episodes.indexWhere(
                            (e) => e.number == widget.selected,
                          );
                          final offset =
                              (index < 0 ? 0 : index ~/ columns) *
                              (extent / .92 + 10);
                          _scroll.jumpTo(
                            offset
                                .clamp(0, _scroll.position.maxScrollExtent)
                                .toDouble(),
                          );
                        }
                      });
                    }
                    return GridView.builder(
                      controller: _scroll,
                      itemCount: widget.detail.episodes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .92,
                      ),
                      itemBuilder: (context, index) {
                        final episode = widget.detail.episodes[index];
                        final active = episode.number == widget.selected;
                        final label = active
                            ? (widget.playing ? '播放中' : '当前集')
                            : (episode.available ? '' : '未开放');
                        return Semantics(
                          selected: active,
                          button: true,
                          label:
                              '第 ${episode.number} 集${label.isEmpty ? '' : '，$label'}',
                          child: Material(
                            color: active
                                ? const Color(0xffff526e)
                                : const Color(0xff292a31),
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                if (!episode.available) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('本集未开放公开播放，请前往官方平台观看'),
                                    ),
                                  );
                                  return;
                                }
                                Navigator.pop(context, episode.number);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (!episode.available) ...[
                                        const Icon(
                                          Icons.lock_outline_rounded,
                                          size: 12,
                                          color: Colors.white38,
                                        ),
                                        const SizedBox(width: 2),
                                      ],
                                      Text(
                                        '${episode.number}',
                                        style: TextStyle(
                                          color: episode.available
                                              ? Colors.white
                                              : Colors.white38,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (label.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        label,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: active
                                              ? Colors.white
                                              : Colors.white38,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
