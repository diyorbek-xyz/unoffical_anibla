// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final typeId = 23;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      title: fields[0] as TranslatedModel,
      id: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreModelAdapter extends TypeAdapter<GenreModel> {
  @override
  final typeId = 24;

  @override
  GenreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreModel(
      id: fields[1] as String,
      title: fields[0] as TranslatedModel,
    );
  }

  @override
  void write(BinaryWriter writer, GenreModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
