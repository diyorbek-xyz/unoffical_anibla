import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/presentation/bloc/notification/notification_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotificationsMenu extends StatefulWidget {
  const NotificationsMenu({super.key});

  @override
  State<NotificationsMenu> createState() => _NotificationsMenuState();
}

class _NotificationsMenuState extends State<NotificationsMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return state.maybeWhen(
          failed: (message) => Text(message),
          loading: () => CircularProgressIndicator(),
          orElse: () => Text("Nimadur Xato ketti"),
          success: (response) => ListsWidget.builder(
            itemCount: response.data.length,
            builder: (i, borderRadius) {
              final notf = response.data.elementAt(i);
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
          // ListsWidget(
          //   items: List.generate(5, (index) => NotificationMapper.fromModel(NotificationModel()))
          //       .map(
          //         (e) => ListModel(
          //           leading: SizedBox(
          //             width: 50,
          //             height: 100,
          //             child: AspectRatio(
          //               aspectRatio: 2 / 5,
          //               child: Container(color: context.appColors.primary),
          //             ),
          //           ),
          //           isThreeLine: false,
          //           height: 100,
          //           label: e.title,
          //           value: e.body,
          //         ),
          //       )
          //       .toList(),
          // ),
        );
      },
    );
  }
}
