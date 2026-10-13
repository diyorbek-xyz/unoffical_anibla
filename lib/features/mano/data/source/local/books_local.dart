import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class BooksLocal {
  Manga? get(String id);
  Future<void> clear();
  Future<void> delete(String id);
  Future<void> save(String id, Manga manga);
}

class BooksLocalImpl implements BooksLocal {
  final Box<Manga> _box;
  const BooksLocalImpl(this._box);


  @override
  Manga? get(String id) => _box.get(id);
  @override
  Future<void> clear() async => await _box.clear();
  @override
  Future<void> delete(String id) async => await _box.delete(id);
  @override
  Future<void> save(String id, Manga manga) async => await _box.put(id, manga);
}
