import 'package:application/data/models/common/miscs_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'video_api_service.g.dart';

@RestApi(baseUrl: "")
abstract class VideoApiService {
  factory VideoApiService(Dio dio) = _VideoApiService;

  @GET("{video}?format=api")
  Future<HttpResponse<VideoModel>> getVideo(@Path("video") String video);
}
