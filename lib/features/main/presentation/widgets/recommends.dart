import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AnimeRecommends extends StatefulWidget {
  const AnimeRecommends({super.key});

  @override
  State<AnimeRecommends> createState() => _AnimeRecommendsState();
}

class _AnimeRecommendsState extends State<AnimeRecommends> {
  @override
  void initState() {
    context.read<AnimeBloc>().add(.getHome(Paginator(limit: 30, page: 1)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resp = Responsive.of(context);
    return BlocBuilder<AnimeBloc, AnimeState>(
      builder: (context, state) => switch (state) {
        AnimeLoading() => SliverToBoxAdapter(child: CircularProgressIndicator()),
        HomeAnimesSuccess() => SliverPadding(
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
                  state: PagingState(hasNextPage: state.pagination.hasMore, keys: [0], pages: [state.animes]),
                  fetchNextPage: () => context.read<AnimeBloc>().add(.getMore()),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 9 / 15,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, item, index) => FocusTraversalOrder(
                      order: NumericFocusOrder(index + 0.0),
                      child: AnimeCard(aspectRatio: 9 / 15, anime: state.animes[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _ => SliverToBoxAdapter(child: Text("data")),
      },
    );
  }
}
