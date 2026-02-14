// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarouselItemModelAdapter extends TypeAdapter<CarouselItemModel> {
  @override
  final typeId = 22;

  @override
  CarouselItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarouselItemModel(
      anime: fields[1] as AnimeModel?,
      type: fields[2] as AnimeType?,
      image: fields[3] as String?,
      mobileImage: fields[4] as String?,
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CarouselItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.anime)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.mobileImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarouselItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
