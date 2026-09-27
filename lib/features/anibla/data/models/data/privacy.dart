import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'privacy.g.dart';
part 'privacy.freezed.dart';

@freezed
@HiveType(typeId: 105)
abstract class Privacy with _$Privacy {
  const factory Privacy({
    @Default(false) @HiveField(0) @JsonKey(name: "show_comments") bool showComments,
    @Default(false) @HiveField(1) @JsonKey(name: "show_favorites") bool showFavorites,
    @Default("") @HiveField(2) String id,
  }) = _Privacy;
  factory Privacy.fromJson(Map<String, dynamic> json) => _$PrivacyFromJson(json);
}
