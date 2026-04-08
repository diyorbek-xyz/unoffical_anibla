import 'package:hive_ce/hive_ce.dart';
import 'package:json_annotation/json_annotation.dart';

part 'translated.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(includeIfNull: true)
class TranslatedModel {
  @HiveField(0)
  @JsonKey()
  final String? uz;
  @HiveField(1)
  @JsonKey()
  final String? ru;
  const TranslatedModel({this.ru, this.uz});

  factory TranslatedModel.fromJson(Map<String, dynamic> json) =>
      _$TranslatedModelFromJson(json);
  Map<String, dynamic> toJson() => _$TranslatedModelToJson(this);
}
