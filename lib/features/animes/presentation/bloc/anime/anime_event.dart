part of 'anime_bloc.dart';

@freezed
sealed class AnimeEvent with _$AnimeEvent {
  factory AnimeEvent.getSingle({required final String slug, required final String type}) = _GetSingle;
  factory AnimeEvent.getHome(final Paginator paginator) = _GetHome;
  factory AnimeEvent.getMore() = _GetMore;
}
