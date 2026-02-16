import 'package:application/data/models/response_models/carousel_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'carousel_api_service.g.dart';

@RestApi()
abstract class CarouselApiService {
  factory CarouselApiService(Dio dio) = _CarouselApiService;

  @GET('/v1/sliders')
  Future<HttpResponse<CarouselResponseModel>> getCarousel();
}
