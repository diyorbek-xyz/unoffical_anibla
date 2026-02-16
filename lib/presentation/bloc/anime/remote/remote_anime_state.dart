import 'package:application/presentation/model/anime_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteAnimesListState extends Equatable {
  final List<AnimeUiModel>? animes;
  final DioException? exception;
  const RemoteAnimesListState({this.animes, this.exception});
  @override
  List<Object?> get props => [animes, exception];
}

final class RemoteAnimesListLoading extends RemoteAnimesListState {
  const RemoteAnimesListLoading();
}

final class RemoteAnimesListDone extends RemoteAnimesListState {
  const RemoteAnimesListDone(List<AnimeUiModel> animes) : super(animes: animes);
}

final class RemoteAnimesListFailed extends RemoteAnimesListState {
  const RemoteAnimesListFailed(DioException exception) : super(exception: exception);
}

abstract class RemoteAnimeDetailsState extends Equatable {
  final AnimeUiModel? anime;
  final DioException? exception;
  const RemoteAnimeDetailsState({this.anime, this.exception});
  @override
  List<Object?> get props => [anime!, exception!];
}

final class RemoteAnimeDetailsDone extends RemoteAnimeDetailsState {
  const RemoteAnimeDetailsDone(AnimeUiModel anime) : super(anime: anime);
}

final class RemoteAnimeDetailsLoading extends RemoteAnimeDetailsState {
  const RemoteAnimeDetailsLoading();
}

final class RemoteAnimeDetailsFailed extends RemoteAnimeDetailsState {
  const RemoteAnimeDetailsFailed(DioException exception) : super(exception: exception);
}
