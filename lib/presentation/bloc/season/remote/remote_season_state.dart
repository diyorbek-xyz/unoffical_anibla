import 'package:application/domain/entities/season_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteSeasonState extends Equatable {
  final List<SeasonEntity>? seasons;
  final SeasonEntity? season;
  final DioException? exception;
  const RemoteSeasonState({this.exception, this.seasons, this.season});

  @override
  List<Object?> get props => [seasons, exception, season];
}

final class RemoteSeasonDone extends RemoteSeasonState {
  const RemoteSeasonDone(SeasonEntity season) : super(season: season);
}

final class RemoteSeasonsLoading extends RemoteSeasonState {
  const RemoteSeasonsLoading();
}

final class RemoteSeasonsDone extends RemoteSeasonState {
  const RemoteSeasonsDone(List<SeasonEntity> seasons) : super(seasons: seasons);
}

final class RemoteSeasonsFailed extends RemoteSeasonState {
  const RemoteSeasonsFailed(DioException exception) : super(exception: exception);
}
