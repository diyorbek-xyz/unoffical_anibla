import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:application/features/profile/presentation/bloc/session/session_event.dart';
import 'package:application/features/profile/presentation/bloc/session/session_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final ProfileRepository repository;
  SessionBloc(this.repository) : super(SessionExitInitial()) {
    on<ExitSession>(onExitSession);
  }
  void onExitSession(ExitSession event, Emitter<SessionState> emit) async {
    emit(SessionExitLoading());
    final either = await repository.exitSession(event.tokenId);
    emit(
      either.fold(
        (failure) => SessionExitFailed(ExceptionMapper.mapFailureToMessage(failure)),
        (success) => SessionExitSuccess(),
      ),
    );
  }
}
