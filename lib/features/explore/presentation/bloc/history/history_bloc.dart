import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/features/explore/presentation/bloc/history/history_event.dart';
import 'package:application/features/explore/presentation/bloc/history/history_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ExploreRepository repository;
  HistoryBloc(this.repository) : super(HistoryInitial()) {
    on<GetHistory>(onGetHistory);
    on<DeleteFromHistory>(onDeleteFromHistory);
    on<ClearHistory>(onClearHistory);
  }
  void onGetHistory(GetHistory event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    final either = await repository.getHistoy();
    emit(
      either.fold(
        (f) => HistoryFailed(ExceptionMapper.mapFailureToMessage(f)),
        (r) => HistorySuccess(r),
      ),
    );
  }

  void onDeleteFromHistory(DeleteFromHistory event, Emitter<HistoryState> emit) async {
    await repository.deleteFromHistory(event.id);
    final history = await repository.getHistoy();
    emit(
      history.fold(
        (f) => HistoryFailed(ExceptionMapper.mapFailureToMessage(f)),
        (r) => HistorySuccess(r),
      ),
    );
  }

  void onClearHistory(ClearHistory event, Emitter<HistoryState> emit) async {
    await repository.clearHistoty();
    emit(HistoryInitial());
  }
}
