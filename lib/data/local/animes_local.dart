import 'package:application/data/local/boxes.dart';
import 'package:application/data/models/anime.dart';
import 'package:application/data/models/filter.dart';

class AnimesLocal {
  List<Anime>? getAll() {
    return animesBox.values.toList();
  }

  Anime? get(String id) {
    return animesBox.get(id);
  }

  Future<void> save(Anime anime) async {
    await animesBox.put(anime.id, anime);
  }

  Future<void> saveMany(List<Anime> animes) async {
    for (var anime in animes) {
      save(anime);
    }
  }

  Future<void> saveCarousel(List<Anime> animes) async {
    for (var anime in animes) {
      carouselBox.put(anime.id, anime);
    }
  }

  Future<void> saveCalendar(List<Anime> animes) async {
    for (var anime in animes) {
      calendarBox.put(anime.id, anime);
    }
  }

  List<Anime>? getCarousel() {
    return carouselBox.values.toList();
  }
  List<Anime>? getCalendar() {
    return calendarBox.values.toList();
  }
}

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

  Future<void> saveGenre(Genre genre) async {
    await genresBox.put(genre.id, genre);
  }

  Future<void> saveManyCategory(List<Category> categories) async {
    for (var category in categories) {
      await saveCategory(category);
    }
  }

  Future<void> saveManyGenres(List<Genre> genres) async {
    for (var genre in genres) {
      await saveGenre(genre);
    }
  }
}
