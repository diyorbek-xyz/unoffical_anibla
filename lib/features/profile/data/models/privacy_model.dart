import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'privacy_model.g.dart';
part 'privacy_model.freezed.dart';

@HiveType(typeId: 3642)
@freezed
sealed class PrivacyModel with _$PrivacyModel {
  factory PrivacyModel({
    @HiveField(0) @JsonKey(name: "show_comments") bool? showComments,
    @HiveField(1) @JsonKey(name: "show_favorites") bool? showFavorites,
    @HiveField(2) String? id,
  }) = _PrivacyModel;
  factory PrivacyModel.fromJson(Map<String, dynamic> json) => _$PrivacyModelFromJson(json);
}
