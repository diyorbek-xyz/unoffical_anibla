import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:application/features/common/data/models/responses/big_response.dart';
import 'package:application/features/common/data/models/responses/big_response_model.dart';

class BigResponseMapper {
  static BigResponseModel<T> toModel<T>(BigResponse<T> entity) =>
      BigResponseModel<T>(datas: entity.datas, error: entity.error, message: entity.message, pagination: entity.pagination, success: entity.success);
  static BigResponse<NEW> toEntity<OLD, NEW>(BigResponseModel<OLD>? model, List<NEW> Function(List<OLD>?) mapper) => BigResponse<NEW>(
    datas: mapper(model?.datas),
    error: model?.error ?? "",
    message: model?.message ?? "",
    pagination: model?.pagination ?? Pagination(),
    success: model?.success ?? false,
  );
}
