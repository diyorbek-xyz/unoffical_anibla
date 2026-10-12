import 'package:application/features/anibla/data/models/main/mano_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "mano_authback.g.dart";
part "mano_authback.freezed.dart";

@freezed
abstract class ManoAuthed with _$ManoAuthed {
  const factory ManoAuthed({
    @Default(ManoProfile()) ManoProfile user,
    @Default("") @JsonKey(name: "access_token") String accessToken,
    @Default("") @JsonKey(name: "refresh_token") String refreshToken,
    @Default(0) @JsonKey(name: "expires_in") int expiresIn,
    @Default(0) @JsonKey(name: "refresh_expires_in") int refreshExpiresIn,
  }) = _ManoAuthed;

  factory ManoAuthed.fromJson(Map<String, dynamic> json) => _$ManoAuthedFromJson(json);
}
