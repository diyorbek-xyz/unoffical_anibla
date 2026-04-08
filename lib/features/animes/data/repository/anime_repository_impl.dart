import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/source/remote/anime_api.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeApi animeApi;
  const AnimeRepositoryImpl(this.animeApi);

  @override
  Future<Either<Failure, AnimeEntity>> getSerie(String slug) async {
    try {
      final serie = await animeApi.getSerie(slug);
      return Right(AnimeMapper.modelToEntity(serie.data.data));
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
