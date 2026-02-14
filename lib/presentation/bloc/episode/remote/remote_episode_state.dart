import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteEpisodeState extends Equatable {
  final List<EpisodeEntity>? episodes;
  final DioException? exception;
  const RemoteEpisodeState({this.episodes, this.exception});

  @override
  List<Object?> get props => [episodes!, exception!];
}

final class RemoteEpisodeLoading extends RemoteEpisodeState {
  const RemoteEpisodeLoading();
}

final class RemoteEpisodeDone extends RemoteEpisodeState {
  const RemoteEpisodeDone(List<EpisodeEntity> episodes) : super(episodes: episodes);
}

final class RemoteEpisodeFailed extends RemoteEpisodeState {
  const RemoteEpisodeFailed(DioException exception) : super(exception: exception);
}
