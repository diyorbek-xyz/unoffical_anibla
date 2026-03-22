import 'package:application/core/utils/utils.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class SliderModel extends SliderEntity {
  @override
  @HiveField(0)
  @JsonKey(name: "_id")
  get id => super.id;
  @override
  @HiveField(1)
  @JsonKey(includeFromJson: true, fromJson: addBaseUrl)
  get image => super.image;
  @override
  @HiveField(2)
  @JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl)
  get mobileImage => super.mobileImage;
  @override
  @HiveField(3)
  @JsonKey(name: "media")
  get anime => super.anime;
  @override
  @HiveField(4)
  @JsonKey(name: "mediaType")
  get type => super.type;

  const SliderModel({required super.id, required super.anime, required super.image, required super.mobileImage, required super.type});

  factory SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);
  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
