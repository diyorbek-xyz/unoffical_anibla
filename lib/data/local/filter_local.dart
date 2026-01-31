import 'package:application/data/local/boxes.dart';
import 'package:application/data/models/filter.dart';

class FilterLocal {
  List<Category>? getCategories() {
    return categoriesBox.values.toList();
  }

  List<Genre>? getGenres() {
    return genresBox.values.toList();
  }

  Category? getCategory(String id) {
    return categoriesBox.get(id);
  }

  Genre? getGenre(String id) {
    return genresBox.get(id);
  }

  Future<void> saveCategory(Category category) async {
    await categoriesBox.put(category.id, category);
  }

  Future<void> saveManyCategories(List<Category> categories) async {
    for (var category in categories) {
      await categoriesBox.put(category.id, category);
    }
  }

  Future<void> saveGenre(Genre genre) async {
    await genresBox.put(genre.id, genre);
  }

  Future<void> saveManyGenres(List<Genre> genres) async {
    for (var genre in genres) {
      await genresBox.put(genre.id, genre);
    }
  }
}
