import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_translator.g.dart';
part 'mano_translator.freezed.dart';

@freezed
abstract class ManoTranslator with _$ManoTranslator {
  const factory ManoTranslator({
    @Default("") @JsonKey(name: "translator_id") String id,
    @Default("") @JsonKey(name: "manga_id") String mangaId,
    @Default("") @JsonKey(name: "first_name") String firstName,
    @Default("") @JsonKey(name: "picture_link") String picture,
  }) = _ManoTranslator;
  factory ManoTranslator.fromJson(Map<String, dynamic> json) => _$ManoTranslatorFromJson(json);
}
