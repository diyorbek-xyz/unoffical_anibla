import 'package:application/data/models/param_models/episode_params.dart';

sealed class RemoteEpisodesListEvent {
  const RemoteEpisodesListEvent();
}

final class GetEpisodesList extends RemoteEpisodesListEvent {
  final GetEpisodesParams params;
  const GetEpisodesList(this.params);
}

sealed class RemoteEpisodeDetailsEvent {
  const RemoteEpisodeDetailsEvent();
}

final class GetEpisodeDetails {
  final GetEpisodeParams episodeParams;
  const GetEpisodeDetails(this.episodeParams);
}
