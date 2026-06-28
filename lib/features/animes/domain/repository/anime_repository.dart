import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/data/models/responses/big_response.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, AnimeEntity>> getSerie(String type, String slug);
  Future<Either<Failure, BigResponse<AnimeEntity>>> getHomeAnimes(Paginator query);
}
