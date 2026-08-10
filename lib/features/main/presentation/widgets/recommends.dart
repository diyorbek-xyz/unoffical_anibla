import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/controller/anime_controller.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
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
  final animeController = sl<AnimeController>()..getHome(Paginator(limit: 30, page: 1));

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
                child: PagedSliverGrid<int, AnimeEntity>(
                  state: PagingState(hasNextPage: state.pagination.hasMore, keys: [0], pages: [state.value]),
                  fetchNextPage: animeController.getHomeMore,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 9 / 15,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, item, index) => FocusTraversalOrder(
                      order: NumericFocusOrder(index + 0.0),
                      child: AnimeCard(aspectRatio: 9 / 15, anime: state.value[index]),
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
