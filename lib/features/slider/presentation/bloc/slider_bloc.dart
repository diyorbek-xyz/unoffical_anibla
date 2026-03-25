import 'package:application/core/resources/data_state.dart';
import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:application/features/slider/presentation/bloc/slider_event.dart';
import 'package:application/features/slider/presentation/bloc/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final SliderRepository repository;
  SliderBloc(this.repository) : super(SliderLoading()) {
    on<GetFullSlider>(onGetFullSlider);
  }
  void onGetFullSlider(GetFullSlider event, Emitter<SliderState> emit) async {
    emit(SliderLoading());
    final dataState = await repository.getSlider();
    if (dataState is DataSuccess) {
      emit(SliderSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(SliderError(dataState.exception!));
    }
  }
}
