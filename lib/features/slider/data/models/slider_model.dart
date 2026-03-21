import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class SliderModel extends SliderEntity {
  @override
  @HiveField(0)
  get id => super.id;
  @override
  @HiveField(0)
  get image => super.image;
  @override
  @HiveField(0)
  get mobileImage => super.mobileImage;
  @override
  @HiveField(0)
  get anime => super.anime;
  @override
  @HiveField(0)
  get type => super.type;

  const SliderModel({required super.id, required super.anime, required super.image, required super.mobileImage, required super.type});

  
}
