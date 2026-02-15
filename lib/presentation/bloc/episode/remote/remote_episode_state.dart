import 'package:application/presentation/model/episode_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteEpisodesListState extends Equatable {
  final List<EpisodeUiModel>? episodes;
  final DioException? exception;
  const RemoteEpisodesListState({this.episodes, this.exception});

  @override
  List<Object?> get props => [episodes, exception];
}

final class RemoteEpisodesListLoading extends RemoteEpisodesListState {
  const RemoteEpisodesListLoading();
}

final class RemoteEpisodesListDone extends RemoteEpisodesListState {
  const RemoteEpisodesListDone(List<EpisodeUiModel> episodes) : super(episodes: episodes);
}

final class RemoteEpisodesListFailed extends RemoteEpisodesListState {
  const RemoteEpisodesListFailed(DioException exception) : super(exception: exception);
}



sealed class RemoteEpisodeDetailsState extends Equatable {
  final EpisodeUiModel? episode;
  final DioException? exception;
  const RemoteEpisodeDetailsState({this.episode, this.exception});

  @override
  List<Object?> get props => [episode, exception];
}

final class RemoteEpisodeDetailsLoading extends RemoteEpisodeDetailsState {
  const RemoteEpisodeDetailsLoading();
}

final class RemoteEpisodeDetailsDone extends RemoteEpisodeDetailsState {
  const RemoteEpisodeDetailsDone(EpisodeUiModel episode) : super(episode: episode);
}

final class RemoteEpisodeDetailsFailed extends RemoteEpisodeDetailsState {
  const RemoteEpisodeDetailsFailed(DioException exception) : super(exception: exception);
}
