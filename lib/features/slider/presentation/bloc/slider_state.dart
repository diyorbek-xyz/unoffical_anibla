import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:dio/dio.dart';

sealed class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderLoading extends SliderState {}

final class SliderSuccess extends SliderState {
  final List<SliderEntity> data;
  SliderSuccess(this.data);
}

final class SliderError extends SliderState {
  final DioException exception;
  SliderError(this.exception);
}
