import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/profile/data/models/profile/privacy_model.dart';
import 'package:application/features/profile/data/models/profile/session_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'profile_model.g.dart';
part 'profile_model.freezed.dart';

@HiveType(typeId: 7)
@Freezed(fromJson: true, toJson: true)
sealed class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    @HiveField(1) DateTime? createdAt,
    @HiveField(2) String? name,
    @HiveField(3) String? email,
    @HiveField(4) double? balance,
    @HiveField(5) dynamic subscription,
    @HiveField(6) String? role,
    @HiveField(7) bool? activated,
    @HiveField(8) List? transactions,
    @HiveField(9) DateTime? updatedAt,
    @HiveField(10) List<SessionModel>? sessions,
    @HiveField(11) int? total,
    @HiveField(12) @JsonKey(name: "apple_id") String? appleId,
    @HiveField(13) @JsonKey(name: "_id") String? id,
    @HiveField(14) @JsonKey(name: "unique_id") int? paymentId,
    @HiveField(15) @JsonKey(name: "phone_number") int? phoneNumber,
    @HiveField(16) @JsonKey(name: "created_by_admin") bool? createdByAdmin,
    @HiveField(17) @JsonKey(name: "telegram_token") String? telegramToken,
    @HiveField(18) @JsonKey(name: "email_lc") String? emailLC,
    @HiveField(19) @JsonKey(name: "last_anime_type") String? lastAnimeType,
    @HiveField(20) @JsonKey(name: "name_lc") String? nameLC,
    @HiveField(21) @JsonKey(name: "phone_str") String? phoneStr,
    @HiveField(22) @JsonKey(name: "unique_id_str") String? paymentIdStr,
    @HiveField(23) @JsonKey(name: "last_anime") AnimeModel? lastAnime,
    @HiveField(24) @JsonKey(name: "token_id") String? tokenId,
    @HiveField(25) @JsonKey(name: "saved_series") List<dynamic>? savedSeries,
    @HiveField(26) @JsonKey(name: "saved_movies") List<dynamic>? savedMovies,
    @HiveField(27) @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? image,
    @HiveField(28) @JsonKey(name: "privacy_settings") PrivacyModel? privacySettings,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return _$ProfileModelFromJson(json);
    return ProfileModel(id: json);
  }
}
