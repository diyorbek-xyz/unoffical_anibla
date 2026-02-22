import 'package:application/presentation/model/category_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class CategoriesListState extends Equatable {
  final List<CategoryUiModel>? categories;
  final DioException? exception;
  const CategoriesListState({this.categories, this.exception});

  @override
  List<Object?> get props => [categories, exception];
}

final class CategoriesListInitialState extends CategoriesListState {
  const CategoriesListInitialState();
}


final class CategoriesListLoadingState extends CategoriesListState {
  const CategoriesListLoadingState();
}

final class CategoriesListSuccessState extends CategoriesListState {
  const CategoriesListSuccessState(List<CategoryUiModel> categories) : super(categories: categories);
}

final class CategoriesListErrorState extends CategoriesListState {
  const CategoriesListErrorState(DioException exception) : super(exception: exception);
}