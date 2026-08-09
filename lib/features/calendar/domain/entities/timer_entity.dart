import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:equatable/equatable.dart';

class TimerEntity extends Equatable {
  final String id;
  final AnimeEntity anime;
  final AnimeType type;
  final DateTime time;
  final EpisodeEntity episode;
  const TimerEntity({
    required this.id,
    required this.anime,
    required this.type,
    required this.time,
    required this.episode,
  });
  @override
  List<Object?> get props => [];
}
