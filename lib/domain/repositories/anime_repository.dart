import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/entities/anime_entity.dart';

abstract class AnimeRepository {
  Future<DataState<List<AnimeEntity>>> getAnimes({int limit, int page});
}
