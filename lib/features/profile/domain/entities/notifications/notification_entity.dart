import 'package:application/features/profile/domain/entities/notifications/ep_not_entity.dart';
import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String body;
  final String type;
  final bool read;
  final DateTime createdAt;
  final DateTime updatedAt;
  final EpisodeNotificationEntity data;
  const NotificationEntity({
    required this.body,
    required this.createdAt,
    required this.data,
    required this.id,
    required this.read,
    required this.title,
    required this.type,
    required this.updatedAt,
    required this.userId,
  });

  @override
  List<Object?> get props => [body, createdAt, data, id, read, title, type, updatedAt, userId];
}
