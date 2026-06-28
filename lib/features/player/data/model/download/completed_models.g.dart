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
      streamUrl: fields[0] as String,
      downloadUrl: fields[1] as String,
      localFolderUrl: fields[2] as String,
      downloadedAt: fields[3] as DateTime?,
      size: (fields[4] as num).toInt(),
      animeId: fields[5] as String,
      animeTitle: fields[6] as TranslatedModel,
      seasonId: fields[7] as String,
      seasonTitle: fields[8] as TranslatedModel,
      episodeId: fields[9] as String,
      episodeTitle: fields[10] as TranslatedModel,
      episodeNumber: (fields[11] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, DownloadInfos obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.streamUrl)
      ..writeByte(1)
      ..write(obj.downloadUrl)
      ..writeByte(2)
      ..write(obj.localFolderUrl)
      ..writeByte(3)
      ..write(obj.downloadedAt)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.animeId)
      ..writeByte(6)
      ..write(obj.animeTitle)
      ..writeByte(7)
      ..write(obj.seasonId)
      ..writeByte(8)
      ..write(obj.seasonTitle)
      ..writeByte(9)
      ..write(obj.episodeId)
      ..writeByte(10)
      ..write(obj.episodeTitle)
      ..writeByte(11)
      ..write(obj.episodeNumber);
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
      streamUrl: json['streamUrl'] as String,
      downloadUrl: json['downloadUrl'] as String,
      localFolderUrl: json['localFolderUrl'] as String,
      downloadedAt: json['downloadedAt'] == null
          ? null
          : DateTime.parse(json['downloadedAt'] as String),
      size: (json['size'] as num).toInt(),
      animeId: json['animeId'] as String,
      animeTitle: TranslatedModel.fromJson(
        json['animeTitle'] as Map<String, dynamic>,
      ),
      seasonId: json['seasonId'] as String,
      seasonTitle: TranslatedModel.fromJson(
        json['seasonTitle'] as Map<String, dynamic>,
      ),
      episodeId: json['episodeId'] as String,
      episodeTitle: TranslatedModel.fromJson(
        json['episodeTitle'] as Map<String, dynamic>,
      ),
      episodeNumber: (json['episodeNumber'] as num).toInt(),
    );

Map<String, dynamic> _$DownloadInfosToJson(_DownloadInfos instance) =>
    <String, dynamic>{
      'streamUrl': instance.streamUrl,
      'downloadUrl': instance.downloadUrl,
      'localFolderUrl': instance.localFolderUrl,
      'downloadedAt': instance.downloadedAt?.toIso8601String(),
      'size': instance.size,
      'animeId': instance.animeId,
      'animeTitle': instance.animeTitle,
      'seasonId': instance.seasonId,
      'seasonTitle': instance.seasonTitle,
      'episodeId': instance.episodeId,
      'episodeTitle': instance.episodeTitle,
      'episodeNumber': instance.episodeNumber,
    };
