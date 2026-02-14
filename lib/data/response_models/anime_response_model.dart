import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/domain/entities/anime_entity.dart';

class AnimeResponseModel {
  final bool success;
  final String message;
  final List<AnimeModel> animes;
  final PaginationModel pagination;
  const AnimeResponseModel({required this.animes, required this.pagination, required this.success, required this.message});

  factory AnimeResponseModel.fromJson(Map<String, dynamic> json) {
    return AnimeResponseModel(
      animes: (json['data'] as List).map((anime) => AnimeModel.fromJson(anime)).toList(),
      pagination: PaginationModel.fromJson(json['pagination']),
      message: json['message'],
      success: json['success'],
    );
  }
  List<AnimeEntity> getEntityList() {
    return animes.map((anime) => anime.toEntity()).toList();
  }
}
