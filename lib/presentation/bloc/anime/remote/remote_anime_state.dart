import 'package:application/domain/entities/anime_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteAnimeState extends Equatable {
  final List<AnimeEntity>? animes;
  final DioException? exception;
  const RemoteAnimeState({this.animes, this.exception});
  @override
  List<Object?> get props => [animes!, exception!];
}

class RemoteAnimeLoading extends RemoteAnimeState {
  const RemoteAnimeLoading();
}

class RemoteAnimeDone extends RemoteAnimeState {
  const RemoteAnimeDone(List<AnimeEntity> animes) : super(animes: animes);
}

class RemoteAnimeFailed extends RemoteAnimeState {
  const RemoteAnimeFailed(DioException exception) : super(exception: exception);
}
