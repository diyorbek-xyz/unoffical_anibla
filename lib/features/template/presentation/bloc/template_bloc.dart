import 'package:application/features/template/domain/repository/template_repository.dart';
import 'package:application/features/template/presentation/bloc/template_event.dart';
import 'package:application/features/template/presentation/bloc/template_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  final TemplateRepository repository;
  TemplateBloc(this.repository) : super(TemplateLoading()) {
    on<GetTemplate>(onGetTest);
  }
  void onGetTest(GetTemplate event, Emitter<TemplateState> emit) async {
    emit(TemplateLoading());
    final either = await repository.getTest();
    emit(
      either.fold(
        (failure) =>
            TemplateError(ExceptionMapper.mapFailureToMessage(failure)),
        (success) => TemplateSuccess(success),
      ),
    );
  }
}
