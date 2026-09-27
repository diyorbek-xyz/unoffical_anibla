import 'package:application/core/resources/api_response.dart';
import 'package:application/features/anibla/data/models/data/slider.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'slider_api.g.dart';

@RestApi()
abstract class SliderApi {
  factory SliderApi(Dio dio) = _SliderApi;

  @GET('/v1/sliders')
  Future<HttpResponse<ApiResponse<List<Slider>>>> getCarousel();
}
