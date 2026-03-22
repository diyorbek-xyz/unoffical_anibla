import 'package:application/core/resources/api_response.dart';
import 'package:application/features/template/data/models/template_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'template_api.g.dart';

@RestApi()
abstract class TemplateApi {
  factory TemplateApi(Dio dio) = _TemplateApi;

  @GET('/v1/sliders')
  Future<HttpResponse<ApiResponse<TemplateModel>>> getTemplate();
}
