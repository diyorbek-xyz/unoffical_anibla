import 'package:application/data/models/filter.dart';
import 'package:application/data/setup.dart';
import 'package:dio/dio.dart';

class FilterApi {
  Future<List<Category>> getCategories() async {
    Response response = await dio.get("/category");
    List<Category> categories = (response.data['data'] as List).map((value) => Category.fromJson(value)).toList();
    return categories;
  }

  Future<List<Genre>> getGenres() async {
    Response response = await dio.get('/janr');
    List<Genre> genres = (response.data['data'] as List).map((value) => Genre.fromJson(value)).toList();
    return genres;
  }
}
