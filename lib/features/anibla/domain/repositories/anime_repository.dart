import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/local/saved_anime.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/data/models/responses/big_response.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, Anime>> getSerie(AnimeType type, String slug);
  Future<Either<Failure, BigResponse<Anime>>> getHomeAnimes(Paginator query);
  Future<Either<Failure, bool>> saveMedia(String id, AnimeType type);
  Future<Either<Failure, SavedAnimes>> getSaveMedias();
  Future<Either<Failure, bool>> unsaveMedia(String id, AnimeType type);
}
