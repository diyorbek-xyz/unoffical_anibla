// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'mano_profile.g.dart';
// part 'mano_profile.freezed.dart';

// @freezed
// abstract class ManoProfile with _$ManoProfile {
//   const ManoProfile._();
//   const factory ManoProfile({
//     @Default("") String id,
//     @Default("") String role,
//     @Default("") String balance,
//     @Default(0) int warning,
//     @Default(false) bool banned,
//     @Default("") String createdDate,
//     @Default(0) @JsonKey(name: "external_user_id") int paymentId,
//     @Default("") @JsonKey(name: "first_name") String firstName,
//     @Default("") @JsonKey(name: "phone_number") String phoneNumber,
//     @Default("") @JsonKey(name: "picture_link") String pictureLink,
//     @Default("") @JsonKey(name: "admin_scope") String adminScope,
//   }) = _ManoProfile;

//   DateTime get createdAt => DateTime.tryParse(createdDate) ?? DateTime.now();

//   factory ManoProfile.fromJson(Map<String, dynamic> json) => _$ManoProfileFromJson(json);
// }
