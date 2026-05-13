// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreModelAdapter extends TypeAdapter<GenreModel> {
  @override
  final typeId = 6;

  @override
  GenreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreModel(
      id: fields[0] as String?,
      slug: fields[2] as String?,
      title: fields[1] as TranslatedModel?,
      status: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, GenreModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) => GenreModel(
  id: json['_id'] as String?,
  slug: json['slug'] as String?,
  title: json['name'] == null
      ? null
      : TranslatedModel.fromJson(json['name'] as Map<String, dynamic>),
  status: json['status'] as bool?,
);

Map<String, dynamic> _$GenreModelToJson(GenreModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.title,
      'slug': instance.slug,
      'status': instance.status,
    };

GenreResponse _$GenreResponseFromJson(
  Map<String, dynamic> json,
) => GenreResponse(
  genres: (json['genres'] as List<dynamic>).map(GenreModel.fromJson).toList(),
  pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GenreResponseToJson(GenreResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'pagination': instance.pagination,
    };
