import 'package:application/data/models/param_models/episode_params.dart';

sealed class RemoteEpisodeEvent {
  const RemoteEpisodeEvent();
}

final class GetEpisodes extends RemoteEpisodeEvent {
  final GetEpisodesParams params;
  const GetEpisodes(this.params);
}

final class RefreshEpisodes extends RemoteEpisodeEvent {
  final GetEpisodesParams params;
  const RefreshEpisodes(this.params);
}