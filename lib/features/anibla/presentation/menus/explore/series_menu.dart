import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/anibla/presentation/widgets/media_card.dart';
import 'package:application/injection_container.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimesMenu extends StatefulWidget {
  final bool isMovie;
  const AnimesMenu({super.key, this.isMovie = false});

  @override
  State<AnimesMenu> createState() => _SeriesMenuState();
}

class _SeriesMenuState extends State<AnimesMenu> {
  final animeController = sl<MediaController>()..getHome(.new(limit: 30, page: 1, categories: ['680bbf1a6f7f02c30d282729']));

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final state = animeController.homeState.value;
        return CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: () async => await Future.delayed(.new(seconds: 1))),
            PagedSliverGrid<int, Anime>(
              state: PagingState(hasNextPage: state.pagination.hasMore, keys: [0], pages: [state.value]),
              fetchNextPage: animeController.getHomeMore,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: 9 / 15,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              builderDelegate: PagedChildBuilderDelegate(
                noItemsFoundIndicatorBuilder: (context) => SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .center,
                    spacing: 20,
                    children: [
                      Icon(Icons.network_check, size: 50),
                      Text("Internet tarmoqni tekshiring"),
                      FilledButton.icon(
                        onPressed: () => animeController.getHome(.new(limit: 20)),
                        icon: Icon(Icons.refresh),
                        label: Text("Yangilash"),
                      ),
                    ],
                  ),
                ),
                itemBuilder: (context, item, index) => FocusTraversalOrder(
                  order: NumericFocusOrder(index + 0.0),
                  child: MediaCard.fromAnime(state.value[index], aspectRatio: 9 / 15),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
