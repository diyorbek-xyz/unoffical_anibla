import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/auth/login_usecase.dart';
import 'package:application/domain/usecases/auth/verify_usecase.dart';
import 'package:application/presentation/bloc/auth/auth_event.dart';
import 'package:application/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final VerifyUsecase _verifyUsecase;
  AuthBloc(this._loginUsecase, this._verifyUsecase) : super(AuthStateInitial()) {
    on<LoginEvent>(onLogin);
    on<VerifyEvent>(onVerify);
  }

  void onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    final dataState = await _loginUsecase(event.phone);
    if (dataState is DataSuccess) {
      emit(AuthLoginSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(AuthLoginFailed(dataState.exception!));
    }
  }

  void onVerify(VerifyEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    final dataState = await _verifyUsecase(event.verify);
    print(dataState.data);
    print(dataState.exception?.requestOptions.data);
    print(dataState.exception?.message);
    print(dataState.exception?.error);
    print(dataState.exception?.response);
    print(dataState.exception?.requestOptions.uri);
    if (dataState is DataSuccess) {
      emit(AuthVerifySuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(AuthVerifyFailed(dataState.exception!));
    }
  }
}
