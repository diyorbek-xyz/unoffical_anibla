import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final String id;
  final String userId;
  final String tokenId;
  final String device;
  final String ip;
  final DateTime lastLogin;
  final String lastIp;
  final String platform;
  const SessionEntity({
    required this.device,
    required this.id,
    required this.ip,
    required this.lastIp,
    required this.lastLogin,
    required this.platform,
    required this.tokenId,
    required this.userId,
  });
  @override
  List<Object?> get props => [id, userId, tokenId, device, ip, lastIp, platform, lastLogin];
}

class SessionsEntity extends Equatable {
  final String tokenId;
  final String name;
  final int total;
  final List<SessionEntity> sessions;
  const SessionsEntity({required this.tokenId, required this.name, required this.sessions, required this.total});
  @override
  List<Object?> get props => [tokenId, name, total, sessions];
}

dynamic json = {
  "token_id": "148ee440-5e3e-4a97-a000-93a080dcda1e",
  "name": "Diyorbek",
  "total": 7,
  "sessions": [
    {
      "_id": "69bfda0034c9f7540536d4cd",
      "user_id": "699f3af562d624707fe52bcd",
      "token_id": "1f7333cc-f9dd-4408-8f0e-10688bb784ab",
      "device": "Redmi6A",
      "ip": ": : ffff: 127.0.0.1",
      "last_login": "2026-03-22T12: 01: 04.645Z",
      "last_login_ip": ": : ffff: 127.0.0.1",
      "platform_os": "android",
      "createdAt": "2026-03-22T12: 01: 04.645Z",
      "updatedAt": "2026-03-22T12: 01: 04.645Z",
      "__v": 0,
    },
    {
      "_id": "69bfe53bc72d75cfda3fa591",
      "user_id": "699f3af562d624707fe52bcd",
      "token_id": "ac42f067-cf82-4171-831c-dc98923e2b18",
      "device": "Redmi6A",
      "ip": ": : ffff: 127.0.0.1",
      "last_login": "2026-03-22T12: 48: 59.647Z",
      "last_login_ip": ": : ffff: 127.0.0.1",
      "platform_os": "android",
      "createdAt": "2026-03-22T12: 48: 59.648Z",
      "updatedAt": "2026-03-22T12: 48: 59.648Z",
      "__v": 0,
    },
  ],
};
