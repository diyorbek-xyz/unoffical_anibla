import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'slider.g.dart';
part 'slider.freezed.dart';

@freezed
@HiveType(typeId: 108)
abstract class Slider with _$Slider {
  const factory Slider({
    @Default("") @HiveField(0) @JsonKey(name: "_id") String id,
    @Default("") @HiveField(1) @JsonKey(includeFromJson: true, fromJson: addBaseUrl) String image,
    @Default("") @HiveField(2) @JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) String mobileImage,
    @Default(Anime()) @HiveField(3) @JsonKey(name: "media") Anime anime,
    @Default(AnimeType.movie) @HiveField(4) @JsonKey(name: "mediaType") AnimeType type,
  }) = _Slider;

  factory Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);
}
