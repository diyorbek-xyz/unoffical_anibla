import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/param_models/anime_params.dart';
import 'package:application/data/models/param_models/search_params.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';

abstract class AnimeRepository {
  Future<DataState<List<AnimeEntity>>> getAnimes(GetAnimesParams params);
  Future<DataState<AnimeEntity>> getAnime(GetAnimeDetailsParams animeSlug);
  Future<DataState<List<AnimeEntity>>> searchAnimes(SearchParams params);
}
