import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:application/features/profile/data/mapper/ep_not_mapper.dart';
import 'package:application/features/profile/data/models/notifications/notification_model.dart';
import 'package:application/features/profile/data/models/notifications/notification_response.dart';
import 'package:application/features/profile/domain/entities/notifications/notification_entity.dart';
import 'package:application/features/profile/domain/entities/notifications/notification_response_entity.dart';

class NotificationMapper {
  static NotificationEntity fromModel(NotificationModel? model) => NotificationEntity(
    body: model?.body ?? "",
    createdAt: model?.createdAt ?? DateTime.timestamp(),
    data: EpisodeNotificationMapper.fromModel(model?.data),
    id: model?.id ?? "",
    read: model?.read ?? true,
    title: model?.title ?? "",
    type: model?.type ?? "",
    updatedAt: model?.updatedAt ?? DateTime.timestamp(),
    userId: model?.userId ?? "",
  );
  static NotificationModel fromEntity(NotificationEntity entity) => NotificationModel(
    body: entity.body,
    createdAt: entity.createdAt,
    data: EpisodeNotificationMapper.fromEntity(entity.data),
    id: entity.id,
    read: entity.read,
    title: entity.title,
    type: entity.type,
    updatedAt: entity.updatedAt,
    userId: entity.userId,
  );
  static NotificationResponseEntity responseFromModel(NotificationResponse? model) => NotificationResponseEntity(
    data: model?.data?.map(fromModel).toList() ?? [],
    pagination: model?.pagination ?? Pagination(),
    unreadCount: model?.unreadCount ?? 0,
  );
}
