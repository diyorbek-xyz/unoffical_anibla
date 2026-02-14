import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/entities/season_entity.dart';
import 'package:application/domain/usecases/season_usecase.dart';

abstract class SeasonRepository {
  Future<DataState<List<SeasonEntity>>> getSeasons(GetSeasonsParams params);
  Future<DataState<SeasonEntity>> getSeasonBySlug(GetSeasonParams params);
}
