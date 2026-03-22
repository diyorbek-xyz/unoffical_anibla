import 'package:application/core/resources/data_state.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>(onLogin);
    on<ConfirmEvent>(onConfirm);
  }
  void onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final dataState = await repository.getConfirm(event.body);
    print(dataState.data?.login);
    print(dataState.exception?.error);
    print(dataState.exception?.message);
    print(dataState.exception?.response);
    print(dataState.exception?.stackTrace);
    print(dataState.response);
    if (dataState is DataSuccess) {
      print("SUCCESS");
      emit(LoginSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      print("ERROR");
      emit(LoginFailed(dataState.exception!, dataState.response));
    }
  }

  void onConfirm(ConfirmEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final dataState = await repository.confirmCode(event.body);
    print(dataState.data?.token.accessToken);
    print(dataState.data?.user);
    print(dataState.exception?.error);
    print(dataState.exception?.message);
    print(dataState.exception?.response);
    print(dataState.exception?.stackTrace);
    print(dataState.response);
    if (dataState is DataSuccess) {
      print("SUCCESS");
      emit(ConfirmSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      print("ERROR");
      emit(ConfirmFailed(dataState.exception!, dataState.response));
    }
  }
}
