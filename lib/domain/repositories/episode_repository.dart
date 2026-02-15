import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/data/models/param_models/episode_params.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';

abstract class EpisodeRepository {
  Future<DataState<List<EpisodeEntity>>> getEpisodes(GetEpisodesParams params);
  Future<DataState<VideoModel>> getVideo(String source);
  Future<DataState<EpisodeEntity>> getEpisode(GetEpisodeParams params);
}
