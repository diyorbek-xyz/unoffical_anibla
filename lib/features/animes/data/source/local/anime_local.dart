import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class AnimeLocal {
  Future<AnimeModel?> getAnime(String slug);
  Future<void> saveAnime(AnimeModel anime);
  Future<void> deleteAnime(String slug);
}

class AnimeLocalImpl implements AnimeLocal {
  final Box cacheBox;
  const AnimeLocalImpl(this.cacheBox);
  @override
  Future<void> deleteAnime(String slug) async {
    return await cacheBox.delete(slug);
  }

  @override
  Future<AnimeModel?> getAnime(String slug) async {
    return cacheBox.get(slug);
  }

  @override
  Future<void> saveAnime(AnimeModel anime) {
    return cacheBox.put(anime.slug, anime);
  }
}
