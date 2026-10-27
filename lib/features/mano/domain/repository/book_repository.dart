import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:application/features/mano/data/models/request/novel_request.dart';
import 'package:application/features/mano/data/models/response/chapter_response.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getMangas(MangaRequest request);
  Future<Either<Failure, List<Book>>> getNovels(NovelRequest request);
  Future<Either<Failure, Book>> getManga(String id);
  Future<Either<Failure, Book>> getNovel(String id);
  Future<Either<Failure, ChapterResponse<List<ManoChapter>>>> getChapters({
    required MediaType type,
    required String id,
    required ChapterRequest request,
  });
}
