import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/core/network/dio_setup.dart';
import 'package:application/core/utils/utils.dart';
import 'package:dio/dio.dart';

class AnimesApi {
  final int page;
  final int limit;
  const AnimesApi({this.page = 1, this.limit = 12});

  Future<List<AnimeModel>> getAll() async {
    Response<dynamic> response = await dio.post(
      "/season/home",
      data: {'category': "653f7b1380692ab4bfe9148f"},
      queryParameters: {"page": page, "limit": limit},
    );
    final animes = (response.data['data'] as List).map((value) => AnimeModel.fromJson(value)).toList();
    return animes;
  }

  Future<List<AnimeModel>> getManyByCategory(String id) async {
    Response<dynamic> responseAnimes = await dio.post(
      "/season/home",
      data: {'category': id},
      queryParameters: {"page": page, "limit": limit},
    );
    final animes = (responseAnimes.data['data'] as List).map((value) => AnimeModel.fromJson(value)).toList();

    return animes;
  }

  Future<AnimeModel> getById(String id) async {
    Response<dynamic> response = await dio.get("/season/v2/$id");
    final anime = AnimeModel.fromJson(response.data['data']);
    return anime;
  }

  Future<List<CarouselItemModel>> getCarousel() async {
    Response<dynamic> response = await newDio.get('/v1/sliders');
    final carousel = (response.data['data'] as List).map((value) => CarouselItemModel.fromJson(value)).toList();
    return carousel;
  }

  Future<CalendarModel> getCalendar(DateTime date) async {
    String dateStr = FormatDate.format(date).compact;
    Response<dynamic> response = await newDio.get("/v1/timer/time/$dateStr");
    final calendar = CalendarModel.fromJson(response.data['data'], date);
    return calendar;
  }

  Future<List<AnimeModel>> search(String text) async {
    Response<dynamic> response = await dio.get("/season/search", queryParameters: {"text": text});
    final animes = (response.data['data'] as List).map((anime) => AnimeModel.fromJson(anime)).toList();
    return animes;
  }

  Future<VideoModel> getVideo(String stream) async {
    Response<dynamic> response = await dio.get(stream, queryParameters: {'format': "api"});
    final video = VideoModel.fromJson(response.data);
    return video;
  }

  Future<List<EpisodeModel>> getAllEpisodes(String animeSlug, String seasonSlug) async {
    Response response = await newDio.get("/v1/episodes/$animeSlug/$seasonSlug");
    final episodes = (response.data['data'] as List).map((episode) => EpisodeModel.fromJson(episode)).toList();
    return episodes;
  }

  Future<List<SeasonModel>> getAllSeasons(String animeSlug) async {
    Response response = await newDio.get("/v1/seasons/$animeSlug");
    final seasons = (response.data as List).map((season) => SeasonModel.fromJson(season)).toList();
    return seasons;
  }

  Future<SeasonModel> getSeason(String animeSlug, String seasonSlug) async {
    Response response = await newDio.get("/v1/seasons/$animeSlug/$seasonSlug");
    final season = SeasonModel.fromJson(response.data['data']);
    return season;
  }
}
