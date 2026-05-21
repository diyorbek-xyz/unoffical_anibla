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
    final either = await repository.getConfirm(event.body);
    emit(either.fold((failure) => LoginFailed(ExceptionMapper.mapFailureToMessage(failure)), (success) => LoginSuccess(success)));
  }

  void onConfirm(ConfirmEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final either = await repository.confirmCode(event.body);
    emit(either.fold((failure) => ConfirmFailed(ExceptionMapper.mapFailureToMessage(failure)), (success) => ConfirmSuccess(success)));
  }

  void onLogOut(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final either = await repository.logOut(event.tokenId, event.isCurrent);
    emit(either.fold((failure) => LogOutFailed(ExceptionMapper.mapFailureToMessage(failure)), (success) => LogedOut()));
  }
}
