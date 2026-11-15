import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:signals_flutter/signals_flutter.dart' as sg;

typedef OnErrorCallback<T, Q> = BigSignalState<T, Q> Function(String message);
typedef PageFetcher<T, Q> = Future<BigSignalState<T, Q>> Function(Q query, Pagination pagination, OnErrorCallback<T, Q> onError);

class PaginatedSignal<T, Q> {
  PaginatedSignal(this._fetcher);

  final PageFetcher<T, Q> _fetcher;

  final signal = sg.signal(BigSignalState<T, Q>());

  BigSignalState<T, Q> get state => signal.value;

  Future<void> fetch(Q request) async {
    if (signal.value.isLoading) return;
    signal.value = BigSignalState<T, Q>(isLoading: true, request: request);
    final result = await _fetcher(request, const Pagination(), signal.value.withError);
    print(result.error);
    print(result.hasError);
    signal.set(result.copyWith(isLoading: false, request: request));
  }

  Future<void> fetchMore() async {
    final current = signal.value;
    final query = current.request;
    if (current.isLoading || current.isLoadingMore || !current.pagination.hasMore || query == null) return;
    signal.value = current.copyWith(isLoadingMore: true);

    final result = await _fetcher(query, current.pagination, signal.value.withError);
    signal.value = current.copyWith(
      value: [...current.value, ...result.value],
      pagination: result.pagination,
      isLoadingMore: false,
      error: null,
    );
  }

  Future<void> refetch() async {
    final request = signal.value.request;
    if (signal.value.isLoading || request == null) return;
    fetch(request);
  }
}
