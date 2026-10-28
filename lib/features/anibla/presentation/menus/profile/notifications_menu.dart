import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/view/models/notification_view.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsMenu extends StatelessWidget {
  final List<NotificationView> notifications;
  const NotificationsMenu(this.notifications, {super.key});

  @override
  Widget build(BuildContext context) => ListsWidget(
    items: notifications
        .map(
          (e) => ListModel(
            label: e.title,
            value: e.subtitle,
            isHtml: e.isHtml,
            leading: CircleAvatar(backgroundImage: imageProviderFallback(e.image)),
            onTap: () => context.pushNamed(
              "media",
              queryParameters: MediaProps(mediaKey: e.mediaKey, type: e.type).toJson(),
            ),
            actions: e.actions.map((j) => IconButton(onPressed: j.action, icon: Icon(j.icon), tooltip: j.title)).toList(),
          ),
        )
        .toList(),
  );
}
