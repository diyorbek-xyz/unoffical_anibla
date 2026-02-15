import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/data/models/param_models/episode_params.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/repositories/episode_repository.dart';

class GetEpisodesUseCase implements UseCase<DataState<List<EpisodeEntity>>, GetEpisodesParams> {
  EpisodeRepository repository;
  GetEpisodesUseCase(this.repository);

  @override
  Future<DataState<List<EpisodeEntity>>> call(GetEpisodesParams params) {
    return repository.getEpisodes(params);
  }
}
