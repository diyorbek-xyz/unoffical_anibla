import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_callback.g.dart';
part 'mano_callback.freezed.dart';

@freezed
abstract class ManoCallback with _$ManoCallback {
  factory ManoCallback({
    @Default("") String code,
    @Default("") @JsonKey(name: "expires_at") String expiresDate,
    @Default("") @JsonKey(name: "redirect_uri") String redirectUri,
  }) = _ManoCallback;

  factory ManoCallback.fromJson(Map<String, dynamic> json) => _$ManoCallbackFromJson(json);
}
