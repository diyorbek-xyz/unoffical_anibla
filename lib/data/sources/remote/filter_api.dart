import 'package:application/data/models/filter/filter_model.dart';
import 'package:application/core/network/dio_setup.dart';
import 'package:dio/dio.dart';

class FilterApi {
  Future<List<CategoryModel>> getCategories() async {
    Response response = await dio.get("/category");
    final categories = (response.data['data'] as List).map((value) => CategoryModel.fromJson(value)).toList();
    return categories;
  }

  Future<List<GenreModel>> getGenres() async {
    Response response = await dio.get('/janr');
    final genres = (response.data['data'] as List).map((value) => GenreModel.fromJson(value)).toList();
    return genres;
  }
}
