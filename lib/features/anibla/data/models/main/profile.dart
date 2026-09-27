import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/data/models/data/privacy.dart';
import 'package:application/features/anibla/data/models/data/session.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'profile.g.dart';
part 'profile.freezed.dart';

@HiveType(typeId: 203)
@Freezed(fromJson: true, toJson: true)
abstract class Profile with _$Profile {
  const factory Profile({
    @Default("") @HiveField(1) String createdAt,
    @Default("") @HiveField(2) String name,
    @Default("") @HiveField(3) String email,
    @Default(0.0) @HiveField(4) double balance,
    @Default("") @HiveField(5) dynamic subscription,
    @Default("") @HiveField(6) String role,
    @Default(false) @HiveField(7) bool activated,
    @Default([]) @HiveField(8) List transactions,
    @Default("") @HiveField(9) String updatedAt,
    @Default([]) @HiveField(10) List<Session> sessions,
    @Default(0) @HiveField(11) int total,
    @Default("") @HiveField(12) @JsonKey(name: "apple_id") String appleId,
    @Default("") @HiveField(13) @JsonKey(name: "_id") String id,
    @Default(0) @HiveField(14) @JsonKey(name: "unique_id") int paymentId,
    @Default(0) @HiveField(15) @JsonKey(name: "phone_number") int phoneNumber,
    @Default(false) @HiveField(16) @JsonKey(name: "created_by_admin") bool createdByAdmin,
    @Default("") @HiveField(17) @JsonKey(name: "telegram_token") String telegramToken,
    @Default("") @HiveField(18) @JsonKey(name: "email_lc") String emailLC,
    @Default("") @HiveField(19) @JsonKey(name: "last_anime_type") String lastAnimeType,
    @Default("") @HiveField(20) @JsonKey(name: "name_lc") String nameLC,
    @Default("") @HiveField(21) @JsonKey(name: "phone_str") String phoneStr,
    @Default("") @HiveField(22) @JsonKey(name: "unique_id_str") String paymentIdStr,
    @Default(Anime()) @HiveField(23) @JsonKey(name: "last_anime") Anime lastAnime,
    @Default("") @HiveField(24) @JsonKey(name: "token_id") String tokenId,
    @Default([]) @HiveField(25) @JsonKey(name: "saved_series") List<dynamic> savedSeries,
    @Default([]) @HiveField(26) @JsonKey(name: "saved_movies") List<dynamic> savedMovies,
    @Default("") @HiveField(27) @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String image,
    @Default(Privacy()) @HiveField(28) @JsonKey(name: "privacy_settings") Privacy privacySettings,
  }) = _Profile;

  factory Profile.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return _$ProfileFromJson(json);
    return Profile(id: json);
  }
}
