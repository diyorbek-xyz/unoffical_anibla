// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeModelAdapter extends TypeAdapter<EpisodeModel> {
  @override
  final typeId = 531;

  @override
  EpisodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeModel(
      episodeNumber: (fields[4] as num?)?.toInt(),
      id: fields[0] as String?,
      ru: fields[2] as dynamic,
      slug: fields[3] as String?,
      uz: fields[1] as dynamic,
      type: fields[5] as String?,
      video: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uz)
      ..writeByte(2)
      ..write(obj.ru)
      ..writeByte(3)
      ..write(obj.slug)
      ..writeByte(4)
      ..write(obj.episodeNumber)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.video);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
  episodeNumber: (json['episode_number'] as num?)?.toInt(),
  id: json['_id'] as String?,
  ru: json['ru'],
  slug: json['slug'] as String?,
  uz: json['uz'],
  type: json['type'] as String?,
  video: json['video'] as String?,
);

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uz': instance.uz,
      'ru': instance.ru,
      'slug': instance.slug,
      'episode_number': instance.episodeNumber,
      'type': instance.type,
      'video': instance.video,
    };
