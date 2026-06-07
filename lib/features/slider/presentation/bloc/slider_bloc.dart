import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_state.dart';
part 'slider_event.dart';
part 'slider_bloc.freezed.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final SliderRepository repository;
  SliderBloc(this.repository) : super(.initial()) {
    on<_GetFull>(onGetFullSlider);
  }
  void onGetFullSlider(_GetFull event, Emitter<SliderState> emit) async {
    emit(.loading());
    final either = await repository.getSlider();

    emit(
      either.fold(
        (failure) => .failed(ExceptionMapper.mapFailureToMessage(failure)),
        (slider) => .success(slider),
      ),
    );
  }
}
