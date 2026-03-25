import 'package:application/features/profile/domain/entities/account_entity.dart';
import 'package:application/features/profile/domain/entities/session_entity.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileUnauthorized extends ProfileState {}

final class ProfileLimitSession extends ProfileState {
  final SessionsEntity sessions;
  ProfileLimitSession(this.sessions);
}

final class ProfileSuccess extends ProfileState {
  final AccountEntity data;
  ProfileSuccess(this.data);
}

final class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
}
