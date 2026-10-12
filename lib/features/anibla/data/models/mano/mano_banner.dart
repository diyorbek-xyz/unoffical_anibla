import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_banner.g.dart';
part 'mano_banner.freezed.dart';

@freezed
abstract class ManoBanner with _$ManoBanner {
  const factory ManoBanner({
    @Default("") String id,
    @Default("") String description,
    @Default("") @JsonKey(name: "image_link") String imageLink,
    @Default(MediaType.manga) @JsonKey(name: "content_type") MediaType type,
  }) = _ManoCategory;
  factory ManoBanner.fromJson(Map<String, dynamic> json) => _$ManoBannerFromJson(json);
}
