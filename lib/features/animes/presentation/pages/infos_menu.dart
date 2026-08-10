import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/presentation/controller/anime_controller.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeInfosMenu extends StatelessWidget {
  const AnimeInfosMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final animeController = sl<AnimeController>();
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
      key: const PageStorageKey("infos"),
      slivers: [
        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        SliverToBoxAdapter(
          child: LayoutBuilder(
            builder: (context, constrained) {
              return Responsive(
                constraints: constrained,
                child: SignalBuilder(
                  builder: (context) {
                    final state = animeController.mediaState.value;
                    final responsive = Responsive.of(context);
                    final isLoading = state.isLoading;
                    final anime = state.value ?? animeController.fakeMedia;
                    final titleStyle = responsive.isMobile ? context.textTheme.titleMedium : context.textTheme.titleLarge;
                    final bodyStyle = responsive.isMobile ? context.textTheme.bodySmall : context.textTheme.bodyLarge;
                    return Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentGeometry.center,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 1000),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text("Anime haqida ma'lumot", style: titleStyle),
                            Text(!isLoading ? anime.description.uz : lorem(), style: bodyStyle),
                            SizedBox(height: 5),
                            Text("Janrlar", style: titleStyle),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: anime.genres
                                  .map(
                                    (e) => OutlinedButton(
                                      style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(7))),
                                      ),
                                      onPressed: () {},
                                      child: Text(e.title.uz),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SizedBox(height: 5),
                            Text("Kategoriya", style: titleStyle),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: anime.categories
                                  .map(
                                    (e) => FilledButton(
                                      style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(7))),
                                      ),
                                      onPressed: () {},
                                      child: Text(e['name']['uz']),
                                    ),
                                  )
                                  .toList()
                                  .cast<Widget>(),
                            ),
                            SizedBox(height: 5),

                            Text("Animedan kadrlar", style: titleStyle),
                            SizedBox(
                              height: 320,
                              child: CarouselView.weighted(
                                elevation: 1,
                                itemSnapping: true,
                                enableSplash: true,
                                flexWeights: responsive.isMobile ? [1] : [1, 2, 1],
                                shrinkExtent: 10,
                                itemClipBehavior: Clip.antiAlias,
                                consumeMaxWeight: true,
                                padding: EdgeInsets.all(3),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                                children: anime.images.map((e) => Ink.image(fit: .cover, image: CachedNetworkImageProvider(addBaseUrl(e)))).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
