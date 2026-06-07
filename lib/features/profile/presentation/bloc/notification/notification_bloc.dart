import 'package:application/features/profile/domain/repository/notification_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/profile/domain/entities/notifications/notification_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "notification_event.dart";
part 'notification_state.dart';
part "notification_bloc.freezed.dart";

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repository;
  NotificationBloc(this.repository) : super(NotificationState.initial()) {
    on<GetNotifications>(onGetNotifications);
  }

  void onGetNotifications(GetNotifications event, Emitter<NotificationState> emit) async {
    emit(.loading());
    final either = await repository.getNotifications();
    emit(either.fold((f) => .failed(ExceptionMapper.mapFailureToMessage(f)), (r) => .success(r)));
  }
}
