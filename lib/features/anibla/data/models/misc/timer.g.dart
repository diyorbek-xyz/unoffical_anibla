// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerAdapter extends TypeAdapter<Timer> {
  @override
  final typeId = 4;

  @override
  Timer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timer(
      anime: fields[0] == null ? const Anime() : fields[0] as Anime,
      id: fields[1] == null ? '' : fields[1] as String,
      type: fields[4] == null ? AnimeType.serie : fields[4] as AnimeType,
      episode: fields[5] == null ? const Episode() : fields[5] as Episode,
      date: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Timer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.anime)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.episode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Timer _$TimerFromJson(Map<String, dynamic> json) => _Timer(
  anime: json['media'] == null ? const Anime() : Anime.fromJson(json['media']),
  id: json['_id'] as String? ?? "",
  type:
      $enumDecodeNullable(_$AnimeTypeEnumMap, json['mediaType']) ??
      AnimeType.serie,
  episode: json['episode_id'] == null
      ? const Episode()
      : Episode.fromJson(json['episode_id'] as Map<String, dynamic>),
  date: json['date'] as String? ?? "",
);

Map<String, dynamic> _$TimerToJson(_Timer instance) => <String, dynamic>{
  'media': instance.anime,
  '_id': instance.id,
  'mediaType': _$AnimeTypeEnumMap[instance.type]!,
  'episode_id': instance.episode,
  'date': instance.date,
};

const _$AnimeTypeEnumMap = {
  AnimeType.movie: 'Movies',
  AnimeType.serie: 'Series',
};
