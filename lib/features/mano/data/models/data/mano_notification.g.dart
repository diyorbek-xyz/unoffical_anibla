// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoNotification _$ManoNotificationFromJson(Map<String, dynamic> json) =>
    _ManoNotification(
      id: json['id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      mangaId: json['manga_id'] as String? ?? "",
      photoUrl: json['photo_url'] as String? ?? "",
      readDate: json['read_date'] as String? ?? "",
      buttonUrl: json['button_url'] as String? ?? "",
      chapterId: json['chapter_id'] as String? ?? "",
      relatedId: json['related_id'] as String? ?? "",
      buttonText: json['button_text'] as String? ?? "",
      createdDate: json['created_at'] as String? ?? "",
      isBookmarked: json['is_bookmarked'] as bool? ?? false,
      webappButtonUrl: json['webapp_button_url'] as String? ?? "",
      webappButtonText: json['webapp_button_text'] as String? ?? "",
      type:
          $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
          NotificationType.newChapter,
      status:
          $enumDecodeNullable(_$NotificationStatusEnumMap, json['status']) ??
          NotificationStatus.read,
      platform:
          $enumDecodeNullable(
            _$NotificationPlatformEnumMap,
            json['platform'],
          ) ??
          NotificationPlatform.telegram,
    );

Map<String, dynamic> _$ManoNotificationToJson(_ManoNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'manga_id': instance.mangaId,
      'photo_url': instance.photoUrl,
      'read_date': instance.readDate,
      'button_url': instance.buttonUrl,
      'chapter_id': instance.chapterId,
      'related_id': instance.relatedId,
      'button_text': instance.buttonText,
      'created_at': instance.createdDate,
      'is_bookmarked': instance.isBookmarked,
      'webapp_button_url': instance.webappButtonUrl,
      'webapp_button_text': instance.webappButtonText,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'status': _$NotificationStatusEnumMap[instance.status]!,
      'platform': _$NotificationPlatformEnumMap[instance.platform]!,
    };

const _$NotificationTypeEnumMap = {NotificationType.newChapter: 'new_chapter'};

const _$NotificationStatusEnumMap = {
  NotificationStatus.read: 'read',
  NotificationStatus.unread: 'unread',
};

const _$NotificationPlatformEnumMap = {
  NotificationPlatform.telegram: 'telegram',
};
