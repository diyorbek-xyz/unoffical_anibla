// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_translator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoTranslator _$ManoTranslatorFromJson(Map<String, dynamic> json) =>
    _ManoTranslator(
      id: json['translator_id'] as String? ?? "",
      mangaId: json['manga_id'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      picture: json['picture_link'] as String? ?? "",
    );

Map<String, dynamic> _$ManoTranslatorToJson(_ManoTranslator instance) =>
    <String, dynamic>{
      'translator_id': instance.id,
      'manga_id': instance.mangaId,
      'first_name': instance.firstName,
      'picture_link': instance.picture,
    };
