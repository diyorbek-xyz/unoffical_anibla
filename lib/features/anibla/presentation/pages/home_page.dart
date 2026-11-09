import 'package:application/features/anibla/presentation/widgets/calendar.dart';
import 'package:application/features/anibla/presentation/widgets/media_card.dart';
import 'package:application/features/anibla/presentation/widgets/slider.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/presentation/widgets/recommends.dart';
import 'package:application/shared/widgets/recommend.dart';
import 'package:material_ui/material_ui.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _booksController = sl<BookController>();

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    return CustomScrollView(
      slivers: [
        isMobile
            ? SliverToBoxAdapter(child: SizedBox(height: 400, child: Carousel()))
            : SliverFillViewport(delegate: SliverChildListDelegate([Carousel()])),
        SliverToBoxAdapter(child: Calendar()),
        SliverToBoxAdapter(
          child: Recommends.futureSignalBuilder<Book>(
            title: "Yangi mangalar",
            builder: (context, item) => MediaCard.fromManga(item),
            futureSignal: _booksController.newestMangas,
            fake: _booksController.fakeBooks,
          ),
        ),
        SliverToBoxAdapter(
          child: Recommends.futureSignalBuilder<Book>(
            title: "Yangi novellalar",
            builder: (context, item) => MediaCard.fromManga(item),
            futureSignal: _booksController.newestNovels,
            fake: _booksController.fakeBooks,
          ),
        ),
        AnimeRecommends(),
      ],
    );
  }
}
