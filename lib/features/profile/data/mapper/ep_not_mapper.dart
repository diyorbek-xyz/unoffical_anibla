import 'package:application/features/profile/domain/entities/notifications/ep_not_entity.dart';
import 'package:application/features/profile/data/models/notifications/ep_notif_model.dart';

class EpisodeNotificationMapper {
  static EpisodeNotificationEntity fromModel(EpisodeNotificationModel? model) => EpisodeNotificationEntity(
    episodeId: model?.episodeId ?? "",
    episodeIndex: model?.episodeIndex ?? "",
    episodeNumber: model?.episodeNumber ?? "",
    episodeRouteIndex: model?.episodeRouteIndex ?? "",
    image: model?.image ?? "",
    imageUrl: model?.imageUrl ?? "",
    mediaId: model?.mediaId ?? "",
    mediaSlug: model?.mediaSlug ?? "",
    mediaType: model?.mediaType ?? "",
    seasonId: model?.seasonId ?? "",
    seasonIndex: model?.seasonIndex ?? "",
    seasonNumber: model?.seasonNumber ?? "",
    seasonRouteIndex: model?.seasonRouteIndex ?? "",
    seriesId: model?.seriesId ?? "",
    seriesName: model?.seriesName ?? "",
  );
  static EpisodeNotificationModel fromEntity(EpisodeNotificationEntity entity) => EpisodeNotificationModel(
    episodeId: entity.episodeId,
    episodeIndex: entity.episodeIndex,
    episodeNumber: entity.episodeNumber,
    episodeRouteIndex: entity.episodeRouteIndex,
    image: entity.image,
    imageUrl: entity.imageUrl,
    mediaId: entity.mediaId,
    mediaSlug: entity.mediaSlug,
    mediaType: entity.mediaType,
    seasonId: entity.seasonId,
    seasonIndex: entity.seasonIndex,
    seasonNumber: entity.seasonNumber,
    seasonRouteIndex: entity.seasonRouteIndex,
    seriesId: entity.seriesId,
    seriesName: entity.seriesName,
  );
}
