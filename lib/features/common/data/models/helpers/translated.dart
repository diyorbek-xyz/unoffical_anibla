import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'translated.g.dart';
part 'translated.freezed.dart';

@HiveType(typeId: 5)
@Freezed(fromJson: true, toJson: true)
sealed class TranslatedModel with _$TranslatedModel {
  factory TranslatedModel({@HiveField(0) final String? ru, @HiveField(1) final String? uz}) = _TranslatedModel;

  factory TranslatedModel.fromJson(Map<String, dynamic> json) => _$TranslatedModelFromJson(json);
}
