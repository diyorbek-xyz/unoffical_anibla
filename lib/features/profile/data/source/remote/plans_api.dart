import 'package:application/core/resources/api_response.dart';
import 'package:application/features/profile/data/models/plan_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'plans_api.g.dart';

@RestApi()
abstract class PlansApi {
  factory PlansApi(Dio dio) = _PlansApi;

  @GET('/v1/plans')
  Future<ApiResponse<List<PlanModel>>> getPlans();
}
