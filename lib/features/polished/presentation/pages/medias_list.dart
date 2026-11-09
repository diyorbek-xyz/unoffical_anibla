import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/request/animes_query.dart';
import 'package:application/features/anibla/presentation/widgets/media_card.dart';
import 'package:application/features/mano/data/models/request/books_query.dart';
import 'package:application/features/polished/presentation/controller/media_search_controller.dart';
import 'package:application/injection_container.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MediasList extends StatefulWidget {
  final String title;
  final MediaType type;
  final AnimesQuery? animesQuery;
  final BooksQuery? booksQuery;
  const MediasList({super.key, this.animesQuery, this.booksQuery, required this.title, required this.type});

  factory MediasList.fromRoute(GoRouterState state) {
    final query = state.uri.queryParameters;
    final title = query['title'] ?? "Something";
    final mediaType = MediaType.fromJson(query['type'] ?? "");
    final animeQuery = !mediaType.isAnime ? null : AnimesQuery.fromQueryString(query['animes'] ?? "");
    final booksQuery = !mediaType.isBook ? null : BooksQuery.fromQueryString(query['books'] ?? "");
    return .new(title: title, animesQuery: animeQuery, booksQuery: booksQuery, type: mediaType);
  }

  @override
  State<MediasList> createState() => _MediasListState();
}

class _MediasListState extends State<MediasList> {
  late final controller = sl<MediaSearchController>();

  @override
  void initState() {
    super.initState();
    if (widget.type.isAnime) controller.animes.fetch(widget.animesQuery!);
    if (widget.type.isBook) controller.books.fetch(widget.booksQuery!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: CustomScrollView(
        slivers: [
          SignalBuilder(
            builder: (context) {
              final signal = controller.animes;
              final state = signal.state;
              final isFirstLoading = state.isLoading && !state.hasValue;
              return Skeletonizer.sliver(
                enabled: isFirstLoading,
                child: PagedSliverGrid<int, Anime>(
                  fetchNextPage: signal.fetchMore,
                  state: PagingState(
                    pages: [state.value],
                    keys: [0],
                    error: state.error,
                    isLoading: state.isLoading,
                    hasNextPage: state.pagination.hasMore,
                  ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 9 / 15,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  builderDelegate: PagedChildBuilderDelegate(
                    animateTransitions: true,
                    itemBuilder: (context, item, index) => MediaCard.fromAnime(item),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
