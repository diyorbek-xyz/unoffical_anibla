import 'package:application/core/resources/cache_entry.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/anibla/data/models/data/video.dart';
import 'package:application/features/anibla/data/source/network/episode_api.dart';
import 'package:application/features/anibla/data/source/network/video_api.dart';
import 'package:application/features/anibla/domain/repositories/episode_repository.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeApi episodeApi;
  final VideoApi videoApi;
  final DownloadsLocal downloadsLocal;
  EpisodeRepositoryImpl(this.episodeApi, this.videoApi, this.downloadsLocal);

  final Map<String, CacheEntry<List<Episode>>> _cache = {};

  @override
  Future<Either<Failure, List<Episode>>> getEpisodes(String animeSlug, String seasonSlug) async {
    try {
      final cache = _cache[animeSlug];
      if (cache != null && !cache.isExpired) return Right(cache.data);

      final httResponse = await episodeApi.getEpisodes(animeSlug, seasonSlug);
      final data = httResponse.data.data;
      _cache[animeSlug] = CacheEntry(data);
      return Right(data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Video>> getVideo(String path) async {
    try {
      final httpResponse = await videoApi.getVideo(getStreamId(path));
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(SimpleFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Episode>>> getDownloadedEpisodes() {
    throw UnimplementedError();
  }
}
