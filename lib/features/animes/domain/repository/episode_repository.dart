import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/domain/entities/video_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(String animeSlug, String seasonSlug);

  Future<Either<Failure, VideoEntity>> getVideo(String id);
}
