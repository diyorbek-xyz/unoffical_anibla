import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/data/anibla_notification.dart';
import 'package:application/features/mano/data/models/data/mano_notification.dart';
import 'package:application/features/view/models/action_view.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_view.freezed.dart';

@freezed
abstract class NotificationView with _$NotificationView {
  const factory NotificationView({
    @Default("") String title,
    @Default("") String subtitle,
    @Default([]) List<ActionView> actions,
    @Default(Icons.home) IconData icon,
    @Default(false) bool isHtml,
    @Default("") String image,
    @Default("") String mediaKey,
    @Default("") String chapterKey,
    @Default(MediaType.serie) MediaType type,
  }) = _NotificationView;

  factory NotificationView.fromMano(ManoNotification notf, {List<ActionView>? actions, IconData? icon}) => .new(
    type: .manga,
    mediaKey: notf.mangaId,
    chapterKey: notf.chapterId,
    actions: actions ?? [],
    icon: icon ?? Icons.abc,
    subtitle: notf.content,
    image: notf.photoUrl,
    title: notf.title,
    isHtml: true,
  );

  factory NotificationView.fromAnibla(AniblaNotification notf, {List<ActionView>? actions, IconData? icon}) => .new(
    actions: actions ?? [],
    icon: icon ?? Icons.abc,
    subtitle: notf.body,
    title: notf.title,
    chapterKey: notf.data.episodeId,
    mediaKey: notf.data.mediaSlug,
    image: notf.data.imageUrl,
    type: notf.data.mediaType
  );
}
