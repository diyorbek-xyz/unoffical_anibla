import 'dart:io';

import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
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
  Future<Either<Failure, List<Manga>>> getMangas(MangaRequest request) async {
    try {
      final httpResponse = await _booksApi.getMangas(request);
      final mangas = httpResponse.data.data;
      await Future.wait(List.generate(mangas.length, (index) async => await _booksLocal.save(mangas[index].id, mangas[index])));
      return Right(mangas);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Either<Failure, Manga> getManga(String id) {
    final manga = _booksLocal.get(id);
    if (manga == null) return Left(ServerFailure(HttpStatus.notFound));
    return Right(manga);
  }
}
