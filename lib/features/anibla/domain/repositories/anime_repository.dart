import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/data/history_item.dart';
import 'package:application/features/anibla/data/models/local/saved_anime.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/request/animes_query.dart';
import 'package:application/features/anibla/data/models/response/big_response.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, Anime>> getSerie(MediaType type, String slug);
  Future<Either<Failure, BigResponse<Anime>>> getHomeAnimes(AnimesQuery query);
  Future<Either<Failure, bool>> saveMedia(String id, MediaType type);
  Future<Either<Failure, SavedAnimes>> getSaveMedias();
  Future<Either<Failure, bool>> unsaveMedia(String id, MediaType type);
  Future<Either<Failure, List<HistoryItem>>> getWatchHistory();

  Future<Either<Failure, BigResponse<Anime>>> getAnimes(AnimesQuery query);
}
