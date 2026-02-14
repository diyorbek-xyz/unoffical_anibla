import 'package:application/data/models/other/calendar_model.dart';
import 'package:application/data/models/other/carousel_model.dart';
import 'package:application/data/models/animes/episode_model.dart';
import 'package:application/data/models/animes/season_model.dart';
import 'package:application/data/sources/remote/animes_api.dart';
import 'package:application/data/sources/local/animes_local.dart';
import 'package:application/data/models/animes/anime_model.dart';

class AnimesRepository {
  final _api = AnimesApi();
  final _local = AnimesLocal();

  Future<List<AnimeModel>> getAll() async {
    try {
      List<AnimeModel> animes = await _api.getAll();
      await _local.saveMany(animes);
      return animes;
    } catch (_) {
      final cached = _local.getAll();
      if (cached != null && cached.isNotEmpty) return cached;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<AnimeModel> getById(String id) async {
    try {
      final anime = await _api.getById(id);
      await _local.save(anime);
      return anime;
    } catch (_) {
      final anime = _local.get(id);
      if (anime != null) return anime;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<List<AnimeModel>> getManyByCategory(String id) async {
    try {
      final animes = await _api.getManyByCategory(id);
      await _local.saveMany(animes);
      return animes;
    } catch (_) {
      final animes = _local.getAll();
      if (animes != null && animes.isNotEmpty) return animes;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<List<CarouselItemModel>> getCarousel() async {
    try {
      final carousel = await _api.getCarousel();
      await _local.saveCarousel(carousel);
      return carousel;
    } catch (e) {
      final animes = _local.getCarousel();
      if (animes != null && animes.isNotEmpty) return animes;
      throw Exception("Ma'lumot topilmadi: ${e.toString()}");
    }
  }

  Future<CalendarModel> getCalender(DateTime date) async {
    try {
      final calendar = await _api.getCalendar(date);
      await _local.saveCalendar(calendar);
      return calendar;
    } catch (err) {
      final animes = _local.getCalendar(date);
      if (animes != null) return animes;
      throw Exception("Ma'lumot topilmadi: ${err.toString()}");
    }
  }

  Future<List<AnimeModel>> searchAnime(String value) async {
    try {
      if (value.isEmpty) throw Exception();
      final animes = await _api.search(value);
      return animes;
    } catch (e) {
      final animes = _local.getSearchHistory();
      if (animes != null && animes.isNotEmpty) return animes;
      throw Exception("Anime Topilmadi");
    }
  }

  Future<List<EpisodeModel>> getAllEpisodes(String animeSlug, String seasonSlug) async {
    try {
      final response = await _api.getAllEpisodes(animeSlug, seasonSlug);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SeasonModel>> getAllSeasons(String animeSlug) async {
    try {
      final response = await _api.getAllSeasons(animeSlug);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SeasonModel> getSeason(String animeSlug, String seasonSlug) async {
    try {
      final response = await _api.getSeason(animeSlug, seasonSlug);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
