import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'mano_profile.g.dart';
part 'mano_profile.freezed.dart';

@freezed
@HiveType(typeId: 6242)
abstract class ManoProfile with _$ManoProfile {
  const ManoProfile._();
  const factory ManoProfile({
    @HiveField(0) @Default("") String id,
    @HiveField(1) @Default("") String role,
    @HiveField(2) @Default("0.0") String balance,
    @HiveField(3) @Default(0) int warning,
    @HiveField(4) @Default(false) bool banned,
    @HiveField(5) @Default("") @JsonKey(name: "created_at")String createdDate,
    @HiveField(6) @Default(0) @JsonKey(name: "external_user_id") int paymentId,
    @HiveField(7) @Default("") @JsonKey(name: "first_name") String name,
    @HiveField(8) @Default("") @JsonKey(name: "phone_number") String phoneNumber,
    @HiveField(9) @Default("") @JsonKey(name: "picture_link") String avatar,
    @HiveField(10) @Default("") @JsonKey(name: "admin_scope") String adminScope,
  }) = _ManoProfile;

  factory ManoProfile.fromJson(Map<String, dynamic> json) => _$ManoProfileFromJson(json);
}
