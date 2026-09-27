import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'plans_api.g.dart';

@RestApi()
abstract class PlansApi {
  factory PlansApi(Dio dio) = _PlansApi;

  @GET('/v1/plans')
  Future<ApiResponse<List<Plan>>> getPlans();
}
