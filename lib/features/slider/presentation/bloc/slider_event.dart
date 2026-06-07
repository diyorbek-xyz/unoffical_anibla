part of "slider_bloc.dart";

@freezed
sealed class SliderEvent with _$SliderEvent {
  factory SliderEvent.getFull() = _GetFull;
}
