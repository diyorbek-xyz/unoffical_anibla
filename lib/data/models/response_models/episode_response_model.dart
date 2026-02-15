import 'package:application/core/resources/response_model.dart';
import 'package:application/data/models/animes/episode_model.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';

class EpisodesResponseModel extends ResponseModel<List<EpisodeModel>> {
  const EpisodesResponseModel({required super.message, required super.success, required super.data});
  factory EpisodesResponseModel.fromJson(Map<String, dynamic> json) {
    return EpisodesResponseModel(
      message: json['message'],
      success: json['success'],
      data: json['data'] != null ? (json['data'] as List).map((episode) => EpisodeModel.fromJson(episode)).toList() : [],
    );
  }

  List<EpisodeEntity> getEntityList() {
    return data.map((episode) => episode.toEntity()).toList();
  }
}

class EpisodeResponseModel extends ResponseModel<EpisodeModel> {
  const EpisodeResponseModel({required super.data, required super.message, required super.success});
  factory EpisodeResponseModel.fromJson(Map<String, dynamic> json) {
    return EpisodeResponseModel(data: json['data'], message: json['message'], success: json['success']);
  }

  EpisodeEntity getEntity() {
    return data.toEntity();
  }
}
