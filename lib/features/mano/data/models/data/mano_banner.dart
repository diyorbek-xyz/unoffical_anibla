import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'mano_banner.g.dart';
part 'mano_banner.freezed.dart';

@freezed
@HiveType(typeId: 9566)
abstract class ManoBanner with _$ManoBanner {
  const factory ManoBanner({
    @HiveField(0) @Default("") String id,
    @HiveField(1) @Default("") String description,
    @HiveField(2) @Default("") @JsonKey(name: "image_link") String imageLink,
    @HiveField(3) @Default(MediaType.manga) @JsonKey(name: "content_type") MediaType type,
  }) = _ManoCategory;
  factory ManoBanner.fromJson(Map<String, dynamic> json) => _$ManoBannerFromJson(json);
}
