// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonAdapter extends TypeAdapter<Season> {
  @override
  final typeId = 204;

  @override
  Season read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Season(
      id: fields[0] == null ? '' : fields[0] as String,
      uz: fields[1] == null ? {} : fields[1] as dynamic,
      ru: fields[2] == null ? {} : fields[2] as dynamic,
      slug: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Season obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uz)
      ..writeByte(2)
      ..write(obj.ru)
      ..writeByte(3)
      ..write(obj.slug);
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
