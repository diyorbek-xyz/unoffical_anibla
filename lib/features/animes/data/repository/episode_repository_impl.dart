import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/data/mapper/download_mapper.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/data/mapper/video_mapper.dart';
import 'package:application/features/animes/data/models/download_model.dart';
import 'package:application/features/animes/data/source/local/downloads_local.dart';
import 'package:application/features/animes/data/source/remote/episode_api.dart';
import 'package:application/features/animes/data/source/remote/video_api.dart';
import 'package:application/features/animes/domain/entities/download_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/domain/entities/video_entity.dart';
import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/network/download/download_video.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeApi episodeApi;
  final VideoApi videoApi;
  final DownloadsLocal downloadsLocal;
  final VideoDownloader videoDownloader;
  const EpisodeRepositoryImpl(
    this.episodeApi,
    this.videoApi,
    this.downloadsLocal,
    this.videoDownloader,
  );

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(
    String animeSlug,
    String seasonSlug,
  ) async {
    try {
      final httResponse = await episodeApi.getEpisodes(animeSlug, seasonSlug);
      final downloads = await downloadsLocal.getEntries();
      return Right(
        httResponse.data.data.map((e) {
          if (downloads.isEmpty) return EpisodeMapper.modelToEntity(e);
          final downloadedEp = downloads.singleWhere(
            (element) => element.episodeId == e.id,
            orElse: () => DownloadModel(episodeId: "", file: "", skip: ""),
          );
          if (downloadedEp.episodeId.isEmpty) return EpisodeMapper.modelToEntity(e);
          print("MASTER:" + downloadedEp.file);
          return EpisodeMapper.modelToEntity(e, isDownloaded: true, video: downloadedEp.file);
        }).toList(),
      );
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
  Future<Either<Failure, Stream<VideoDownloadState>>> downloadVideo(
    DownloadEntity download,
    Variant variant,
  ) async {
    try {
      if (download.file.isEmpty) return Left(SimpleFailure("Obuna talab qilinadi"));
      final video = await videoApi.getVideo(getStreamId(download.file));
      if (video.data.file == null) return Left(SimpleFailure("Video manzili topilmadi"));
      return Right(
        videoDownloader.downloadVideo(
          masterPath: video.data.file!,
          folderName: download.episodeId,
          selectedVariant: variant,
          onDownloaded: (path) async =>
              await downloadsLocal.saveVideo(DownloadMapper.entityToModel(download, path)),
        ),
      );
    } catch (e) {
      return Left(SimpleFailure(e.toString()));
    }
  }
}
