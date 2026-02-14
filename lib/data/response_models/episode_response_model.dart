import 'package:application/data/models/animes/episode_model.dart';
import 'package:application/domain/entities/episode_entity.dart';

class EpisodeResponseModel {
  final List<EpisodeModel> episodes;
  final bool success;
  final String message;

  const EpisodeResponseModel({required this.message, required this.success, required this.episodes});
  factory EpisodeResponseModel.fromJson(Map<String, dynamic> json) {
    return EpisodeResponseModel(
      message: json['message'],
      success: json['success'],
      episodes: (json['data'] as List).map((episode) => EpisodeModel.fromJson(episode)).toList(),
    );
  }

  List<EpisodeEntity> getEntityList() {
    return episodes.map((episode) => episode.toEntity()).toList();
  }
}
