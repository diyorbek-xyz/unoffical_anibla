import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/data/models/data/privacy.dart';
import 'package:application/features/anibla/data/models/data/session.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'anibla_profile.g.dart';
part 'anibla_profile.freezed.dart';

@HiveType(typeId: 203)
@Freezed(fromJson: true, toJson: true)
abstract class AniblaProfile with _$AniblaProfile {
  const AniblaProfile._();
  const factory AniblaProfile({
    @HiveField(1) @Default("") String createdAt,
    @HiveField(2) @Default("") String name,
    @HiveField(3) @Default("") String email,
    @HiveField(4) @Default(0.0) double balance,
    @HiveField(5) @Default("") dynamic subscription,
    @HiveField(6) @Default("") String role,
    @HiveField(7) @Default(false) bool activated,
    @HiveField(8) @Default([]) List transactions,
    @HiveField(9) @Default("") String updatedAt,
    @HiveField(10) @Default([]) List<Session> sessions,
    @HiveField(11) @Default(0) int total,
    @HiveField(12) @Default("") @JsonKey(name: "apple_id") String appleId,
    @HiveField(13) @Default("") @JsonKey(name: "_id") String id,
    @HiveField(14) @Default(0) @JsonKey(name: "unique_id") int paymentId,
    @HiveField(15) @Default(0) @JsonKey(name: "phone_number") int phoneNumber,
    @HiveField(16) @Default(false) @JsonKey(name: "created_by_admin") bool createdByAdmin,
    @HiveField(17) @Default("") @JsonKey(name: "telegram_token") String telegramToken,
    @HiveField(18) @Default("") @JsonKey(name: "email_lc") String emailLC,
    @HiveField(19) @Default("") @JsonKey(name: "last_anime_type") String lastMediaType,
    @HiveField(20) @Default("") @JsonKey(name: "name_lc") String nameLC,
    @HiveField(21) @Default("") @JsonKey(name: "phone_str") String phoneStr,
    @HiveField(22) @Default("") @JsonKey(name: "unique_id_str") String paymentIdStr,
    @HiveField(23) @Default(Anime()) @JsonKey(name: "last_anime") Anime lastAnime,
    @HiveField(24) @Default("") @JsonKey(name: "token_id") String tokenId,
    @HiveField(25) @Default([]) @JsonKey(name: "saved_series") List<dynamic> savedSeries,
    @HiveField(26) @Default([]) @JsonKey(name: "saved_movies") List<dynamic> savedMovies,
    @HiveField(27) @Default("") @JsonKey(name: "image") @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String avatar,
    @HiveField(28) @Default(Privacy()) @JsonKey(name: "privacy_settings") Privacy privacySettings,
  }) = _AniblaProfile;

  factory AniblaProfile.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return _$AniblaProfileFromJson(json);
    return AniblaProfile(id: json);
  }
}
