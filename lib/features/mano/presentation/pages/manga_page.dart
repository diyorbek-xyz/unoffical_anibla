import 'package:application/features/anibla/presentation/widgets/media_card.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/books_query.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/utils/url_launcher.dart';
import 'package:application/shared/widgets/recommend.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

class MangaPage extends StatelessWidget {
  MangaPage({super.key});

  late final _bookController = sl<BookController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: .startFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: "manga",
        onPressed: () => context.replaceNamed("novels"),
        child: Icon(Icons.book),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            banner(context),
            ..._bookController.mangaSignals.map(
              (e) => Recommends.bigSignalBuilder<Book, BooksQuery>(
                signal: e.signal,
                fake: _bookController.fakeBooks,
                title: e.state.request?.title.uz ?? "",
                builder: (context, item) => MediaCard.fromManga(item),
              ),
            ),
          ],
        ),
      ),
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
