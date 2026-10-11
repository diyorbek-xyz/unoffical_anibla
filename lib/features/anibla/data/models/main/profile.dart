import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/data/models/data/privacy.dart';
import 'package:application/features/anibla/data/models/data/session.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "profile.g.dart";
part "profile.freezed.dart";

@Freezed(fromJson: true, toJson: true)
sealed class Profile with _$Profile {
  const factory Profile.anibla({
    @Default("") String createdAt,
    @Default("") String name,
    @Default("") String email,
    @Default(0.0) double balance,
    @Default("") dynamic subscription,
    @Default("") String role,
    @Default(false) bool activated,
    @Default([]) List transactions,
    @Default("") String updatedAt,
    @Default([]) List<Session> sessions,
    @Default(0) int total,
    @Default("") @JsonKey(name: "apple_id") String appleId,
    @Default("") @JsonKey(name: "_id") String id,
    @Default(0) @JsonKey(name: "unique_id") int paymentId,
    @Default(0) @JsonKey(name: "phone_number") int phoneNumber,
    @Default(false) @JsonKey(name: "created_by_admin") bool createdByAdmin,
    @Default("") @JsonKey(name: "telegram_token") String telegramToken,
    @Default("") @JsonKey(name: "email_lc") String emailLC,
    @Default("") @JsonKey(name: "last_anime_type") String lastMediaType,
    @Default("") @JsonKey(name: "name_lc") String nameLC,
    @Default("") @JsonKey(name: "phone_str") String phoneStr,
    @Default("") @JsonKey(name: "unique_id_str") String paymentIdStr,
    @Default(Anime()) @JsonKey(name: "last_anime") Anime lastAnime,
    @Default("") @JsonKey(name: "token_id") String tokenId,
    @Default([]) @JsonKey(name: "saved_series") List<dynamic> savedSeries,
    @Default([]) @JsonKey(name: "saved_movies") List<dynamic> savedMovies,
    @Default("") @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String avatar,
    @Default(Privacy()) @JsonKey(name: "privacy_settings") Privacy privacySettings,
  }) = _AniblaProfile;

  const factory Profile.mano({
    @Default("") String id,
    @Default("") String role,
    @Default(0) double balance,
    @Default(0) int warning,
    @Default(false) bool banned,
    @Default("") String createdDate,
    @Default(0) @JsonKey(name: "external_user_id") int paymentId,
    @Default("") @JsonKey(name: "first_name") String name,
    @Default("") @JsonKey(name: "phone_number") String phoneNumber,
    @Default("") @JsonKey(name: "picture_link") String avatar,
    @Default("") @JsonKey(name: "admin_scope") String adminScope,
  }) = _ManoProfile;

  factory Profile.fromJson(dynamic json) {
    if (json["_id"] != null) return _$AniblaProfileFromJson(json);
    if (json["id"] != null) return _$ManoProfileFromJson(json);
    return Profile.mano(id: json.toString());
  }
}
