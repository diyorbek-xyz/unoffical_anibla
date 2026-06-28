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
      bandwidth: (fields[5] as num).toInt(),
      duration: (fields[6] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, DownloadState obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.downloaded)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.speed)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.bandwidth)
      ..writeByte(6)
      ..write(obj.duration);
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
      masterPlaylist: fields[0] as MasterPlaylist,
      mediaPlaylist: fields[1] as MediaPlaylist,
      infos: fields[2] as DownloadInfos,
      isCompleted: fields[4] == null ? false : fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DownloadTask obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.masterPlaylist)
      ..writeByte(1)
      ..write(obj.mediaPlaylist)
      ..writeByte(2)
      ..write(obj.infos)
      ..writeByte(4)
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
