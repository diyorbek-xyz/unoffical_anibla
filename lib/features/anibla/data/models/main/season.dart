import 'package:application/features/anibla/data/models/helper/localized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'season.g.dart';
part 'season.freezed.dart';

@freezed
@HiveType(typeId: 4353)
abstract class Season with _$Season {
  const Season._();
  factory Season({
    @Default("") @JsonKey(name: "_id") String id,
    @Default({}) dynamic uz,
    @Default({}) dynamic ru,
    @Default("") String slug,
  }) = _Season;
  Localized get title => Localized(ru: ru['title'], uz: uz['title']);

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}
