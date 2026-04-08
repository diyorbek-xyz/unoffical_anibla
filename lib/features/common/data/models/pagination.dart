import 'package:hive_ce/hive_ce.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(includeIfNull: true)
class Pagination {
  @HiveField(0)
  final int limit;
  @HiveField(1)
  final int page;
  @HiveField(2)
  final int pages;
  @HiveField(3)
  final int total;
  const Pagination({
    this.limit = 0,
    this.total = 0,
    this.pages = 0,
    this.page = 0,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
  static Map<String, dynamic> staticToJson(Pagination json) =>
      _$PaginationToJson(json);
}
