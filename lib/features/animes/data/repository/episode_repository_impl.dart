import 'package:application/core/resources/cache_entry.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/data/mapper/video_mapper.dart';
import 'package:application/features/animes/data/source/remote/episode_api.dart';
import 'package:application/features/animes/data/source/remote/video_api.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/domain/entities/video_entity.dart';
import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeApi episodeApi;
  final VideoApi videoApi;
  final DownloadsLocal downloadsLocal;
  EpisodeRepositoryImpl(this.episodeApi, this.videoApi, this.downloadsLocal);

  final Map<String, CacheEntry<List<EpisodeEntity>>> _cache = {};

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(String animeSlug, String seasonSlug) async {
    try {
      final cache = _cache[animeSlug];
      if (cache != null && !cache.isExpired) return Right(cache.data);

      final httResponse = await episodeApi.getEpisodes(animeSlug, seasonSlug);
      final data = httResponse.data.data.map(EpisodeMapper.modelToEntity).toList();
      _cache[animeSlug] = CacheEntry(data);
      return Right(data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, VideoEntity>> getVideo(String path) async {
    try {
      final httpResponse = await videoApi.getVideo(getStreamId(path));
      return Right(VideoMapper.modelToEntity(httpResponse.data));
    } on DioException catch (e) {
      return Left(SimpleFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getDownloadedEpisodes() {
    throw UnimplementedError();
  }
}
