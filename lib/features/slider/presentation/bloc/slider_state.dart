part of "slider_bloc.dart";

@freezed
sealed class SliderState with _$SliderState {
  factory SliderState.success(List<SliderEntity> data) = _Success;
  factory SliderState.failed(String message) = _Failed;
  factory SliderState.initial() = _Initial;
  factory SliderState.loading() = _Loading;
}
