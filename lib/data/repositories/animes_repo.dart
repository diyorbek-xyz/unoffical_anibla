import 'package:application/data/api/animes_api.dart';
import 'package:application/data/local/animes_local.dart';
import 'package:application/data/models/anime.dart';

class AnimesRepository {
  final _api = AnimesApi();
  final _local = AnimesLocal();

  Future<List<Anime>> getAll() async {
    try {
      List<Anime> animes = await _api.getAll();
      await _local.saveMany(animes);
      return animes;
    } catch (_) {
      final cached = _local.getAll();
      if (cached != null && cached.isNotEmpty) return cached;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<Anime> getById(String id) async {
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

  Future<List<Anime>> getManyByCategory(String id) async {
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

  Future<List<Anime>> getCarousel() async {
    try {
      final animes = await _api.getCarousel();
      await _local.saveCarousel(animes);
      return animes;
    } catch (_) {
      final animes = _local.getCarousel();
      if (animes != null && animes.isNotEmpty) return animes;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<List<Anime>> getCalender() async {
    try {
      final animes = await _api.getCalendar();
      await _local.saveCalendar(animes);
      return animes;
    } catch (_) {
      final animes = _local.getCalendar();
      if (animes != null && animes.isNotEmpty) return animes;
      throw Exception("Ma'lumot topilmadi");
    }
  }
}
