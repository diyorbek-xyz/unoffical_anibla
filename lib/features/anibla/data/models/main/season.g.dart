// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonAdapter extends TypeAdapter<Season> {
  @override
  final typeId = 4353;

  @override
  Season read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Season();
  }

  @override
  void write(BinaryWriter writer, Season obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Season _$SeasonFromJson(Map<String, dynamic> json) => _Season(
  id: json['_id'] as String? ?? "",
  uz: json['uz'] ?? const {},
  ru: json['ru'] ?? const {},
  slug: json['slug'] as String? ?? "",
);

Map<String, dynamic> _$SeasonToJson(_Season instance) => <String, dynamic>{
  '_id': instance.id,
  'uz': instance.uz,
  'ru': instance.ru,
  'slug': instance.slug,
};
