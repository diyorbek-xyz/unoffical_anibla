import 'package:application/features/animes/data/models/season_model.dart';

sealed class SeasonState {
  const SeasonState();
}

final class SeasonInitial extends SeasonState {
  const SeasonInitial();
}

final class SeasonLoading extends SeasonState {
  const SeasonLoading();
}

final class SeasonSuccess extends SeasonState {
  final List<SeasonModel> seasons;
  const SeasonSuccess(this.seasons);
}

final class SeasonFailure extends SeasonState {
  final String message;
  const SeasonFailure(this.message);
}
