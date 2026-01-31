import 'package:application/data/api/filter_api.dart';
import 'package:application/data/local/filter_local.dart';
import 'package:application/data/models/filter.dart';

class FilterRepository {
  final _api = FilterApi();
  final _local = FilterLocal();

  Future<List<Category>> getCategories() async {
    try {
      List<Category> categories = await _api.getCategories();
      await _local.saveManyCategories(categories);
      return categories;
    } catch (_) {
      final categories = _local.getCategories();
      if (categories != null && categories.isNotEmpty) return categories;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<Category> getCategory(String id) async {
    final category = _local.getCategory(id);
    if (category != null) return category;
    throw Exception("Ma'lumot topilmadi");
  }

  Future<List<Genre>> getGenres() async {
    try {
      final genres = await _api.getGenres();
      await _local.saveManyGenres(genres);
      return genres;
    } catch (_) {
      final genres = _local.getGenres();
      if (genres != null && genres.isNotEmpty) return genres;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<Genre> getGenre(String id) async {
    final genre = _local.getGenre(id);
    if (genre != null) return genre;
    throw Exception("Ma'lumot topilmadi");
  }
}
