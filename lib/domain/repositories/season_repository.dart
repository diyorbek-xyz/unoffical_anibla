import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/param_models/season_params.dart';
import 'package:application/domain/entities/animes/season_entity.dart';

abstract class SeasonRepository {
  Future<DataState<List<SeasonEntity>>> getSeasons(GetSeasonsParams params);
  Future<DataState<SeasonEntity>> getSeasonBySlug(GetSeasonParams params);
}
