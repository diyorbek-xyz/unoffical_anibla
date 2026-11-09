import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:signals_flutter/signals_flutter.dart' as sg;

typedef PageFetcher<T, Q> = Future<BigSignalState<T, Q>> Function(Q query, Pagination pagination);

class PaginatedSignal<T, Q> {
  PaginatedSignal(this._fetcher);

  final PageFetcher<T, Q> _fetcher;

  final signal = sg.signal(BigSignalState<T, Q>());

  BigSignalState<T, Q> get state => signal.value;

  Future<void> fetch(Q request) async {
    if (signal.value.isLoading) return;
    signal.value = BigSignalState<T, Q>(isLoading: true, request: request);
    try {
      final result = await _fetcher(request, const Pagination());
      signal.set(result.copyWith(isLoading: false, request: request, pagination: result.pagination));
    } catch (e) {
      signal.set(signal.value.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> fetchMore() async {
    final current = signal.value;
    if (current.isLoading || current.isLoadingMore || !current.pagination.hasMore || current.request == null) return;
    signal.value = current.copyWith(isLoadingMore: true);
    try {
      final result = await _fetcher(current.request!, current.pagination);

      signal.value = current.copyWith(
        value: [...current.value, ...result.value],
        pagination: result.pagination,
        isLoadingMore: false,
        error: null,
      );
    } catch (e) {
      signal.value = current.copyWith(isLoadingMore: false, error: e.toString());
    }
  }
}
