import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/books_query.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/response/chapter_response.dart';
import 'package:application/features/mano/data/models/response/mano_response.dart';
import 'package:application/features/mano/data/source/local/books_local.dart';
import 'package:application/features/mano/data/source/network/books_api.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:application/shared/utils/failure_messenger.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookRepositoryImpl implements BookRepository {
  final BooksApi _booksApi;
  final BooksLocal _booksLocal;
  const BookRepositoryImpl(this._booksApi, this._booksLocal);

  @override
  Future<Either<Failure, ManoResponse<List<Book>>>> getBooks(BooksQuery query) async {
    try {
      if (query.queryType == null) throw "Media type is not given";

      final httpResponse = await _booksApi.getBooks(query.queryType!, query);
      final mangas = httpResponse.data.data;
      await Future.wait(
        List.generate(mangas.length, (index) async => await _booksLocal.saveBook(mangas[index].id, mangas[index])),
      );
      return Right(httpResponse.data);
    } catch (e) {
      return failureMaker(e);
    }
  }

  @override
  Future<Either<Failure, Book>> getBook(BooksQueryType type, String id) async {
    try {
      final manga = _booksLocal.getBook(id);
      if (manga != null) return Right(manga);
      final newManga = await _booksApi.getBook(type, id);
      return Right(newManga.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ChapterResponse<List<ManoChapter>>>> getChapters({
    required String id,
    required ChapterRequest request,
  }) async {
    try {
      final httpResponse = await _booksApi.getChapters(id, request);
      return Right(httpResponse.data);
    } catch (e) {
      return failureMaker(e);
    }
  }

  @override
  Future<Either<Failure, ManoChapter>> getChapterPages(String id) async {
    try {
      final httpRequest = await _booksApi.getChapterPages(id);
      return Right(httpRequest.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
