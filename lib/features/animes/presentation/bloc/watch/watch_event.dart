import 'package:application/features/animes/domain/entities/episode_entity.dart';

sealed class WatchEvent {
  const WatchEvent();
}

final class SetEpisode extends WatchEvent {
  final EpisodeEntity episode;
  const SetEpisode(this.episode);
}
