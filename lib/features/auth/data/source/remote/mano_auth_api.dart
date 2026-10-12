import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/features/auth/data/models/mano_authback.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'mano_auth_api.g.dart';

@RestApi()
abstract class ManoAuthApi {
  factory ManoAuthApi(ManoClient dio) = _ManoAuthApi;

  @POST("/v2/auth/anibla/callback")
  Future<HttpResponse<ManoAuthed>> authAnibla(@Body() Map<String, dynamic> body);
}
