import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/common/data/models/helpers/pagination.dart';

sealed class AnimeState {
  const AnimeState();
}

final class AnimeInitial extends AnimeState {
  const AnimeInitial();
}

final class AnimeLoading extends AnimeState {
  const AnimeLoading();
}

final class AnimeSuccess extends AnimeState {
  final AnimeEntity anime;
  const AnimeSuccess(this.anime);
}

final class HomeAnimesSuccess extends AnimeState {
  final List<AnimeEntity> animes;
  final Pagination pagination;
  const HomeAnimesSuccess(this.animes, this.pagination);
}

final class AnimeFilure extends AnimeState {
  final String message;
  const AnimeFilure(this.message);
}
