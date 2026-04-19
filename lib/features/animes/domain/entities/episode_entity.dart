import 'package:application/features/common/domain/entities/translated_entity.dart';
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

  const EpisodeEntity({
    required this.episodeNumber,
    required this.id,
    required this.slug,
    required this.title,
    required this.type,
    required this.video,
    required this.isDownloaded,
  });

  @override
  List<Object?> get props => [];
}
