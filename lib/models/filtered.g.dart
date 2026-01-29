// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryFilteredAdapter extends TypeAdapter<CategoryFiltered> {
  @override
  final typeId = 8;

  @override
  CategoryFiltered read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryFiltered(
      animes: (fields[1] as List).cast<Anime>(),
      category: fields[0] as Category,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryFiltered obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.animes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryFilteredAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
