import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:application/features/slider/presentation/bloc/slider_event.dart';
import 'package:application/features/slider/presentation/bloc/slider_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final SliderRepository repository;
  SliderBloc(this.repository) : super(SliderLoading()) {
    on<GetFullSlider>(onGetFullSlider);
  }
  void onGetFullSlider(GetFullSlider event, Emitter<SliderState> emit) async {
    emit(SliderLoading());
    final either = await repository.getSlider();

    emit(
      either.fold(
        (failure) => SliderError(ExceptionMapper.mapFailureToMessage(failure)),
        (slider) => SliderSuccess(slider),
      ),
    );
  }
}
