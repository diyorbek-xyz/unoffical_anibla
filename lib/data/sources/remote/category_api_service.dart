import 'package:application/data/models/response_models/category_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'category_api_service.g.dart';

@RestApi()
abstract class CategoryApiService {
  factory CategoryApiService(Dio dio) = _CategoryApiService;

  @GET('/v1/categories')
  Future<HttpResponse<CategoryResponseModel>> getCategoriesList();
}
