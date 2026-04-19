import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class HistoryLocal {
  Future<void> saveToHistory(AnimeModel anime);
  Future<void> deleteFromHistory(String id);
  Future<AnimeModel?> getFromHistory(String id);
  Future<void> clearHistory();
  Future<List<AnimeModel>?> getHistory();
}

class HistoryLocalImpl implements HistoryLocal {
  final Box<AnimeModel> box;
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
  Future<AnimeModel?> getFromHistory(String id) async {
    return box.get(id);
  }

  @override
  Future<void> saveToHistory(AnimeModel anime) async {
    await box.put(anime.id, anime);
  }

  @override
  Future<List<AnimeModel>?> getHistory() async {
    return box.values.toList();
  }
}
