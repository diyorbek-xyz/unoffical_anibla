import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class HistoryLocal {
  Future<void> saveToHistory(Anime anime);
  Future<void> deleteFromHistory(String id);
  Future<Anime?> getFromHistory(String id);
  Future<void> clearHistory();
  Future<List<Anime>?> getHistory();
}

class HistoryLocalImpl implements HistoryLocal {
  final Box<Anime> box;
  const HistoryLocalImpl(this.box);

  @override
  Future<void> clearHistory() async {
    await box.clear();
  }

  @override
  Future<void> deleteFromHistory(String id) async {
    await box.delete(id);
  }

  @override
  Future<Anime?> getFromHistory(String id) async {
    return box.get(id);
  }

  @override
  Future<void> saveToHistory(Anime anime) async {
    await box.put(anime.id, anime);
  }

  @override
  Future<List<Anime>?> getHistory() async {
    return box.values.toList();
  }
}
