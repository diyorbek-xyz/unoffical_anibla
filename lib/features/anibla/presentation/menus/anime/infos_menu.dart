import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/main.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeInfosMenu extends StatelessWidget {
  AnimeInfosMenu({super.key});

  final mediaController = sl<MediaController>();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= MOBILE_WIDTH;
    return SignalBuilder(
      builder: (context) {
        final mediaType = mediaController.mediaType;
        final mangaState = mediaController.mangaState.value;
        final mangaLoading = mangaState.isLoading;
        final manga = mangaState.value ?? mediaController.fakeManga;
        final titleStyle = isMobile ? context.textTheme.titleMedium : context.textTheme.titleLarge;
        final bodyStyle = isMobile ? context.textTheme.bodySmall : context.textTheme.bodyLarge;
        return CustomScrollView(
          scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
          key: const PageStorageKey("infos"),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: AlignmentGeometry.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: mediaType.isAnime
                        ? animeInfo(titleStyle, bodyStyle, isMobile)
                        : [
                            Text("Manga haqida ma'lumot", style: titleStyle),
                            Text(!mangaLoading ? manga.description : lorem(), style: bodyStyle),
                          ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> animeInfo(TextStyle? titleStyle, TextStyle? bodyStyle, bool isMobile) {
    final animeState = mediaController.animeState.value;
    final animeLoading = animeState.isLoading;
    final anime = animeState.value ?? mediaController.fakeAnime;
    return [
      Text("Anime haqida ma'lumot", style: titleStyle),
      Text(!animeLoading ? anime.description.uz : lorem(), style: bodyStyle),
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
          flexWeights: isMobile ? [1] : [1, 2, 1],
          shrinkExtent: 10,
          itemClipBehavior: Clip.antiAlias,
          consumeMaxWeight: true,
          padding: EdgeInsets.all(3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
          children: anime.images.map((e) => Ink.image(fit: .cover, image: imageProviderFallback(addBaseUrl(e)))).toList(),
        ),
      ),
    ];
  }
}
