import 'package:application/core/resources/data_state.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>(onLogin);
    on<ConfirmEvent>(onConfirm);
    on<LogOutEvent>(onLogOut);
  }
  void onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final dataState = await repository.getConfirm(event.body);
    if (dataState is DataSuccess) {
      emit(LoginSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(LoginFailed(dataState.exception!));
    }
  }

  void onConfirm(ConfirmEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final dataState = await repository.confirmCode(event.body);
    if (dataState is DataSuccess) {
      emit(ConfirmSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(ConfirmFailed(dataState.exception!));
    }
  }

  void onLogOut(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final either = await repository.logOut(event.tokenId, event.isCurrent);
    emit(
      either.fold(
        (failure) => LogOutFailed(ExceptionMapper.mapFailureToMessage(failure)),
        (success) => LogedOut(),
      ),
    );
  }
}
