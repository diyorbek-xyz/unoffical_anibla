import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/presentation/controller/profile_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationsMenu extends StatefulWidget {
  const NotificationsMenu({super.key});

  @override
  State<NotificationsMenu> createState() => _NotificationsMenuState();
}

class _NotificationsMenuState extends State<NotificationsMenu> {
  final ProfileController profileController = sl<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final state = profileController.notificationSignal.value;
        if (state.hasError) return ErrorBuilder(message: (state.error as Failure).message, refresh: profileController.refreshAll);
        final data = state.value ?? profileController.fakeNotification;
        return Skeletonizer(
          enabled: state.isLoading,
          child: ListsWidget(
            items: data.data
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
          ),
        );
      },
    );
  }
}
