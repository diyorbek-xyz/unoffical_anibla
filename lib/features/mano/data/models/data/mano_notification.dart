import 'package:application/features/mano/data/models/enum/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_notification.g.dart';
part 'mano_notification.freezed.dart';

@freezed
abstract class ManoNotification with _$ManoNotification {
  const factory ManoNotification({
    @Default("") @JsonKey(name: "id") String id,
    @Default("") @JsonKey(name: "title") String title,
    @Default("") @JsonKey(name: "content") String content,
    @Default("") @JsonKey(name: "manga_id") String mangaId,
    @Default("") @JsonKey(name: "photo_url") String photoUrl,
    @Default("") @JsonKey(name: "read_date") String readDate,
    @Default("") @JsonKey(name: "button_url") String buttonUrl,
    @Default("") @JsonKey(name: "chapter_id") String chapterId,
    @Default("") @JsonKey(name: "related_id") String relatedId,
    @Default("") @JsonKey(name: "button_text") String buttonText,
    @Default("") @JsonKey(name: "created_at") String createdDate,
    @Default(false) @JsonKey(name: "is_bookmarked") bool isBookmarked,
    @Default("") @JsonKey(name: "webapp_button_url") String webappButtonUrl,
    @Default("") @JsonKey(name: "webapp_button_text") String webappButtonText,
    @Default(NotificationType.newChapter) @JsonKey(name: "type") NotificationType type,
    @Default(NotificationStatus.read) @JsonKey(name: "status") NotificationStatus status,
    @Default(NotificationPlatform.telegram) @JsonKey(name: "platform") NotificationPlatform platform,
  }) = _ManoNotification;

  factory ManoNotification.fromJson(Map<String, dynamic> json) => _$ManoNotificationFromJson(json);
}
