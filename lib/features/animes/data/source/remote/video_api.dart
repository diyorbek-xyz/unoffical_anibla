import 'package:application/features/animes/data/models/video_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'video_api.g.dart';

@RestApi(baseUrl: "https://anibla.uz/",headers: {})
abstract class VideoApi {
  factory VideoApi(Dio dio) => _VideoApi(dio);

  @GET("/stream/{id}?format=api")
  Future<HttpResponse<VideoModel>> getVideo(@Path('id') String id);
}
