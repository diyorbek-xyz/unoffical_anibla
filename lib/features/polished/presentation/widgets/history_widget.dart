import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late final _animeController = sl<MediaController>();

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final state = _animeController.watchHistory.value;
        if (state.hasError) {
          return ErrorBuilder(message: state.error.toString(), refresh: _animeController.watchHistory.refresh);
        }
        final data = state.value ?? _animeController.fakeHistory;

        return Skeletonizer(
          enableSwitchAnimation: true,
          enabled: state.isLoading,
          child: Material(
            clipBehavior: .hardEdge,
            color: context.colors.surfaceContainer,
            borderRadius: .circular(20),
            child: Column(
              children: [
                ListTile(
                  title: Text("Davom eting", style: context.textTheme.titleLarge),
                  minTileHeight: 70,
                  leading: Icon(Icons.skip_next),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
                ),
                Expanded(
                  child: Material(
                    clipBehavior: .hardEdge,
                    type: .transparency,
                    child: ListView.builder(
                      physics: context.isMobile ? NeverScrollableScrollPhysics() : null,
                      padding: .all(5),
                      addRepaintBoundaries: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return ListTile(
                          shape: RoundedRectangleBorder(borderRadius: .circular(12)),
                          leading: Ink(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: .circular(12),
                              image: DecorationImage(image: imageProviderFallback(addBaseUrl(item.thumbnail)), fit: .cover),
                            ),
                          ),
                          onTap: () => context.pushNamed(
                            "watch",
                            queryParameters: MediaProps(
                              mediaKey: item.mediaSlug,
                              type: item.mediaType,
                              chapterKey: item.episodeId,
                            ).toJson(),
                          ),
                          title: Text(item.titleUz, maxLines: 2, style: TextStyle(overflow: .ellipsis)),
                          subtitle: Text("${item.seasonNumber}-fasl ${item.episodeNumber}-qism"),
                          trailing: CircularProgressIndicator(value: item.currentTime / item.duration, year2023: false),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
