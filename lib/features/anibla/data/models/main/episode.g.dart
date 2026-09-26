// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeAdapter extends TypeAdapter<Episode> {
  @override
  final typeId = 531;

  @override
  Episode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Episode(
      id: fields[0] == null ? '' : fields[0] as String,
      episodeNumber: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      uz: fields[2] == null ? {} : fields[2] as dynamic,
      ru: fields[3] == null ? {} : fields[3] as dynamic,
      slug: fields[4] == null ? '' : fields[4] as String,
      type: fields[5] == null ? EpisodeType.paid : fields[5] as EpisodeType,
      video: fields[6] == null ? '' : fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Episode obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.episodeNumber)
      ..writeByte(2)
      ..write(obj.uz)
      ..writeByte(3)
      ..write(obj.ru)
      ..writeByte(4)
      ..write(obj.slug)
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
      other is EpisodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Episode _$EpisodeFromJson(Map<String, dynamic> json) => _Episode(
  id: json['_id'] as String? ?? "",
  episodeNumber: (json['episode_number'] as num?)?.toInt() ?? 0,
  uz: json['uz'] ?? const {},
  ru: json['ru'] ?? const {},
  slug: json['slug'] as String? ?? "",
  type:
      $enumDecodeNullable(_$EpisodeTypeEnumMap, json['type']) ??
      EpisodeType.paid,
  video: json['video'] as String? ?? "",
);

Map<String, dynamic> _$EpisodeToJson(_Episode instance) => <String, dynamic>{
  '_id': instance.id,
  'episode_number': instance.episodeNumber,
  'uz': instance.uz,
  'ru': instance.ru,
  'slug': instance.slug,
  'type': _$EpisodeTypeEnumMap[instance.type]!,
  'video': instance.video,
};

const _$EpisodeTypeEnumMap = {
  EpisodeType.free: 'free',
  EpisodeType.paid: 'paid',
};
