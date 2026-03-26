import 'package:application/features/slider/domain/entities/slider_entity.dart';

sealed class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderLoading extends SliderState {}

final class SliderSuccess extends SliderState {
  final List<SliderEntity> data;
  SliderSuccess(this.data);
}

final class SliderError extends SliderState {
  final String message;
  SliderError(this.message);
}
