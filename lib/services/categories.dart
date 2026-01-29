import 'package:application/boxes/boxes.dart';
import 'package:application/models/category.dart';
import 'package:application/services/setup.dart';
import 'package:dio/dio.dart';

class FetchCategories {
  Future<List<Category>> get() async {
    Response response = await dio.get("/category");
    List<Category> categories = (response.data['data'] as List).map((value) {
      Category category = Category.fromJson(value);
      categoriesBox.put((category.id), category);
      return category;
    }).toList();
    return categories;
  }
}

class FetchGenres {
  Future<List<Genre>> get() async {
    Response response = await dio.get('/janr');
    List<Genre> genres = (response.data['data'] as List).map((value) {
      Genre genre = Genre.fromJson(value);
      genresBox.put(genre.id, genre);
      return genre;
    }).toList();
    return genres;
  }
}
