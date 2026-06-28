import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:application/features/profile/domain/entities/notifications/notification_entity.dart';
import 'package:equatable/equatable.dart';

class NotificationResponseEntity extends Equatable {
  final List<NotificationEntity> data;
  final int unreadCount;
  final Pagination pagination;
  const NotificationResponseEntity({required this.data, required this.pagination, required this.unreadCount});
  @override
  List<Object?> get props => [data, unreadCount, pagination];
}
