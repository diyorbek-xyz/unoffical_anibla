import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/request/animes_query.dart';
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
abstract class BigSignalState<T, Q> with _$BigSignalState<T, Q> {
  const BigSignalState._();
  factory BigSignalState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasValue,
    @Default(false) bool hasError,
    @Default(Pagination()) Pagination pagination,
    @Default([]) List<T> value,
    Q? request,
    String? error,
  }) = _BigSignalState<T, Q>;

  BigSignalState<T, Q> withRequest(Q request) => copyWith(request: request);
  BigSignalState<T, Q> withMore(Pagination pagination, List<T> values) =>
      copyWith(error: null, hasError: false, hasValue: true, isLoading: false, value: value + values, pagination: pagination);
  BigSignalState<T, Q> withPagination(Pagination pagination) => copyWith(pagination: pagination);
  BigSignalState<T, Q> withValues(List<T> values) =>
      copyWith(error: null, hasError: false, hasValue: true, isLoading: false, value: value + values);
  BigSignalState<T, Q> withError(String error) =>
      copyWith(error: error, hasError: true, hasValue: false, isLoading: false, value: value);
  BigSignalState<T, Q> setLoading(bool value) => copyWith(isLoading: value);
}

@freezed
abstract class NamedSignalState<T> with _$NamedSignalState<T> {
  const NamedSignalState._();
  factory NamedSignalState([@Default({}) Map<String, BigSignalState<T, AnimesQuery>> entries]) = _NamedSignalState;

  BigSignalState<T, AnimesQuery>? getEntry(String key) => entries[key];
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
