// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenresResponse _$GenresResponseFromJson(Map<String, dynamic> json) =>
    _GenresResponse(
      genres:
          (json['genres'] as List<dynamic>?)?.map(Genre.fromJson).toList() ??
          const [],
      pagination: json['pagination'] == null
          ? const Pagination()
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenresResponseToJson(_GenresResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'pagination': instance.pagination,
    };
