import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:application/features/mano/data/models/request/novel_request.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class BookController {
  final BookRepository _bookRepository;
  BookController(this._bookRepository);

  FutureSignal<List<Book>> createNovelContainer(NovelRequest request) => futureSignal(() async {
    final either = await _bookRepository.getNovels(request);
    return either.getData();
  });

  FutureSignal<List<Book>> createMangaContainer(MangaRequest request) => futureSignal(() async {
    final either = await _bookRepository.getMangas(request);
    return either.getData();
  });

  late final novelContainer = futureSignalContainer<List<Book>, NovelRequest>(createNovelContainer, cache: true);
  late final mangaContainer = futureSignalContainer<List<Book>, MangaRequest>(createMangaContainer, cache: true);

  late final hotUpdateMangas = mangaContainer(MangaRequest(sortBy: .latestChapter));
  late final newestMangas = mangaContainer(MangaRequest(sortBy: .newest));
  late final topMangas = mangaContainer(MangaRequest(type: .manga));

  late final hotUpdateNovels = novelContainer(NovelRequest(sortBy: .latestChapter));
  late final newestNovels = novelContainer(NovelRequest(sortBy: .newest));
  late final topNovels = novelContainer(NovelRequest(type: .manga));

  late final book = signal(SignalState<Book>());
  late final chapters = signal(SignalState<List<ManoChapter>>());

  Future<void> getManga(String id) async {
    final either = await _bookRepository.getManga(id);
    either.fold((l) => book.setError(l.message), book.setValue);
  }

  Future<void> getNovel(String id) async {
    final either = await _bookRepository.getNovel(id);
    either.fold((l) => book.setError(l.message), book.setValue);
  }

  Future<void> getChapters(MediaType type, String id) async {
    final either = await _bookRepository.getChapters(type: type, id: id, request: ChapterRequest());
    either.fold((l) => chapters.setError(l.message), (e) => chapters.setValue(e.chapters));
  }

  Future<void> getFullBook(MediaType type, String id) async {
    if (!type.isBook) return;
    if (type.isNovel) await getNovel(id);
    if (!type.isNovel) await getManga(id);
    await getChapters(type, id);
  }

  void refreshNewest() => newestMangas.refresh();

  final fakeBooks = List.generate(5, (index) => const Book());
  final fakeChapters = List.generate(5, (index) => const ManoChapter());
  final fakeBook = const Book();
}
