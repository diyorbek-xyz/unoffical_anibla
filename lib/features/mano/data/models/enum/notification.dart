import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationStatus {
  @JsonValue("read")
  read,
}

enum NotificationType {
  @JsonValue("new_chapter")
  newChapter,
}

enum NotificationPlatform {
  @JsonValue("telegram")
  telegram,
}
