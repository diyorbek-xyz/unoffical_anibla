import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signal_state.freezed.dart';

@freezed
abstract class SignalState<T> with _$SignalState<T> {
  const SignalState._();
  factory SignalState({@Default(false) bool isLoading, @Default(false) bool hasValue, @Default(false) bool hasError, String? error, T? value}) =
      _SignalState;

  SignalState<T> withValue(T value) => copyWith(error: null, hasError: false, hasValue: true, isLoading: false, value: value);
  SignalState<T> withError(String error) => copyWith(error: error, hasError: true, hasValue: false, isLoading: false, value: null);
  SignalState<T> setLoading(bool value) => copyWith(isLoading: value);
}

@freezed
abstract class BigSignalState<T> with _$BigSignalState<T> {
  const BigSignalState._();
  factory BigSignalState({
    @Default(false) bool isLoading,
    @Default(false) bool hasValue,
    @Default(false) bool hasError,
    @Default(Pagination()) Pagination pagination,
    @Default([]) List<T> value,
    String? error,
  }) = _BigSignalState;

  BigSignalState<T> withMore(Pagination pagination, List<T> values) =>
      copyWith(error: null, hasError: false, hasValue: true, isLoading: false, value: value + values, pagination: pagination);
  BigSignalState<T> withPagination(Pagination pagination) => copyWith(pagination: pagination);
  BigSignalState<T> withValues(List<T> values) => copyWith(error: null, hasError: false, hasValue: true, isLoading: false, value: value + values);
  BigSignalState<T> withError(String error) => copyWith(error: error, hasError: true, hasValue: false, isLoading: false, value: value);
  BigSignalState<T> setLoading(bool value) => copyWith(isLoading: value);
}
