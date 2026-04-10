import 'package:application/features/animes/domain/entities/episode_entity.dart';

sealed class EpisodeState {
  const EpisodeState();
}

final class EpisodeInitial extends EpisodeState {
  const EpisodeInitial();
}

final class EpisodeLoading extends EpisodeState {
  const EpisodeLoading();
}

final class EpisodeFailure extends EpisodeState {
  final String message;
  const EpisodeFailure(this.message);
}

final class EpisodeSuccess extends EpisodeState {
  final List<EpisodeEntity> episodes;
  const EpisodeSuccess(this.episodes);
}
