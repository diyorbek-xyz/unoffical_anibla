import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/saved_medias.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/data/models/responses/big_response.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, AnimeEntity>> getSerie(AnimeType type, String slug);
  Future<Either<Failure, BigResponse<AnimeEntity>>> getHomeAnimes(Paginator query);
  Future<Either<Failure, bool>> saveMedia(String id, AnimeType type);
  Future<Either<Failure, SavedMedias>> getSaveMedias();
  Future<Either<Failure, bool>> unsaveMedia(String id, AnimeType type);
}
