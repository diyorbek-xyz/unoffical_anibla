import 'package:application/core/utils/base_url.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@HiveType(typeId: 141)
@JsonSerializable()
class ItemModel {
  @HiveField(0)
  final String? name;
  @JsonKey(fromJson: addBaseUrl, includeFromJson: true)
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? role;
  @HiveField(3)
  final bool? status;
  const ItemModel({this.image, this.name, this.role, this.status});

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
