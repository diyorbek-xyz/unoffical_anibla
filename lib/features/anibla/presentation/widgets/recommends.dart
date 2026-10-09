import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/anibla/presentation/widgets/anime_card.dart';
import 'package:application/shared/widgets/responsive.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeRecommends extends StatefulWidget {
  const AnimeRecommends({super.key});

  @override
  State<AnimeRecommends> createState() => _AnimeRecommendsState();
}

class _AnimeRecommendsState extends State<AnimeRecommends> {
  final animeController = sl<MediaController>()..getHome(Pagination(limit: 30, page: 1));

  @override
  Widget build(BuildContext context) {
    final resp = Responsive.of(context);
    return SignalBuilder(
      builder: (context) {
        final state = animeController.homeState.value;

        return SliverPadding(
          padding: .symmetric(horizontal: 10),
          sliver: SliverMainAxisGroup(
            slivers: [
              SliverPadding(
                padding: .only(bottom: 20, top: 10),
                sliver: SliverToBoxAdapter(
                  child: resp.isMobile
                      ? Text("Mashxur animelar", style: context.textTheme.headlineSmall)
                      : Row(
                          spacing: 10,
                          children: [
                            Icon(Icons.public, size: 30),
                            Expanded(child: Text("Mashxur animelar", style: context.textTheme.headlineSmall)),
                          ],
                        ),
                ),
              ),
              FocusTraversalGroup(
                policy: OrderedTraversalPolicy(),
                child: PagedSliverGrid<int, Anime>(
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
                          FilledButton.icon(onPressed: ()=>animeController.getHome(.new(limit: 20)), icon: Icon(Icons.refresh),label: Text("Yangilash"),),
                        ],
                      ),
                    ),
                    itemBuilder: (context, item, index) => FocusTraversalOrder(
                      order: NumericFocusOrder(index + 0.0),
                      child: MediaCard.fromAnime(state.value[index], aspectRatio: 9 / 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
