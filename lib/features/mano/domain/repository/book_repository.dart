import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/books_query.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/response/chapter_response.dart';
import 'package:application/features/mano/data/models/response/mano_response.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, ManoResponse<List<Book>>>> getBooks(BooksQuery query);
  Future<Either<Failure, Book>> getBook(BooksQueryType type, String id);
  Future<Either<Failure, ChapterResponse<List<ManoChapter>>>> getChapters({required String id, required ChapterRequest request});
  Future<Either<Failure, ManoChapter>> getChapterPages(String id);
}
