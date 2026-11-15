import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/books_query.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:application/shared/controller/paginated_signal.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class BookRecommendQueries {
  static const hotUpdateMangas = BooksQuery(
    title: .new(uz: "Yangi chiqgan boblar"),
    sortBy: .latestChapter,
    queryType: .manga,
  );
  static const newestMangas = BooksQuery(
    title: .new(uz: "Eng yangi mangalar"),
    sortBy: .newest,
    queryType: .manga,
  );
  static const topMangas = BooksQuery(
    title: .new(uz: "Top mangalar"),
    type: .manga,
    queryType: .manga,
  );

  static const hotUpdateNovels = BooksQuery(
    title: .new(uz: "Yangi chiqgan boblar"),
    sortBy: .latestChapter,
    queryType: .novels,
  );
  static const newestNovels = BooksQuery(
    title: .new(uz: "Eng yangi novellalar"),
    sortBy: .newest,
    queryType: .novels,
  );
  static const topNovels = BooksQuery(
    title: .new(uz: "Top novellalar"),
    type: .manga,
    queryType: .novels,
  );

  static const forManga = [hotUpdateMangas, newestMangas, topMangas];
  static const forNovels = [hotUpdateNovels, newestNovels, topNovels];
}

class BookController {
  final BookRepository _bookRepository;
  BookController(this._bookRepository);

  PaginatedSignal<Book, BooksQuery> createSignal(BooksQuery query) => .new((query, pagination, _) async {
    final either = await _bookRepository.getBooks(query);
    return BigSignalState(value: either.getData().data, request: query);
  })..fetch(query);

  late final mangaSignals = BookRecommendQueries.forManga.map(createSignal).toList();
  late final novelSignals = BookRecommendQueries.forNovels.map(createSignal).toList();

  FutureSignal<List<Book>> createContainer(BooksQuery query) => futureSignal(() async {
    final either = await _bookRepository.getBooks(query);
    return either.getData().data;
  });

  late final booksContainer = futureSignalContainer<List<Book>, BooksQuery>(createContainer, cache: true);

  late final hotUpdateMangas = booksContainer(BooksQuery(sortBy: .latestChapter, queryType: .manga));
  late final newestMangas = booksContainer(BooksQuery(sortBy: .newest, queryType: .manga));
  late final topMangas = booksContainer(BooksQuery(type: .manga, queryType: .manga));

  late final hotUpdateNovels = booksContainer(BooksQuery(sortBy: .latestChapter, queryType: .novels));
  late final newestNovels = booksContainer(BooksQuery(sortBy: .newest, queryType: .novels));
  late final topNovels = booksContainer(BooksQuery(type: .manga, queryType: .novels));

  late final book = signal(SignalState<Book>());
  late final chapters = signal(SignalState<List<ManoChapter>>());
  late final chapter = signal(SignalState<ManoChapter>());

  Future<void> getBook(MediaType type, String id) async {
    book.setLoading(true);
    final either = await _bookRepository.getBook(type.toBookRequest, id);
    either.fold((l) => book.setError(l.message), book.setValue);
  }

  Future<void> getChapters(MediaType type, String id) async {
    chapters.setLoading(true);
    final either = await _bookRepository.getChapters(id: id, request: ChapterRequest());
    either.fold((l) => chapters.setError(l.message), (e) => chapters.setValue(e.chapters));
  }

  Future<void> getFullBook(MediaType type, String id) async {
    if (!type.isBook) return;
    await getBook(type, id);
    await getChapters(type, id);
    final chapterId = chapters.data?.first.id;
    if (chapterId != null) await getChapterPages(chapterId);
  }

  Future<void> getChapterPages(String id) async {
    chapter.setLoading(true);
    final either = await _bookRepository.getChapterPages(id);
    either.fold((l) => chapter.setError(l.message), chapter.setValue);
  }

  void refreshNewest() => newestMangas.refresh();

  final fakeBooks = List.generate(5, (index) => const Book());
  final fakeChapters = List.generate(5, (index) => const ManoChapter());
  final fakeChapter = const ManoChapter();
  final fakeBook = const Book();
}
