import 'package:application/features/animes/domain/entities/anime_entity.dart';

sealed class HistoryState {
  const HistoryState();
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

final class HistoryFailed extends HistoryState {
  final String message;
  const HistoryFailed(this.message);
}

final class HistorySuccess extends HistoryState {
  final List<AnimeEntity> anime;
  const HistorySuccess(this.anime);
}
