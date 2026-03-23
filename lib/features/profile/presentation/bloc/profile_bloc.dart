import 'dart:io';

import 'package:application/core/network/errors.dart';
import 'package:application/core/resources/data_state.dart';
import 'package:application/features/profile/domain/entities/session_entity.dart';
import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:application/features/profile/presentation/bloc/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;
  ProfileBloc(this.repository) : super(ProfileLoading()) {
    on<GetProfile>(onGetProfile);
  }
  void onGetProfile(GetProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    print("Getting profile");
    final dataState = await repository.getProfile();
    if (dataState is DataSuccess) {
      print('success');
      // emit(ProfileSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      final status = dataState.exception?.response?.statusCode;
      if (dataState.exception?.error == Errors.tooManySessions && dataState.data is SessionsEntity) {
        emit(ProfileLimitSession(dataState.data));
      } else if (status == HttpStatus.unauthorized) {
        emit(ProfileUnauthorized());
      } else {
        emit(ProfileError(dataState.exception!, dataState.response));
      }
    }
  }
}
