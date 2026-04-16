import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/source/local/anime_local.dart';
import 'package:application/features/animes/data/source/remote/anime_api.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeApi animeApi;
  final AnimeLocal animeLocal;
  const AnimeRepositoryImpl(this.animeApi, this.animeLocal);

  @override
  Future<Either<Failure, AnimeEntity>> getSerie(
    String type,
    String slug,
  ) async {
    try {
      final serie = await animeApi.getSerie(type.toLowerCase(), slug);
      if (serie.data.success) {
        return Right(AnimeMapper.modelToEntity(serie.data.data));
      } else {
        throw ExceptionMapper.mapResponseToDio(serie.response);
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> getHomeAnimes() async {
    try {
      final animes = await animeApi.getHomeAnimes();
      return Right(animes.data.data.map(AnimeMapper.modelToEntity).toList());
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
