// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarouselItemAdapter extends TypeAdapter<CarouselItem> {
  @override
  final typeId = 108;

  @override
  CarouselItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarouselItem(
      id: fields[0] == null ? '' : fields[0] as String,
      image: fields[1] == null ? '' : fields[1] as String,
      mobileImage: fields[2] == null ? '' : fields[2] as String,
      anime: fields[3] == null ? const Anime() : fields[3] as Anime,
      type: fields[4] == null ? MediaType.movie : fields[4] as MediaType,
    );
  }

  @override
  void write(BinaryWriter writer, CarouselItem obj) {
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
      other is CarouselItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarouselItem _$CarouselItemFromJson(Map<String, dynamic> json) =>
    _CarouselItem(
      id: json['_id'] as String? ?? "",
      image: json['image'] == null ? "" : addBaseUrl(json['image'] as String?),
      mobileImage: json['mobile_image'] == null
          ? ""
          : addBaseUrl(json['mobile_image'] as String?),
      anime: json['media'] == null
          ? const Anime()
          : Anime.fromJson(json['media']),
      type:
          $enumDecodeNullable(_$MediaTypeEnumMap, json['mediaType']) ??
          MediaType.movie,
    );

Map<String, dynamic> _$CarouselItemToJson(_CarouselItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'mobile_image': instance.mobileImage,
      'media': instance.anime,
      'mediaType': _$MediaTypeEnumMap[instance.type]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};
