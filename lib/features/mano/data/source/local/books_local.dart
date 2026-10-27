import 'package:application/features/mano/data/models/main/book.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class BooksLocal {
  Book? getBook(String id);
  Future<void> clearBooks();
  Future<void> deleteBooks(String id);
  Future<void> saveBook(String id, Book manga);
}

class BooksLocalImpl implements BooksLocal {
  final Box<Book> _mangaBox;
  const BooksLocalImpl(this._mangaBox);

  @override
  Book? getBook(String id) => _mangaBox.get(id);

  @override
  Future<void> clearBooks() async => await _mangaBox.clear();

  @override
  Future<void> deleteBooks(String id) async => await _mangaBox.delete(id);

  @override
  Future<void> saveBook(String id, Book manga) async => await _mangaBox.put(id, manga);
}
