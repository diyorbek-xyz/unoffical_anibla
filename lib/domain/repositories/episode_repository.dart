import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/usecases/episode_usecase.dart';

abstract class EpisodeRepository {
  Future<DataState<List<EpisodeEntity>>> getEpisodes(GetEpisodesParams params);
}
