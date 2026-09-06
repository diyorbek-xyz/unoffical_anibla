import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/season_entity.dart';
import 'package:application/features/common/domain/entities/translated_entity.dart';
import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:equatable/equatable.dart';

class EpisodeType {
  static String free = "free";
  static String paid = "paid";
}

class EpisodeEntity extends Equatable {
  final Translated title;
  final String slug;
  final String id;
  final int episodeNumber;
  final String type;
  final String video;
  final bool isDownloaded;
  final TimelineModel? timeline;

  const EpisodeEntity({
    required this.episodeNumber,
    required this.id,
    required this.slug,
    required this.title,
    required this.type,
    required this.video,
    required this.isDownloaded,
    this.timeline,
  });

  EpisodeEntity copyWith({
    int? episodeNumber,
    String? id,
    String? slug,
    Translated? title,
    String? type,
    String? video,
    bool? isDownloaded,
    TimelineModel? timeline,
    SeasonEntity? season,
    AnimeEntity? anime,
  }) => EpisodeEntity(
    episodeNumber: episodeNumber ?? this.episodeNumber,
    id: id ?? this.id,
    slug: slug ?? this.slug,
    title: title ?? this.title,
    type: type ?? this.type,
    video: video ?? this.video,
    isDownloaded: isDownloaded ?? this.isDownloaded,
    timeline: timeline ?? this.timeline,
  );

  @override
  List<Object?> get props => [];
}
