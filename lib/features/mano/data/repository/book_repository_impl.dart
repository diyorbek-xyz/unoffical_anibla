import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:application/features/mano/data/models/request/novel_request.dart';
import 'package:application/features/mano/data/models/response/chapter_response.dart';
import 'package:application/features/mano/data/source/local/books_local.dart';
import 'package:application/features/mano/data/source/network/books_api.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookRepositoryImpl implements BookRepository {
  final BooksApi _booksApi;
  final BooksLocal _booksLocal;
  const BookRepositoryImpl(this._booksApi, this._booksLocal);

  @override
  Future<Either<Failure, List<Book>>> getMangas(MangaRequest request) async {
    try {
      final httpResponse = await _booksApi.getMangas(request);
      final mangas = httpResponse.data.data;
      await Future.wait(
        List.generate(mangas.length, (index) async => await _booksLocal.saveBook(mangas[index].id, mangas[index])),
      );
      return Right(mangas);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getNovels(NovelRequest request) async {
    try {
      final httpResponse = await _booksApi.getNovels(request);
      final novels = httpResponse.data.data;
      await Future.wait(
        List.generate(novels.length, (index) async => await _booksLocal.saveBook(novels[index].id, novels[index])),
      );
      return Right(novels);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Book>> getManga(String id) async {
    try {
      final manga = _booksLocal.getBook(id);
      if (manga != null) return Right(manga);
      final newManga = await _booksApi.getManga(id);
      return Right(newManga.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Book>> getNovel(String id) async {
    try {
      final novel = _booksLocal.getBook(id);
      if (novel != null) return Right(novel);
      final newNovel = await _booksApi.getNovel(id);
      return Right(newNovel.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ChapterResponse<List<ManoChapter>>>> getChapters({
    required MediaType type,
    required String id,
    required ChapterRequest request,
  }) async {
    try {
      final httpResponse = await _booksApi.getChapters(MediaType.manga.jsonValue, id, request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
