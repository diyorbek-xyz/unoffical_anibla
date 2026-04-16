import 'package:application/features/profile/domain/entities/session_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class SessionModel {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String? id;
  @HiveField(1)
  @JsonKey(name: "user_id")
  final String? userId;
  @HiveField(2)
  @JsonKey(name: "token_id")
  final String? tokenId;
  @HiveField(3)
  final String? device;
  @HiveField(4)
  final String? ip;
  @HiveField(5)
  @JsonKey(name: "last_login")
  final DateTime? lastLogin;
  @HiveField(6)
  @JsonKey(name: "last_login_ip")
  final String? lastIp;
  @HiveField(7)
  @JsonKey(name: "platform_os")
  final String? platform;
  const SessionModel({
    this.device,
    this.id,
    this.ip,
    this.lastIp,
    this.lastLogin,
    this.platform,
    this.tokenId,
    this.userId,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
  factory SessionModel.fromEntity(SessionEntity entity) => SessionModel(
    device: entity.device,
    id: entity.id,
    ip: entity.ip,
    lastIp: entity.lastIp,
    lastLogin: entity.lastLogin,
    platform: entity.platform,
    tokenId: entity.tokenId,
    userId: entity.userId,
  );
  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 9)
class SessionsModel {
  @HiveField(0)
  @JsonKey(name: "token_id")
  final String? tokenId;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final int? total;
  @HiveField(3)
  final List<SessionModel>? sessions;
  const SessionsModel({this.tokenId, this.name, this.sessions, this.total});

  factory SessionsModel.fromJson(Map<String, dynamic> json) =>
      _$SessionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SessionsModelToJson(this);
}
