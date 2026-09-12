import 'package:hive_ce_flutter/hive_ce_flutter.dart';

abstract class SearchHistoryLocal {
  Future<void> saveToHistory(String text);
  Future<void> deleteFromHistory(String id);
  Future<void> clearHistory();
  Future<List<String>?> getHistory();
}

class SearchHistoryLocalImpl implements SearchHistoryLocal {
  final Box<String> _box;
  const SearchHistoryLocalImpl(this._box);

  @override
  Future<void> saveToHistory(String text) async {
    await _box.put(text.trim(), text);
  }

  @override
  Future<void> deleteFromHistory(String text) async {
    await _box.delete(text.trim());
  }

  @override
  Future<void> clearHistory() async {
    await _box.clear();
  }

  @override
  Future<List<String>?> getHistory() async {
    return _box.values.toList();
  }
}
