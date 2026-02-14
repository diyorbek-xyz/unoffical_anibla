import 'package:application/domain/entities/common/pagination_entity.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'miscs_model.g.dart';

@HiveType(typeId: 0)
class PaginationModel extends PaginationEntity {
  @HiveField(0)
  @override
  int? get total => super.total;
  @HiveField(1)
  @override
  int? get limit => super.limit;
  @HiveField(2)
  @override
  int? get page => super.page;
  @HiveField(3)
  @override
  int? get pages => super.pages;
  const PaginationModel({super.total, super.limit, super.page, super.pages});

  factory PaginationModel.fromJson(dynamic json) {
    return PaginationModel(total: json['total'], limit: json['limit'], page: json['page'], pages: json['pages']);
  }
}

@HiveType(typeId: 1)
class VideoModel extends VideoEntity {
  @HiveField(0)
  @override
  String? get file => super.file;
  @HiveField(1)
  @override
  int? get introStart => super.introStart;
  @HiveField(2)
  @override
  int? get introEnd => super.introEnd;

  const VideoModel({super.file, super.introStart, super.introEnd});

  factory VideoModel.fromJson(dynamic json) {
    int? start = int.tryParse(json['skip'].toString().split("-")[0]);
    int? end = int.tryParse(json['skip'].toString().split("-")[1]);
    return VideoModel(file: json['file'] ?? "", introStart: start ?? 0, introEnd: end ?? 1);
  }
}

@HiveType(typeId: 2)
class TranslatedModel extends TranslatedEntity {
  @HiveField(0)
  @override
  String? get uz => super.uz;

  @HiveField(1)
  @override
  String? get ru => super.ru;

  const TranslatedModel({required String ru, required String uz}) : super(ru: ru, uz: uz);

  factory TranslatedModel.fromJson(dynamic json) {
    if (json is String) return TranslatedModel(ru: json, uz: json);
    if (json is Map<String, dynamic>) return TranslatedModel(ru: json['ru'], uz: json['uz']);
    throw Exception("Invalid json format: $json");
  }
  Map<String, dynamic> toJson() => {'uz': uz, 'ru': ru};
}
