import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;
  ProfileBloc(this.repository) : super(ProfileLoading()) {
    on<GetProfile>(onGetProfile);
  }
  void onGetProfile(GetProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final either = await repository.getProfile();
    emit(
      either.fold((failure) {
        if (failure is SessionLimitedFailure) {
          return ProfileLimitSession(failure.sessions);
        } else if (failure is ServerFailure) {
          return ProfileError(ExceptionMapper.mapStatusToMessage(failure.status));
        } else {
          return ProfileError(ExceptionMapper.mapFailureToMessage(failure));
        }
      }, (user) => ProfileSuccess(user)),
    );
  }
}