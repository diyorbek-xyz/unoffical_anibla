import 'package:application/data/sources/remote/filter_api.dart';
import 'package:application/data/sources/local/filter_local.dart';
import 'package:application/data/models/filter/filter_model.dart';

class FilterRepository {
  final _api = FilterApi();
  final _local = FilterLocal();

  Future<List<CategoryModel>> getCategories() async {
    try {
      List<CategoryModel> categories = await _api.getCategories();
      await _local.saveManyCategories(categories);
      return categories;
    } catch (_) {
      final categories = _local.getCategories();
      if (categories != null && categories.isNotEmpty) return categories;
      throw Exception("Ma'lumot topilmadi");
    }
  }

  Future<CategoryModel> getCategory(String id) async {
    final category = _local.getCategory(id);
    if (category != null) return category;
    throw Exception("Ma'lumot topilmadi");
  }

  Future<List<GenreModel>> getGenres() async {
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

  Future<GenreModel> getGenre(String id) async {
    final genre = _local.getGenre(id);
    if (genre != null) return genre;
    throw Exception("Ma'lumot topilmadi");
  }
}
