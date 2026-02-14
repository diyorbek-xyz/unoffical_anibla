import 'package:application/data/models/animes/season_model.dart';
import 'package:application/domain/entities/season_entity.dart';

class SeasonsResponseModel {
  final List<SeasonModel> seasons;
  final bool success;
  final String message;
  const SeasonsResponseModel({required this.message, required this.seasons, required this.success});

  factory SeasonsResponseModel.fromJson(Map<String, dynamic> json) {
    return SeasonsResponseModel(
      message: json['message'],
      success: json['success'],
      seasons: (json['data'] as List).map((season) => SeasonModel.fromJson(season)).toList(),
    );
  }
  List<SeasonEntity> getEntityList() {
    return seasons.map((season) => season.toEntity()).toList();
  }
}

class SeasonResponseModel {
  final SeasonModel season;
  final bool success;
  final String message;
  const SeasonResponseModel({required this.message, required this.season, required this.success});

  factory SeasonResponseModel.fromJson(Map<String, dynamic> json) {
    return SeasonResponseModel(message: json['message'], season: SeasonModel.fromJson(json['data']), success: json['success']);
  }

  SeasonEntity getEntity() {
    return season.toEntity();
  }
}
