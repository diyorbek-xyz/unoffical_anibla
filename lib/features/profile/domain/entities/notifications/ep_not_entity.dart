import 'package:equatable/equatable.dart';

class EpisodeNotificationEntity extends Equatable {
  final String seriesId;
  final String seasonId;
  final String episodeId;
  final String seriesName;
  final String seasonNumber;
  final String episodeNumber;
  final String mediaId;
  final String mediaType;
  final String seasonIndex;
  final String episodeIndex;
  final String seasonRouteIndex;
  final String episodeRouteIndex;
  final String mediaSlug;
  final String imageUrl;
  final String image;
  const EpisodeNotificationEntity({
    required this.seriesId,
    required this.seasonId,
    required this.episodeId,
    required this.seriesName,
    required this.seasonNumber,
    required this.episodeNumber,
    required this.mediaId,
    required this.mediaType,
    required this.seasonIndex,
    required this.episodeIndex,
    required this.seasonRouteIndex,
    required this.episodeRouteIndex,
    required this.mediaSlug,
    required this.imageUrl,
    required this.image,
  });
  @override
  List<Object?> get props => [
    seriesId,
    seasonId,
    episodeId,
    seriesName,
    seasonNumber,
    episodeNumber,
    mediaId,
    mediaType,
    seasonIndex,
    episodeIndex,
    seasonRouteIndex,
    episodeRouteIndex,
    mediaSlug,
    imageUrl,
    image,
  ];
}
