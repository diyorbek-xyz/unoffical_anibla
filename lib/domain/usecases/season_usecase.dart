import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/data/models/param_models/season_params.dart';
import 'package:application/domain/entities/animes/season_entity.dart';
import 'package:application/domain/repositories/season_repository.dart';


class GetSeasonsListUseCase implements UseCase<DataState<List<SeasonEntity>>, GetSeasonsParams> {
  final SeasonRepository repository;
  const GetSeasonsListUseCase(this.repository);
  @override
  Future<DataState<List<SeasonEntity>>> call(GetSeasonsParams params) async {
    return repository.getSeasons(params);
  }
}

class GetSeasonDetailsUseCase implements UseCase<DataState<SeasonEntity>, GetSeasonParams> {
  final SeasonRepository repository;
  const GetSeasonDetailsUseCase(this.repository);
  @override
  Future<DataState<SeasonEntity>> call(GetSeasonParams params) {
    return repository.getSeasonBySlug(params);
  }
}
