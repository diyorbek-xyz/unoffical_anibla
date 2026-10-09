import 'package:application/features/anibla/data/models/data/video.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'video_api.g.dart';

@RestApi(baseUrl: "", headers: {})
abstract class VideoApi {
  factory VideoApi(Dio dio) => _VideoApi(dio);

  @GET("{url}?format=api")
  Future<HttpResponse<Video>> getVideo(@Path('url') String url);
}
