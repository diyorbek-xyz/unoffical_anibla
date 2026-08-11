import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/presentation/controller/profile_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/network/resources/failure.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationsMenu extends StatefulWidget {
  const NotificationsMenu({super.key});

  @override
  State<NotificationsMenu> createState() => _NotificationsMenuState();
}

class _NotificationsMenuState extends State<NotificationsMenu> {
  late final ProfileController profileController;
  @override
  void initState() {
    super.initState();
    profileController = sl();
  }

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final state = profileController.notificationSignal.value;
        if (state.hasError) return ErrorBuilder(message: (state.error as Failure).message, refresh: profileController.refreshAll);
        final data = state.value ?? profileController.fakeNotification;
        return Skeletonizer(
          enabled: state.isLoading,
          child: ListsWidget.builder(
            itemCount: data.data.length,
            builder: (i, borderRadius) {
              final notf = data.data.elementAt(i);
              return Material(
                borderRadius: .circular(20),
                clipBehavior: .antiAlias,
                child: InkWell(
                  onTap: () => context.pushNamed('anime', pathParameters: {"type": notf.data.mediaType, "slug": notf.data.mediaSlug}),
                  child: Ink(
                    color: context.appColors.primaryContainer,
                    height: 200,
                    child: Row(
                      crossAxisAlignment: .start,
                      children: [
                        Padding(
                          padding: .all(7),
                          child: Container(
                            clipBehavior: .antiAlias,
                            decoration: BoxDecoration(borderRadius: .circular(15)),
                            child: CachedNetworkImage(alignment: .center, fit: .cover, width: 130, imageUrl: addBaseUrl(notf.data.image)),
                          ),
                        ),
                        Padding(
                          padding: .symmetric(vertical: 30, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: .start,
                            spacing: 5,
                            children: [
                              Text(notf.title, style: context.textTheme.titleLarge),
                              Text(notf.body, style: context.textTheme.bodyLarge),
                              Expanded(child: SizedBox.shrink()),
                              Row(
                                mainAxisAlignment: .end,
                                children: [TextButton.icon(onPressed: () {}, icon: Icon(Icons.clear), label: Text("O'chirish"))],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
