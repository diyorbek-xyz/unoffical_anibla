import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'session_model.g.dart';
part 'session_model.freezed.dart';

@freezed
@HiveType(typeId: 8)
sealed class SessionModel with _$SessionModel {
  factory SessionModel({
    @HiveField(0) @JsonKey(name: "_id") final String? id,
    @HiveField(1) @JsonKey(name: "user_id") final String? userId,
    @HiveField(2) @JsonKey(name: "token_id") final String? tokenId,
    @HiveField(5) @JsonKey(name: "last_login") final DateTime? lastLogin,
    @HiveField(6) @JsonKey(name: "last_login_ip") final String? lastIp,
    @HiveField(7) @JsonKey(name: "platform_os") final String? platform,
    @HiveField(3) final String? device,
    @HiveField(4) final String? ip,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);
}

@freezed
@HiveType(typeId: 9)
sealed class SessionsModel with _$SessionsModel {
  factory SessionsModel({
    @HiveField(0) @JsonKey(name: "token_id") final String? tokenId,
    @HiveField(1) final String? name,
    @HiveField(2) final int? total,
    @HiveField(3) final List<SessionModel>? sessions,
  }) = _SessionsModel;

  factory SessionsModel.fromJson(Map<String, dynamic> json) => _$SessionsModelFromJson(json);
}
