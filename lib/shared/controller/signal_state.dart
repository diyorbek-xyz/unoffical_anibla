import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signal_state.freezed.dart';

@freezed
abstract class SignalState<T> with _$SignalState<T> {
  const SignalState._();
  factory SignalState({
    @Default(false) bool isLoading,
    @Default(false) bool hasValue,
    @Default(false) bool hasError,
    String? error,
    T? value,
  }) = _SignalState;

  SignalState<T> withValue(T value) => copyWith(error: null, hasError: false, hasValue: true, isLoading: false, value: value);
  SignalState<T> withError(String error) =>
      copyWith(error: error, hasError: true, hasValue: false, isLoading: false, value: null);
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
  BigSignalState<T> withValues(List<T> values) =>
      copyWith(error: null, hasError: false, hasValue: true, isLoading: false, value: value + values);
  BigSignalState<T> withError(String error) =>
      copyWith(error: error, hasError: true, hasValue: false, isLoading: false, value: value);
  BigSignalState<T> setLoading(bool value) => copyWith(isLoading: value);
}

@freezed
abstract class NamedSignalState<T> with _$NamedSignalState<T> {
  const NamedSignalState._();
  factory NamedSignalState([@Default({}) Map<String, BigSignalState<T>> entries]) = _NamedSignalState;

  BigSignalState<T>? getEntry(String key) => entries[key];
  String? getError(String key) => getEntry(key)?.error;
  List<T>? getData(String key) => getEntry(key)?.value;
  Pagination getPagination(String key) => getEntry(key)?.pagination ?? Pagination();
  bool getIsLoading(String key) => getEntry(key)?.isLoading ?? false;
  bool getHasValue(String key) => getEntry(key)?.hasValue ?? false;
  bool getHasError(String key) => getEntry(key)?.hasError ?? false;

  NamedSignalState<T> withEntry(String key, Pagination paginate, List<T> values) => copyWith(
    entries: entries.withValue(key, BigSignalState(hasValue: true, pagination: paginate, value: values)),
  );

  NamedSignalState<T> withPagination(String key, Pagination paginate) {
    final entry = getEntry(key);
    if (entry == null) return this;
    return copyWith(entries: entries.withValue(key, entry.withPagination(paginate)));
  }

  NamedSignalState<T> withError(String key, String message) {
    final entry = getEntry(key);
    if (entry == null) return this;
    return copyWith(entries: entries.withValue(key, entry.withError(message)));
  }

  NamedSignalState<T> setLoading(String key, bool loading) {
    final entry = getEntry(key);
    if (entry == null) return this;
    return copyWith(entries: entries.withValue(key, entry.setLoading(loading)));
  }
}
