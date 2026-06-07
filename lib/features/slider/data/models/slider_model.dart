import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'slider_model.g.dart';
part 'slider_model.freezed.dart';

@HiveType(typeId: 10)
@freezed
sealed class SliderModel with _$SliderModel {
  factory SliderModel({
    @HiveField(0) @JsonKey(name: "_id") final String? id,
    @HiveField(1) @JsonKey(includeFromJson: true, fromJson: addBaseUrl) final String? image,
    @HiveField(2) @JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) final String? mobileImage,
    @HiveField(3) @JsonKey(name: "media") final AnimeModel? anime,
    @HiveField(4) @JsonKey(name: "mediaType") final dynamic type,
  }) = _SliderModel;

  factory SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);
}
