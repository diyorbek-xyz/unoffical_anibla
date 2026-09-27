import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/local/saved_anime.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/response/big_response.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, Anime>> getSerie(AnimeType type, String slug);
  Future<Either<Failure, BigResponse<Anime>>> getHomeAnimes(Pagination query);
  Future<Either<Failure, bool>> saveMedia(String id, AnimeType type);
  Future<Either<Failure, SavedAnimes>> getSaveMedias();
  Future<Either<Failure, bool>> unsaveMedia(String id, AnimeType type);
}
