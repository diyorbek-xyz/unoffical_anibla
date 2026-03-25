import 'package:application/core/resources/data_state.dart';
import 'package:application/features/template/domain/repository/template_repository.dart';
import 'package:application/features/template/presentation/bloc/template_event.dart';
import 'package:application/features/template/presentation/bloc/template_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  final TemplateRepository repository;
  TemplateBloc(this.repository) : super(TemplateLoading()) {
    on<GetTemplate>(onGetTemplate);
  }
  void onGetTemplate(GetTemplate event, Emitter<TemplateState> emit) async {
    emit(TemplateLoading());
    final dataState = await repository.getTemplate();
    if (dataState is DataSuccess) {
      emit(TemplateSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(TemplateError(dataState.exception!));
    }
  }
}
