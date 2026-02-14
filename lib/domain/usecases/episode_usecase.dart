import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/domain/entities/episode_entity.dart';
import 'package:application/domain/repositories/episode_repository.dart';

class GetEpisodesParams {
  final String animeSlug;
  final String seasonSlug;
  const GetEpisodesParams({required this.animeSlug, required this.seasonSlug});
}

class GetEpisodesUseCase implements UseCase<DataState<List<EpisodeEntity>>, GetEpisodesParams> {
  EpisodeRepository repository;
  GetEpisodesUseCase(this.repository);

  @override
  Future<DataState<List<EpisodeEntity>>> call(GetEpisodesParams params) {
    return repository.getEpisodes(params);
  }
}
