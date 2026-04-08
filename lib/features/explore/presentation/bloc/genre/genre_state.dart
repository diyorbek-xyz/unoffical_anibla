import 'package:application/features/explore/domain/entities/genre_entity.dart';

sealed class GenreState {}

final class GenreInitial extends GenreState {}

final class GenreLoading extends GenreState {}

final class GenresFullSuccess extends GenreState {
  final List<GenreEntity> data;
  GenresFullSuccess(this.data);
}

final class GenreError extends GenreState {
  final String message;
  GenreError(this.message);
}
