import 'package:application/features/animes/domain/entities/episode_entity.dart';

sealed class WatchState {
  const WatchState();
}

final class WatchInitial extends WatchState {
  const WatchInitial();
}

final class WatchLoading extends WatchState {
  const WatchLoading();
}

final class WatchDone extends WatchState {
  final EpisodeEntity currentEpisode;
  const WatchDone({required this.currentEpisode});
}

final class WatchFailure extends WatchState {
  final String message;
  const WatchFailure(this.message);
}
