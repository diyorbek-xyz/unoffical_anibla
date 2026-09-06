// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonModelAdapter extends TypeAdapter<SeasonModel> {
  @override
  final typeId = 4353;

  @override
  SeasonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeasonModel();
  }

  @override
  void write(BinaryWriter writer, SeasonModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => _SeasonModel(
  id: json['_id'] as String?,
  uz: json['uz'],
  ru: json['ru'],
  slug: json['slug'] as String?,
);

Map<String, dynamic> _$SeasonModelToJson(_SeasonModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uz': instance.uz,
      'ru': instance.ru,
      'slug': instance.slug,
    };
