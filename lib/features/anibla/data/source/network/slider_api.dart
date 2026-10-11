import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/data/carousel_item.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'slider_api.g.dart';

@RestApi()
abstract class SliderApi {
  factory SliderApi(AniblaClient dio) = _SliderApi;

  @GET('/v1/sliders')
  Future<HttpResponse<ApiResponse<List<CarouselItem>>>> getCarousel();
}
