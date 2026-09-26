// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadInfosAdapter extends TypeAdapter<DownloadInfos> {
  @override
  final typeId = 25113;

  @override
  DownloadInfos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadInfos(
      downloadedAt: fields[0] as DateTime?,
      size: (fields[1] as num).toInt(),
      downloadUrl: fields[2] as String,
      anime: fields[4] as Anime,
      season: fields[5] as Season,
      episode: fields[6] as Episode,
      localPath: fields[7] == null ? '' : fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DownloadInfos obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.downloadedAt)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.downloadUrl)
      ..writeByte(4)
      ..write(obj.anime)
      ..writeByte(5)
      ..write(obj.season)
      ..writeByte(6)
      ..write(obj.episode)
      ..writeByte(7)
      ..write(obj.localPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadInfosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownloadInfos _$DownloadInfosFromJson(Map<String, dynamic> json) =>
    _DownloadInfos(
      downloadedAt: json['downloadedAt'] == null
          ? null
          : DateTime.parse(json['downloadedAt'] as String),
      size: (json['size'] as num).toInt(),
      downloadUrl: json['downloadUrl'] as String,
      anime: Anime.fromJson(json['anime']),
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
      localPath: json['localPath'] as String? ?? "",
    );

Map<String, dynamic> _$DownloadInfosToJson(_DownloadInfos instance) =>
    <String, dynamic>{
      'downloadedAt': instance.downloadedAt?.toIso8601String(),
      'size': instance.size,
      'downloadUrl': instance.downloadUrl,
      'anime': instance.anime,
      'season': instance.season,
      'episode': instance.episode,
      'localPath': instance.localPath,
    };
