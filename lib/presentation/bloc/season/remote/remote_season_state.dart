import 'package:application/presentation/model/season_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteSeasonsListState extends Equatable {
  final List<SeasonUiModel>? seasons;
  final DioException? exception;
  const RemoteSeasonsListState({this.exception, this.seasons});

  @override
  List<Object?> get props => [seasons, exception];
}

final class RemoteSeasonsListLoading extends RemoteSeasonsListState {
  const RemoteSeasonsListLoading();
}

final class RemoteSeasonsListDone extends RemoteSeasonsListState {
  const RemoteSeasonsListDone(List<SeasonUiModel> seasons) : super(seasons: seasons);
}

final class RemoteSeasonsListFailed extends RemoteSeasonsListState {
  const RemoteSeasonsListFailed(DioException exception) : super(exception: exception);
}

sealed class RemoteSeasonDetailsState extends Equatable {
  final SeasonUiModel? season;
  final DioException? exception;
  const RemoteSeasonDetailsState({this.season, this.exception});
  @override
  List<Object?> get props => [season, exception];
}

final class RemoteSeasonDetailsLoading extends RemoteSeasonDetailsState {
  const RemoteSeasonDetailsLoading();
}

final class RemoteSeasonDetailsDone extends RemoteSeasonDetailsState {
  const RemoteSeasonDetailsDone(SeasonUiModel season) : super(season: season);
}

final class RemoteSeasonDetailsFailed extends RemoteSeasonDetailsState {
  const RemoteSeasonDetailsFailed(DioException exception) : super(exception: exception);
}
