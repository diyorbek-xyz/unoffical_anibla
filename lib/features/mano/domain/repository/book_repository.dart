import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Manga>>> getMangas(MangaRequest request);
  Either<Failure, Manga> getManga(String id);
}
