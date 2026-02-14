import 'package:application/domain/usecases/episode_usecase.dart';

sealed class RemoteEpisodeEvent {
  const RemoteEpisodeEvent();
}

final class GetEpisodes extends RemoteEpisodeEvent {
  final GetEpisodesParams params;
  const GetEpisodes(this.params);
}
