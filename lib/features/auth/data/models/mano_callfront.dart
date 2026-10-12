import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_callfront.g.dart';
part 'mano_callfront.freezed.dart';

@freezed
abstract class ManoCallfront with _$ManoCallfront {
  const factory ManoCallfront({
    @Default("") @JsonKey(name: "app_id") String appId,
    @Default("") @JsonKey(name: "redirect_uri") String redirectUri,
  }) = _ManoCallfront;

  factory ManoCallfront.fromJson(Map<String, dynamic> json) => _$ManoCallfrontFromJson(json);
}
