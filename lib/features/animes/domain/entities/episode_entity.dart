import 'package:application/features/common/domain/entities/translated_entity.dart';
import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final Translated title;
  final String slug;
  final String id;
  final int episodeNumber;

  const EpisodeEntity({
    required this.episodeNumber,
    required this.id,
    required this.slug,
    required this.title,
  });

  @override
  List<Object?> get props => [];
}
