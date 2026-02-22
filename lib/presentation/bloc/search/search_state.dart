import 'package:application/presentation/model/anime_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class SearchState extends Equatable {
  final List<AnimeUiModel>? series;
  final List<AnimeUiModel>? movies;
  final DioException? exception;
  const SearchState({this.series, this.movies, this.exception});

  @override
  List<Object?> get props => [series, movies, exception];
}

final class SearchInitialState extends SearchState {
  const SearchInitialState();
}

final class SearchEmptyState extends SearchState {
  const SearchEmptyState();
}

final class SearchLoadingState extends SearchState {
  const SearchLoadingState();
}

final class SearchSuccessState extends SearchState {
  const SearchSuccessState({required super.series, required super.movies});
}

final class SearchFailedState extends SearchState {
  const SearchFailedState({required super.exception});
}
