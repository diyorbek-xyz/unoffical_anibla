import 'package:application/features/anibla/presentation/widgets/media_card.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/utils/url_launcher.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/shared/widgets/recommend.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NovelPage extends StatelessWidget {
  NovelPage({super.key});

  final _bookController = sl<BookController>();

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final newsState = _bookController.newestNovels.value;
        final topState = _bookController.topNovels.value;
        final hasError = newsState.hasError || topState.hasError;
        final error = newsState.error ?? topState.error;
        final isLoading = newsState.isLoading || topState.isLoading;
        final isDataLoading = newsState.value == null || topState.value == null;
        if (hasError || (isDataLoading && !isLoading))
          return ErrorBuilder(message: error.toString(), refresh: _bookController.refreshNewest);
        final news = newsState.value ?? _bookController.fakeNovels;
        final tops = topState.value ?? _bookController.fakeNovels;
        return Skeletonizer(
          enabled: isLoading,
          enableSwitchAnimation: true,
          child: Scaffold(
            floatingActionButtonLocation: .startFloat,
            floatingActionButton: FloatingActionButton(
              heroTag: "manga",
              onPressed: () => context.replaceNamed("mangas"),
              child: Icon(Icons.book),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  banner(context),
                  Recommends(title: "Yangi Asarlar", onMoreClick: () {}, items: news.map(MediaCard.fromNovel).toList()),
                  Recommends(title: "Top manga", onMoreClick: () {}, items: tops.map(MediaCard.fromNovel).toList()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SizedBox banner(BuildContext context) => SizedBox(
    height: context.isMobile ? 300 : 500,
    child: CarouselView.weighted(
      flexWeights: [1],
      padding: .all(0),
      itemSnapping: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.vertical(bottom: .circular(30))),
      infinite: true,
      onTap: (value) => openLink("https://ma-no.uz/no"),
      children: List.generate(
        3,
        (index) => CachedNetworkImage(
          fit: .cover,
          imageUrl:
              "https://s3.twcstorage.ru/57c0dcdb-5ea6cb33-0068-420d-96b8-28ab9ac337d9/76004421-a096-4370-9d7b-2211a5085bb0.jpeg",
        ),
      ),
    ),
  );
}
