import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'session.g.dart';
part 'session.freezed.dart';

@freezed
@HiveType(typeId: 106)
abstract class Session with _$Session {
  factory Session({
    @Default("") @HiveField(0) @JsonKey(name: "_id") String id,
    @Default("") @HiveField(1) @JsonKey(name: "user_id") String userId,
    @Default("") @HiveField(2) @JsonKey(name: "token_id") String tokenId,
    @Default("") @HiveField(5) @JsonKey(name: "last_login") String lastLogin,
    @Default("") @HiveField(6) @JsonKey(name: "last_login_ip") String lastIp,
    @Default("") @HiveField(7) @JsonKey(name: "platform_os") String platform,
    @Default("") @HiveField(3) String device,
    @Default("") @HiveField(4) String ip,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}

@freezed
@HiveType(typeId: 107)
abstract class Sessions with _$Sessions {
  factory Sessions({
    @Default("") @HiveField(0) @JsonKey(name: "token_id") String tokenId,
    @Default("") @HiveField(1) String name,
    @Default(0) @HiveField(2) int total,
    @Default([]) @HiveField(3) List<Session> sessions,
  }) = _Sessions;

  factory Sessions.fromJson(Map<String, dynamic> json) => _$SessionsFromJson(json);
}
