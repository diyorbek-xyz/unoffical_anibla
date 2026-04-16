import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/profile/data/models/session_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class ProfileModel {
  @HiveField(0)
  @JsonKey(name: "apple_id")
  final String? appleId;
  @HiveField(1)
  @JsonKey(name: "_id")
  final String? id;
  @HiveField(2)
  final DateTime? createdAt;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  @JsonKey(name: "unique_id")
  final int? paymentId;
  @HiveField(6)
  @JsonKey(name: "phone_number")
  final int? phoneNumber;
  @HiveField(7)
  final double? balance;
  @HiveField(8)
  final dynamic subscription;
  @HiveField(9)
  final String? role;
  @HiveField(10)
  final bool? activated;
  @HiveField(11)
  @JsonKey(name: "created_by_admin")
  final bool? createdByAdmin;
  @HiveField(12)
  @JsonKey(name: "telegram_token")
  final String? telegramToken;
  @HiveField(13)
  final List? transactions;
  @HiveField(14)
  @JsonKey(fromJson: addBaseUrl, includeFromJson: true)
  final String? image;
  @HiveField(15)
  final DateTime? updatedAt;
  @HiveField(16)
  @JsonKey(name: "email_lc")
  final String? emailLC;
  @HiveField(17)
  @JsonKey(name: "last_anime_type")
  final String? lastAnimeType;
  @HiveField(18)
  @JsonKey(name: "name_lc")
  final String? nameLC;
  @HiveField(19)
  @JsonKey(name: "phone_str")
  final String? phoneStr;
  @HiveField(20)
  @JsonKey(name: "unique_id_str")
  final String? paymentIdStr;
  @HiveField(21)
  @JsonKey(name: "last_anime")
  final AnimeModel? lastAnime;
  @HiveField(22)
  @JsonKey(name: "token_id")
  final String? tokenId;
  @HiveField(23)
  final List<SessionModel>? sessions;
  @HiveField(24)
  @JsonKey(name: "saved_series")
  final List<dynamic>? savedSeries;
  @HiveField(25)
  @JsonKey(name: "saved_movies")
  final List<dynamic>? savedMovies;
  @HiveField(26)
  final int? total;
  const ProfileModel({
    this.activated,
    this.balance,
    this.email,
    this.id,
    this.name,
    this.phoneNumber,
    this.role,
    this.image,
    this.subscription,
    this.transactions,
    this.appleId,
    this.createdAt,
    this.createdByAdmin,
    this.emailLC,
    this.lastAnime,
    this.lastAnimeType,
    this.nameLC,
    this.paymentId,
    this.paymentIdStr,
    this.phoneStr,
    this.savedMovies,
    this.savedSeries,
    this.sessions,
    this.telegramToken,
    this.tokenId,
    this.total,
    this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
