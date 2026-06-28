import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'big_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BigResponseModel<T> {
  @JsonKey(name: "data")
  final List<T>? datas;
  final bool? success;
  final String? message;
  final Pagination? pagination;
  final dynamic error;
  const BigResponseModel({this.datas, this.error, this.message, this.pagination, this.success});
  factory BigResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BigResponseModelFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$BigResponseModelToJson(this, toJsonT);
}
