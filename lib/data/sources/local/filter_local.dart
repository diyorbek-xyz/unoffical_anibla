import 'package:application/data/sources/local/boxes.dart';
import 'package:application/data/models/filter/filter_model.dart';

class FilterLocal {
  List<CategoryModel>? getCategories() {
    return categoriesBox.values.toList();
  }

  List<GenreModel>? getGenres() {
    return genresBox.values.toList();
  }

  CategoryModel? getCategory(String id) {
    return categoriesBox.get(id);
  }

  GenreModel? getGenre(String id) {
    return genresBox.get(id);
  }

  Future<void> saveCategory(CategoryModel category) async {
    await categoriesBox.put(category.id, category);
  }

  Future<void> saveManyCategories(List<CategoryModel> categories) async {
    for (var category in categories) {
      await categoriesBox.put(category.id, category);
    }
  }

  Future<void> saveGenre(GenreModel genre) async {
    await genresBox.put(genre.id, genre);
  }

  Future<void> saveManyGenres(List<GenreModel> genres) async {
    for (var genre in genres) {
      await genresBox.put(genre.id, genre);
    }
  }
}
