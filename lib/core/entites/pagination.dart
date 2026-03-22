import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

class Pagination extends Equatable {
  final int total;
  final int limit;
  final int page;
  final int pages;
  const Pagination({required this.limit, required this.page, required this.pages, required this.total});

  @override
  List<Object?> get props => [total, limit, page, pages];
}

@HiveType(typeId: 1)
@JsonSerializable()
class PaginationModel extends Pagination {
  @HiveField(0)
  @override
  get limit => super.limit;
  @HiveField(1)
  @override
  get page => super.page;
  @HiveField(2)
  @override
  get pages => super.pages;
  @HiveField(3)
  @override
  get total => super.total;
  const PaginationModel({required super.limit, required super.total, required super.pages, required super.page});

  factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
  static Map<String, dynamic> staticToJson(PaginationModel json) => _$PaginationModelToJson(json);
}
