import 'package:application/features/anibla/data/models/response/notification_response.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:flutter/material.dart';

class NotificationsMenu extends StatelessWidget {
  final NotificationResponse notifications;
  const NotificationsMenu(this.notifications, {super.key});

  @override
  Widget build(BuildContext context) => ListsWidget(
    items: notifications.data
        .map(
          (e) => ListModel(
            label: e.data.seriesName,
            value: "${e.data.seasonNumber}-fasl ${e.data.episodeNumber}-qism",
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
        )
        .toList(),
  );
}
