// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadStateAdapter extends TypeAdapter<DownloadState> {
  @override
  final typeId = 7365;

  @override
  DownloadState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadState(
      id: fields[0] as String,
      downloaded: (fields[1] as num).toInt(),
      total: (fields[2] as num).toInt(),
      speed: (fields[3] as num).toDouble(),
      status: fields[4] as DownloadStatus,
    );
  }

  @override
  void write(BinaryWriter writer, DownloadState obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.downloaded)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.speed)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DownloadTaskAdapter extends TypeAdapter<DownloadTask> {
  @override
  final typeId = 1541;

  @override
  DownloadTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadTask(
      props: fields[0] as DownloaderProps,
      mediaPlaylist: fields[2] as MediaPlaylist,
      masterPlaylist: fields[1] as MasterPlaylist,
      queue: (fields[3] as List).cast<Chunk>(),
      isCompleted: fields[6] as bool,
      infos: fields[4] as DownloadInfos?,
    );
  }

  @override
  void write(BinaryWriter writer, DownloadTask obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.props)
      ..writeByte(1)
      ..write(obj.masterPlaylist)
      ..writeByte(2)
      ..write(obj.mediaPlaylist)
      ..writeByte(3)
      ..write(obj.queue)
      ..writeByte(4)
      ..write(obj.infos)
      ..writeByte(6)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      episodeNumber: (fields[6] as num).toInt(),
      animeId: fields[0] as String,
      filePath: fields[5] as String,
      episodeId: fields[2] as String,
      seasonId: fields[1] as String,
      downloadedAt: fields[3] as DateTime,
      size: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, DownloadInfos obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.animeId)
      ..writeByte(1)
      ..write(obj.seasonId)
      ..writeByte(2)
      ..write(obj.episodeId)
      ..writeByte(3)
      ..write(obj.downloadedAt)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.filePath)
      ..writeByte(6)
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

class DownloaderPropsAdapter extends TypeAdapter<DownloaderProps> {
  @override
  final typeId = 7225;

  @override
  DownloaderProps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloaderProps(
      animeId: fields[0] as String,
      seasonId: fields[1] as String,
      episodeId: fields[2] as String,
      filePath: fields[3] as String,
      episodeNumber: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, DownloaderProps obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.animeId)
      ..writeByte(1)
      ..write(obj.seasonId)
      ..writeByte(2)
      ..write(obj.episodeId)
      ..writeByte(3)
      ..write(obj.filePath)
      ..writeByte(4)
      ..write(obj.episodeNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloaderPropsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadInfos _$DownloadInfosFromJson(Map<String, dynamic> json) =>
    DownloadInfos(
      episodeNumber: (json['episodeNumber'] as num).toInt(),
      animeId: json['animeId'] as String,
      filePath: json['filePath'] as String,
      episodeId: json['episodeId'] as String,
      seasonId: json['seasonId'] as String,
      downloadedAt: DateTime.parse(json['downloadedAt'] as String),
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$DownloadInfosToJson(DownloadInfos instance) =>
    <String, dynamic>{
      'animeId': instance.animeId,
      'seasonId': instance.seasonId,
      'episodeId': instance.episodeId,
      'downloadedAt': instance.downloadedAt.toIso8601String(),
      'size': instance.size,
      'filePath': instance.filePath,
      'episodeNumber': instance.episodeNumber,
    };
