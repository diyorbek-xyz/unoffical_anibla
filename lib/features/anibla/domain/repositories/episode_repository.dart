import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/anibla/data/models/data/video.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<Episode>>> getEpisodes(String animeSlug, String seasonSlug);

  Future<Either<Failure, Video>> getVideo(String path);

  Future<Either<Failure, List<Episode>>> getDownloadedEpisodes();
}
