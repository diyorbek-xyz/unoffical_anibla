import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/main/novel.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class BooksLocal {
  Manga? getManga(String id);
  Future<void> clearMangas();
  Future<void> deleteMangas(String id);
  Future<void> saveManga(String id, Manga manga);

  Novel? getNovel(String id);
  Future<void> clearNovels();
  Future<void> deleteNovels(String id);
  Future<void> saveNovel(String id, Novel manga);
}

class BooksLocalImpl implements BooksLocal {
  final Box<Manga> _mangaBox;
  final Box<Novel> _novelBox;
  const BooksLocalImpl(this._mangaBox, this._novelBox);

  @override
  Novel? getNovel(String id) => _novelBox.get(id);
  @override
  Manga? getManga(String id) => _mangaBox.get(id);

  @override
  Future<void> clearMangas() async => await _mangaBox.clear();
  @override
  Future<void> clearNovels() async => await _novelBox.clear();

  @override
  Future<void> deleteMangas(String id) async => await _mangaBox.delete(id);
  @override
  Future<void> deleteNovels(String id) async => await _novelBox.delete(id);

  @override
  Future<void> saveManga(String id, Manga manga) async => await _mangaBox.put(id, manga);
  @override
  Future<void> saveNovel(String id, Novel novel) async => await _novelBox.put(id, novel);
}
