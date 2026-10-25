import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/main/novel.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:application/features/mano/data/models/request/novel_request.dart';
import 'package:application/features/mano/data/models/response/chapter_response.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Manga>>> getMangas(MangaRequest request);
  Future<Either<Failure, List<Novel>>> getNovels(NovelRequest request);
  Future<Either<Failure, Manga>> getManga(String id);
  Future<Either<Failure, Novel>> getNovel(String id);
  Future<Either<Failure, ChapterResponse<List<ManoChapter>>>> getChapters({
    required MediaType type,
    required String id,
    required ChapterRequest request,
  });
}
