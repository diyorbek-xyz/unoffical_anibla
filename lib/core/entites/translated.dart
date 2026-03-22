import 'package:equatable/equatable.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:json_annotation/json_annotation.dart';

part 'translated.g.dart';

class Translated extends Equatable {
  final String uz;
  final String ru;
  const Translated({required this.ru, required this.uz});

  @override
  List<Object?> get props {
    return [uz, ru];
  }
}

@HiveType(typeId: 0)
@JsonSerializable()
class TranslatedModel extends Translated {
  @HiveField(0)
  @override
  get uz => super.uz;
  @HiveField(1)
  @override
  get ru => super.ru;
  const TranslatedModel({required super.uz, required super.ru});

  factory TranslatedModel.fromJson2(Map<String, dynamic> json, String key) => TranslatedModel(ru: json['ru'][key], uz: json['uz'][key]);

  factory TranslatedModel.fromJson(Map<String, dynamic> json) => _$TranslatedModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranslatedModelToJson(this);
}
