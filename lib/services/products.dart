import 'package:application/services/models/products.dart';
import 'package:application/services/setup.dart';
import 'package:dio/dio.dart';

class FetchProducts {
  static final Fetch _fetch = Fetch();

  Future<List<Products>> get() async {
    Response response = await _fetch.get(url: "/products");
    List<Products> products = (response.data as List)
        .map((product) => Products.fromJson(product))
        .toList();
    return products;
  }
}
