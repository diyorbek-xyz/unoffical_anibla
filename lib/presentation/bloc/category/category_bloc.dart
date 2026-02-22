import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/category_usecase.dart';
import 'package:application/presentation/bloc/category/category_event.dart';
import 'package:application/presentation/bloc/category/category_state.dart';
import 'package:application/presentation/model/category_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListBloc extends Bloc<CategoriesListEvent, CategoriesListState> {
  final GetCategoriesListUsecase _getCategoriesListUsecase;
  CategoriesListBloc(this._getCategoriesListUsecase) : super(CategoriesListInitialState()) {
    on<GetCategoriesListEvent>(onGetCategoriesList);
  }

  void onGetCategoriesList(GetCategoriesListEvent event, Emitter<CategoriesListState> emit) async {
    emit(CategoriesListLoadingState());
    final dataState = await _getCategoriesListUsecase.call(null);
    if (dataState is DataSuccess) {
      final uidata = dataState.data!.map((entity) => CategoryUiModel.fromEntity(entity)).toList();
      emit(CategoriesListSuccessState(uidata));
    } else if (dataState is DataFailed) {
      emit(CategoriesListErrorState(dataState.exception!));
    }
  }
}
