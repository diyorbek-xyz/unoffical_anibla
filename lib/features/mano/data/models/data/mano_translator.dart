import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'mano_translator.g.dart';
part 'mano_translator.freezed.dart';

@freezed
@HiveType(typeId: 6223)
abstract class ManoTranslator with _$ManoTranslator {
  const factory ManoTranslator({
    @HiveField(0) @Default("") @JsonKey(name: "translator_id") String id,
    @HiveField(1) @Default("") @JsonKey(name: "manga_id") String mangaId,
    @HiveField(2) @Default("") @JsonKey(name: "first_name") String firstName,
    @HiveField(3) @Default("") @JsonKey(name: "picture_link") String picture,
  }) = _ManoTranslator;
  factory ManoTranslator.fromJson(Map<String, dynamic> json) => _$ManoTranslatorFromJson(json);
}
