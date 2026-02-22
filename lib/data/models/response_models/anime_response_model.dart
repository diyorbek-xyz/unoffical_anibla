import 'package:application/core/resources/response_model.dart';
import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';

class AnimesResponseModel extends ResponseModel<List<AnimeModel>> {
  final PaginationModel pagination;

  const AnimesResponseModel({required this.pagination, required super.data, required super.success, required super.message});

  factory AnimesResponseModel.fromJson(Map<String, dynamic> json) {
    return AnimesResponseModel(
      data: (json['data'] as List).map((anime) => AnimeModel.fromJson(anime)).toList(),
      pagination: PaginationModel.fromJson(json['pagination']),
      message: json['message'],
      success: json['success'],
    );
  }
  List<AnimeEntity> getEntityList() {
    return data.map((anime) => anime.toEntity()).toList();
  }
}

class AnimeResponseModel extends ResponseModel<AnimeModel> {
  const AnimeResponseModel({required super.data, required super.success, required super.message});

  factory AnimeResponseModel.fromJson(Map<String, dynamic> json) {
    return AnimeResponseModel(
      data: json['data'] != null ? AnimeModel.fromJson(json['data']) : AnimeModel(),
      message: json['message'],
      success: json['success'],
    );
  }
  AnimeEntity getEntity() {
    return data.toEntity();
  }
}
