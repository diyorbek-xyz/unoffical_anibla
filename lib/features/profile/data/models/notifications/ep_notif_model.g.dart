// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ep_notif_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeNotificationModelAdapter
    extends TypeAdapter<EpisodeNotificationModel> {
  @override
  final typeId = 1251;

  @override
  EpisodeNotificationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeNotificationModel(
      seriesId: fields[0] as String?,
      seasonId: fields[1] as String?,
      episodeId: fields[2] as String?,
      seriesName: fields[3] as String?,
      seasonNumber: fields[4] as String?,
      episodeNumber: fields[5] as String?,
      mediaId: fields[6] as String?,
      mediaType: fields[7] as String?,
      seasonIndex: fields[8] as String?,
      episodeIndex: fields[9] as String?,
      seasonRouteIndex: fields[10] as String?,
      episodeRouteIndex: fields[11] as String?,
      mediaSlug: fields[12] as String?,
      imageUrl: fields[13] as String?,
      image: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeNotificationModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.seriesId)
      ..writeByte(1)
      ..write(obj.seasonId)
      ..writeByte(2)
      ..write(obj.episodeId)
      ..writeByte(3)
      ..write(obj.seriesName)
      ..writeByte(4)
      ..write(obj.seasonNumber)
      ..writeByte(5)
      ..write(obj.episodeNumber)
      ..writeByte(6)
      ..write(obj.mediaId)
      ..writeByte(7)
      ..write(obj.mediaType)
      ..writeByte(8)
      ..write(obj.seasonIndex)
      ..writeByte(9)
      ..write(obj.episodeIndex)
      ..writeByte(10)
      ..write(obj.seasonRouteIndex)
      ..writeByte(11)
      ..write(obj.episodeRouteIndex)
      ..writeByte(12)
      ..write(obj.mediaSlug)
      ..writeByte(13)
      ..write(obj.imageUrl)
      ..writeByte(14)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeNotificationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeNotificationModel _$EpisodeNotificationModelFromJson(
  Map<String, dynamic> json,
) => _EpisodeNotificationModel(
  seriesId: json['seriesId'] as String?,
  seasonId: json['seasonId'] as String?,
  episodeId: json['episodeId'] as String?,
  seriesName: json['seriesName'] as String?,
  seasonNumber: json['seasonNumber'] as String?,
  episodeNumber: json['episodeNumber'] as String?,
  mediaId: json['mediaId'] as String?,
  mediaType: json['mediaType'] as String?,
  seasonIndex: json['seasonIndex'] as String?,
  episodeIndex: json['episodeIndex'] as String?,
  seasonRouteIndex: json['seasonRouteIndex'] as String?,
  episodeRouteIndex: json['episodeRouteIndex'] as String?,
  mediaSlug: json['mediaSlug'] as String?,
  imageUrl: json['imageUrl'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$EpisodeNotificationModelToJson(
  _EpisodeNotificationModel instance,
) => <String, dynamic>{
  'seriesId': instance.seriesId,
  'seasonId': instance.seasonId,
  'episodeId': instance.episodeId,
  'seriesName': instance.seriesName,
  'seasonNumber': instance.seasonNumber,
  'episodeNumber': instance.episodeNumber,
  'mediaId': instance.mediaId,
  'mediaType': instance.mediaType,
  'seasonIndex': instance.seasonIndex,
  'episodeIndex': instance.episodeIndex,
  'seasonRouteIndex': instance.seasonRouteIndex,
  'episodeRouteIndex': instance.episodeRouteIndex,
  'mediaSlug': instance.mediaSlug,
  'imageUrl': instance.imageUrl,
  'image': instance.image,
};
