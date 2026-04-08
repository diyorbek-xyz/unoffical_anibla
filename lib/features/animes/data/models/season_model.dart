import 'package:json_annotation/json_annotation.dart';

part 'season_model.g.dart';

@JsonSerializable()
class SeasonModel {
  @JsonKey(name: "_id")
  final String? id;
  final dynamic uz;
  final dynamic ru;
  final String? slug;
  const SeasonModel({this.id, this.ru, this.slug, this.uz});

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonModelToJson(this);
}
