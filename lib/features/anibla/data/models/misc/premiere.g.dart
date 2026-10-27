// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premiere.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PremiereAdapter extends TypeAdapter<Premiere> {
  @override
  final typeId = 303;

  @override
  Premiere read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Premiere(
      anime: fields[0] == null ? const Anime() : fields[0] as Anime,
      id: fields[1] == null ? '' : fields[1] as String,
      type: fields[4] == null ? MediaType.serie : fields[4] as MediaType,
      episode: fields[5] == null ? const Episode() : fields[5] as Episode,
      date: fields[3] == null ? '' : fields[3] as String,
      totalEpisodes: fields[6] == null ? -1 : (fields[6] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Premiere obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.anime)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.episode)
      ..writeByte(6)
      ..write(obj.totalEpisodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PremiereAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Premiere _$PremiereFromJson(Map<String, dynamic> json) => _Premiere(
  anime: json['media'] == null ? const Anime() : Anime.fromJson(json['media']),
  id: json['_id'] as String? ?? "",
  type:
      $enumDecodeNullable(_$MediaTypeEnumMap, json['mediaType']) ??
      MediaType.serie,
  episode: json['episode_id'] == null
      ? const Episode()
      : Episode.fromJson(json['episode_id'] as Map<String, dynamic>),
  date: json['time'] as String? ?? "",
  totalEpisodes: (json['total_episodes'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$PremiereToJson(_Premiere instance) => <String, dynamic>{
  'media': instance.anime,
  '_id': instance.id,
  'mediaType': _$MediaTypeEnumMap[instance.type]!,
  'episode_id': instance.episode,
  'time': instance.date,
  'total_episodes': instance.totalEpisodes,
};

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};
