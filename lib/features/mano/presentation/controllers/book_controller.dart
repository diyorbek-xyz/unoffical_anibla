import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class BookController {
  final BookRepository _bookRepository;
  BookController(this._bookRepository);

  late final container = futureSignalContainer<List<Manga>, MangaRequest>(
    (request) => futureSignal(() async {
      final either = await _bookRepository.getMangas(request);
      return either.getData();
    }),
    cache: true,
  );

  late final hotUpdates = container(MangaRequest(sortBy: .latestChapter));
  late final newestMangas = container(MangaRequest(sortBy: .newest));
  late final topMangas = container(MangaRequest(type: .manga));

  late final manga = signal(SignalState<Manga>());
  void getManga(String id) => _bookRepository.getManga(id).fold((l) => manga.setError(l.toString()), manga.setValue);

  final fakeMangas = List.generate(5, (index) => const Manga());

  void refreshNewest() => newestMangas.refresh();
}
