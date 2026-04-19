import 'package:application/features/animes/domain/entities/download_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/domain/entities/video_entity.dart';
import 'package:application/network/download/download_video.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(String animeSlug, String seasonSlug);

  Future<Either<Failure, VideoEntity>> getVideo(String path);

  Future<Either<Failure, Stream<VideoDownloadState>>> downloadVideo(
    DownloadEntity download,
    Variant variant,
  );
}
