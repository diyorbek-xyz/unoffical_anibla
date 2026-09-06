import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'season_model.g.dart';
part 'season_model.freezed.dart';

@freezed
@HiveType(typeId: 4353)
abstract class SeasonModel with _$SeasonModel {
  factory SeasonModel({@JsonKey(name: "_id") String? id, dynamic uz, dynamic ru, String? slug}) = _SeasonModel;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => _$SeasonModelFromJson(json);
}
