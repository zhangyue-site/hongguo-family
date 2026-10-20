import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../data/content.dart';
import '../data/direct_media.dart';
import '../data/library.dart';
import 'episode_sheet.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    super.key,
    required this.detail,
    required this.initialEpisode,
    required this.library,
    required this.service,
    this.direct,
  });
  final Detail detail;
  final int initialEpisode;
  final Library library;
  final ContentService service;
  final DirectMediaService? direct;
  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with WidgetsBindingObserver {
  VideoPlayerController? _video;
  late int _episode;
  int _ticket = 0;
  bool _controls = true, _loading = true, _closing = false;
  String? _error, _quality;
  double _speed = 1;
  Timer? _hide, _checkpoint;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _episode = widget.initialEpisode;
    _load(_episode, restore: true);
    _checkpoint = Timer.periodic(const Duration(seconds: 5), (_) => _save());
  }

  Future<void> _save() async {
    final v = _video;
    if (v != null && v.value.isInitialized) {
      await widget.library.save(
        widget.detail.series,
        _episode,
        v.value.position.inMilliseconds,
      );
    }
  }

  Future<void> _load(int number, {bool restore = false}) async {
    final rows = widget.detail.episodes.where((e) => e.number == number);
    if (rows.isEmpty) {
      setState(() {
        _loading = false;
        _error = '本集不存在';
      });
      return;
    }
    final ticket = ++_ticket;
    await _save();
    if (!mounted || ticket != _ticket) return;
    final old = _video;
    _video = null;
    old?.removeListener(_changed);
    await old?.dispose();
    if (!mounted || ticket != _ticket) return;
    setState(() {
      _episode = number;
      _loading = true;
      _error = null;
      _quality = null;
      _controls = true;
    });
    VideoPlayerController? candidate;
    try {
      final episode = rows.first;
      // Try the full/HD direct source first; the public 360p preview stays
      // as the fallback for whatever the direct source cannot serve.
      DirectMedia? direct;
      String? directError;
      final service = widget.direct;
      if (service != null) {
        try {
          direct = await service.prepare(episode.id);
          if (!mounted || ticket != _ticket) return;
        } on DirectMediaException catch (e) {
          directError = e.message;
        }
      }
      if (direct != null) {
        final lo = direct.width < direct.height
            ? direct.width
            : direct.height;
        candidate = VideoPlayerController.file(direct.file);
        _quality = '${lo.clamp(1, 4320)}p';
      } else if (episode.available) {
        final url = await widget.service.mediaURL(
          widget.detail.series.id,
          episode,
        );
        if (!mounted || ticket != _ticket) return;
        candidate = VideoPlayerController.networkUrl(url);
        _quality = '预览';
      } else {
        setState(() {
          _loading = false;
          _error = directError ?? '本集暂时无法获取片源，请稍后重试';
          _controls = true;
        });
        return;
      }
      if (!mounted || ticket != _ticket) {
        await candidate.dispose();
        return;
      }
      await candidate.initialize().timeout(const Duration(seconds: 35));
      if (!mounted || ticket != _ticket) {
        await candidate.dispose();
        return;
      }
      _video = candidate;
      final record = restore
          ? widget.library.progress(widget.detail.series.id)
          : null;
      if (record != null &&
          record.episode == number &&
          record.positionMs > 0 &&
          record.positionMs < candidate.value.duration.inMilliseconds - 2000) {
        await candidate.seekTo(Duration(milliseconds: record.positionMs));
      }
      if (!mounted || ticket != _ticket) return;
      await candidate.setPlaybackSpeed(_speed);
      if (!mounted || ticket != _ticket) return;
      candidate.addListener(_changed);
      if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed ||
          WidgetsBinding.instance.lifecycleState == null) {
        await candidate.play();
      }
      if (!mounted || ticket != _ticket) return;
      setState(() => _loading = false);
      _scheduleHide();
    } catch (_) {
      if (candidate != null && candidate != _video) await candidate.dispose();
      if (!mounted || ticket != _ticket) return;
      setState(() {
        _loading = false;
        _error = '播放暂时不可用，请检查网络后重试';
        _controls = true;
      });
    }
  }

  void _changed() {
    if (!mounted) return;
    if (_video?.value.hasError == true && _error == null) {
      _hide?.cancel();
      setState(() {
        _error = '视频加载失败，请重试';
        _controls = true;
      });
    } else {
      setState(() {});
    }
  }

  void _scheduleHide() {
    _hide?.cancel();
    if (_video?.value.isPlaying == true) {
      _hide = Timer(const Duration(seconds: 4), () {
        if (mounted && _error == null && _video?.value.isPlaying == true) {
          setState(() => _controls = false);
        }
      });
    }
  }

  Future<void> _toggle() async {
    final v = _video;
    if (v == null) return;
    if (v.value.isPlaying) {
      await v.pause();
      _hide?.cancel();
    } else {
      await v.play();
      _scheduleHide();
    }
    if (mounted) setState(() => _controls = true);
  }

  Future<void> _seek(int seconds) async {
    final v = _video;
    if (v == null) return;
    await v.seekTo(
      Duration(
        milliseconds: (v.value.position.inMilliseconds + seconds * 1000).clamp(
          0,
          v.value.duration.inMilliseconds,
        ),
      ),
    );
    _scheduleHide();
  }

  void _adjacent(int delta) {
    final next =
        widget.detail.episodes.indexWhere((e) => e.number == _episode) + delta;
    if (next < 0 || next >= widget.detail.episodes.length) return;
    _load(widget.detail.episodes[next].number);
  }

  Future<void> _episodes() async {
    _hide?.cancel();
    final n = await showEpisodeSheet(
      context,
      detail: widget.detail,
      selected: _episode,
      playing: _video?.value.isPlaying == true,
    );
    if (!mounted) return;
    if (n != null && n != _episode) {
      await _load(n);
    } else {
      _scheduleHide();
    }
  }

  Future<void> _leave() async {
    if (_closing) return;
    final route = ModalRoute.of(context);
    _ticket++;
    setState(() => _closing = true);
    await _video?.pause();
    await _save();
    if (mounted) {
      await WidgetsBinding.instance.endOfFrame;
      if (mounted && route?.isCurrent == true) Navigator.pop(context);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      _video?.pause();
      _save();
      _hide?.cancel();
      if (mounted) setState(() => _controls = true);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _ticket++;
    _hide?.cancel();
    _checkpoint?.cancel();
    final video = _video;
    if (video != null && video.value.isInitialized) {
      final library = widget.library;
      final series = widget.detail.series;
      final episode = _episode;
      final position = video.value.position.inMilliseconds;
      scheduleMicrotask(() => library.save(series, episode, position));
    }
    _video?.removeListener(_changed);
    _video?.dispose();
    super.dispose();
  }

  String _time(Duration d) =>
      '${d.inMinutes.toString().padLeft(2, '0')}:${(d.inSeconds % 60).toString().padLeft(2, '0')}';
  @override
  Widget build(BuildContext context) {
    final video = _video;
    final v = video?.value;
    return PopScope(
      canPop: _closing,
      onPopInvokedWithResult: (popped, _) {
        if (!popped) _leave();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() => _controls = !_controls);
            _scheduleHide();
          },
          onVerticalDragEnd: (d) {
            if ((d.primaryVelocity ?? 0).abs() > 250) {
              _adjacent(d.primaryVelocity! < 0 ? 1 : -1);
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (video != null && v!.isInitialized)
                Center(
                  child: AspectRatio(
                    aspectRatio: v.aspectRatio,
                    child: VideoPlayer(video),
                  ),
                ),
              if (_loading)
                const Center(
                  child: CircularProgressIndicator(color: Color(0xffff526e)),
                ),
              if (_error != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.wifi_off_rounded,
                          color: Colors.white54,
                          size: 40,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _error!,
                          style: const TextStyle(color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        FilledButton.icon(
                          onPressed: () => _load(_episode),
                          icon: const Icon(Icons.refresh),
                          label: const Text('重新加载'),
                        ),
                      ],
                    ),
                  ),
                ),
              if (_controls) ...[
                IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: .75),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withValues(alpha: .85),
                        ],
                        stops: const [0, .25, .6, 1],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            tooltip: '返回',
                            onPressed: _leave,
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.detail.series.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '第 $_episode 集',
                                      style: const TextStyle(
                                        color: Colors.white60,
                                        fontSize: 12,
                                      ),
                                    ),
                                    if (_quality != null) ...[
                                      const SizedBox(width: 8),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffff526e),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets
                                              .symmetric(
                                              horizontal: 6, vertical: 1),
                                          child: Text(
                                            _quality!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const Spacer(),
                      if (!_loading && _error == null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              tooltip: '后退15秒',
                              onPressed: () => _seek(-15),
                              icon: const Text(
                                '−15',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white30),
                              ),
                              child: IconButton(
                                tooltip: v?.isPlaying == true ? '暂停' : '播放',
                                iconSize: 48,
                                padding: const EdgeInsets.all(14),
                                onPressed: _toggle,
                                icon: Icon(
                                  v?.isPlaying == true
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            IconButton(
                              tooltip: '快进15秒',
                              onPressed: () => _seek(15),
                              icon: const Text(
                                '+15',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  _time(v?.position ?? Duration.zero),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                  ),
                                ),
                                Expanded(
                                  child: Slider(
                                    activeColor: const Color(0xffff526e),
                                    inactiveColor: Colors.white24,
                                    value: (v?.position.inMilliseconds ?? 0)
                                        .toDouble()
                                        .clamp(
                                          0,
                                          (v?.duration.inMilliseconds ?? 0)
                                              .toDouble(),
                                        ),
                                    max: (v?.duration.inMilliseconds ?? 0) > 0
                                        ? v!.duration.inMilliseconds.toDouble()
                                        : 1,
                                    onChanged: video == null
                                        ? null
                                        : (n) {
                                            video.seekTo(
                                              Duration(milliseconds: n.toInt()),
                                            );
                                            _scheduleHide();
                                          },
                                  ),
                                ),
                                Text(
                                  _time(v?.duration ?? Duration.zero),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton.icon(
                                    onPressed: _episodes,
                                    icon: const Icon(
                                      Icons.grid_view_rounded,
                                      size: 16,
                                    ),
                                    label: Text(
                                      '选集 · $_episode / ${widget.detail.episodes.length}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                PopupMenuButton<double>(
                                  tooltip: '播放速度',
                                  initialValue: _speed,
                                  color: const Color(0xff1b1c21),
                                  onSelected: (s) {
                                    setState(() => _speed = s);
                                    video?.setPlaybackSpeed(s);
                                    _scheduleHide();
                                  },
                                  itemBuilder: (_) => [.75, 1.0, 1.25, 1.5, 2.0]
                                      .map(
                                        (s) => PopupMenuItem(
                                          value: s,
                                          child: Text(
                                            '$s 倍',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      '$_speed 倍',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => _adjacent(1),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('下一集 ›'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
