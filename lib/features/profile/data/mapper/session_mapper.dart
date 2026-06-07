import 'package:application/features/profile/data/models/profile/session_model.dart';
import 'package:application/features/profile/domain/entities/session_entity.dart';

class SessionMapper {
  static SessionEntity modelToEntity(SessionModel? model) => SessionEntity(
    device: model?.device ?? "",
    id: model?.id ?? "",
    ip: model?.ip ?? "",
    lastIp: model?.lastIp ?? "",
    lastLogin: model?.lastLogin ?? DateTime(2026),
    platform: model?.platform ?? "android",
    tokenId: model?.tokenId ?? "",
    userId: model?.userId ?? "",
  );
  static SessionsEntity modelsToEntities(SessionsModel? model) =>
      SessionsEntity(
        tokenId: model?.tokenId ?? "",
        name: model?.name ?? "",
        sessions: model?.sessions?.map(modelToEntity).toList() ?? [],
        total: model?.total ?? 0,
      );
}
