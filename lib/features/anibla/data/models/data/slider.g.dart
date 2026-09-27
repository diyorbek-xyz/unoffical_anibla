// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SliderAdapter extends TypeAdapter<Slider> {
  @override
  final typeId = 108;

  @override
  Slider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Slider(
      id: fields[0] == null ? '' : fields[0] as String,
      image: fields[1] == null ? '' : fields[1] as String,
      mobileImage: fields[2] == null ? '' : fields[2] as String,
      anime: fields[3] == null ? const Anime() : fields[3] as Anime,
      type: fields[4] == null ? AnimeType.movie : fields[4] as AnimeType,
    );
  }

  @override
  void write(BinaryWriter writer, Slider obj) {
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
      other is SliderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Slider _$SliderFromJson(Map<String, dynamic> json) => _Slider(
  id: json['_id'] as String? ?? "",
  image: json['image'] == null ? "" : addBaseUrl(json['image'] as String?),
  mobileImage: json['mobile_image'] == null
      ? ""
      : addBaseUrl(json['mobile_image'] as String?),
  anime: json['media'] == null ? const Anime() : Anime.fromJson(json['media']),
  type:
      $enumDecodeNullable(_$AnimeTypeEnumMap, json['mediaType']) ??
      AnimeType.movie,
);

Map<String, dynamic> _$SliderToJson(_Slider instance) => <String, dynamic>{
  '_id': instance.id,
  'image': instance.image,
  'mobile_image': instance.mobileImage,
  'media': instance.anime,
  'mediaType': _$AnimeTypeEnumMap[instance.type]!,
};

const _$AnimeTypeEnumMap = {
  AnimeType.movie: 'Movies',
  AnimeType.serie: 'Series',
};
