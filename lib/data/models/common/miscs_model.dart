import 'package:application/domain/entities/calendar_entity.dart';
import 'package:application/domain/entities/episode_entity.dart';
import 'package:application/domain/entities/translated_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'miscs_model.g.dart';

@HiveType(typeId: 0)
class PaginationModel {
  @HiveField(0)
  final int total;
  @HiveField(1)
  final int limit;
  @HiveField(2)
  final int page;
  @HiveField(3)
  final int pages;
  const PaginationModel({required this.total, required this.limit, required this.page, required this.pages});

  factory PaginationModel.fromJson(dynamic json) {
    return PaginationModel(total: json['total'], limit: json['limit'], page: json['page'], pages: json['pages']);
  }

  PaginationEntity toEntity() {
    return PaginationEntity(limit: limit, page: page, pages: pages, total: total);
  }
}

@HiveType(typeId: 1)
class VideoModel {
  @HiveField(0)
  final String file;
  @HiveField(1)
  final int introStart;
  @HiveField(2)
  final int introEnd;

  const VideoModel({required this.file, required this.introStart, required this.introEnd});

  factory VideoModel.fromJson(dynamic json) {
    int? start = int.tryParse(json['skip'].toString().split("-")[0]);
    int? end = int.tryParse(json['skip'].toString().split("-")[1]);
    return VideoModel(file: json['file'] ?? "", introStart: start ?? 0, introEnd: end ?? 1);
  }

  VideoEntity toEntity() {
    return VideoEntity(file: file, introEnd: introEnd, introStart: introStart);
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
    if (json is Map) return TranslatedModel(ru: json['ru'] ?? "?", uz: json['uz'] ?? "?");
    return TranslatedModel(ru: "?", uz: "?");
  }
  Map<String, dynamic> toJson() => {'uz': uz, 'ru': ru};
}
