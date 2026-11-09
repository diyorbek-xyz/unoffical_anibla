import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/request/animes_query.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/books_query.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:application/shared/controller/paginated_signal.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';

class MediaSearchController {
  final AnimeRepository _animeRepository;
  final BookRepository _bookRepository;
  MediaSearchController(this._animeRepository, this._bookRepository);

  late final animes = PaginatedSignal<Anime, AnimesQuery>((request, pagination) async {
    final either = await _animeRepository.getAnimes(request);
    final data = either.getData();
    return BigSignalState(value: data.datas, pagination: data.pagination);
  });

  late final books = PaginatedSignal<Book, BooksQuery>((request, pagination) async {
    final either = await _bookRepository.getBooks(request);
    final value = either.getData();
    return BigSignalState(
      value: value.data,
      pagination: Pagination(
        limit: value.limit,
        page: (value.offset / value.limit).floor(),
        pages: (value.total / value.limit).toInt(),
        total: value.total,
      ),
    );
  });

  void fetch(Object query) => switch (query) {
    AnimesQuery q => animes.fetch(q),
    BooksQuery q => books.fetch(q),
    _ => null,
  };

  void fetchMore(MediaType type) => switch (type) {
    .serie || .movie => animes.fetchMore(),
    _ => books.fetchMore(),
  };
}
