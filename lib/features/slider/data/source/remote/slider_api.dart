import 'package:application/features/slider/data/models/slider_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'carousel_api_service.g.dart';

@RestApi()
abstract class CarouselApiService {
  factory CarouselApiService(Dio dio) = _CarouselApiService;

  @GET('/v1/sliders')
  Future<HttpResponse<SliderModel>> getCarousel();
}
