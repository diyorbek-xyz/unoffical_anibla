// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SliderModelAdapter extends TypeAdapter<SliderModel> {
  @override
  final typeId = 10;

  @override
  SliderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SliderModel(
      id: fields[0] as String?,
      anime: fields[3] as AnimeModel?,
      image: fields[1] as String?,
      mobileImage: fields[2] as String?,
      type: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SliderModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.mobileImage)
      ..writeByte(3)
      ..write(obj.anime)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SliderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
  id: json['_id'] as String?,
  anime: json['media'] == null
      ? null
      : AnimeModel.fromJson(json['media'] as Map<String, dynamic>),
  image: addBaseUrl(json['image'] as String?),
  mobileImage: addBaseUrl(json['mobile_image'] as String?),
  type: json['mediaType'],
);

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'mobile_image': instance.mobileImage,
      'media': instance.anime,
      'mediaType': instance.type,
    };
