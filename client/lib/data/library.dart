import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'content.dart';

class WatchRecord {
  final Series series;
  final int episode, positionMs, updated;
  const WatchRecord(this.series, this.episode, this.positionMs, this.updated);
  Map<String, dynamic> toJson() => {
    'series': series.toJson(),
    'episode': episode,
    'positionMs': positionMs,
    'updated': updated,
  };
  factory WatchRecord.fromJson(Map<String, dynamic> j) => WatchRecord(
    Series.fromJson(Map<String, dynamic>.from(j['series'])),
    j['episode'] as int,
    j['positionMs'] as int,
    j['updated'] as int,
  );
}

class Library extends ChangeNotifier {
  final SharedPreferences prefs;
  final Map<String, Series> _favorites = {};
  final Map<String, WatchRecord> _history = {};
  Library(this.prefs) {
    try {
      for (final j
          in jsonDecode(prefs.getString('hg.favorites') ?? '[]') as List) {
        final s = Series.fromJson(Map<String, dynamic>.from(j));
        _favorites[s.id] = s;
      }
    } catch (_) {}
    try {
      for (final j
          in jsonDecode(prefs.getString('hg.history') ?? '[]') as List) {
        final r = WatchRecord.fromJson(Map<String, dynamic>.from(j));
        if (r.episode > 0 && r.positionMs >= 0) _history[r.series.id] = r;
      }
    } catch (_) {}
  }
  List<Series> get favorites => _favorites.values.toList().reversed.toList();
  List<WatchRecord> get history =>
      _history.values.toList()..sort((a, b) => b.updated.compareTo(a.updated));
  WatchRecord? progress(String id) => _history[id];
  bool contains(String id) => _favorites.containsKey(id);
  Future<void> toggle(Series s) async {
    if (_favorites.containsKey(s.id)) {
      _favorites.remove(s.id);
    } else {
      _favorites[s.id] = s;
    }
    notifyListeners();
    await prefs.setString(
      'hg.favorites',
      jsonEncode(_favorites.values.map((s) => s.toJson()).toList()),
    );
  }

  Future<void> save(Series s, int episode, int positionMs) async {
    if (episode < 1 || episode > s.count || positionMs < 0) return;
    _history[s.id] = WatchRecord(
      s,
      episode,
      positionMs,
      DateTime.now().millisecondsSinceEpoch,
    );
    final records = history.take(100).toList();
    _history
      ..clear()
      ..addEntries(records.map((r) => MapEntry(r.series.id, r)));
    notifyListeners();
    await prefs.setString(
      'hg.history',
      jsonEncode(records.map((r) => r.toJson()).toList()),
    );
  }
}
