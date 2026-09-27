// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizedAdapter extends TypeAdapter<Localized> {
  @override
  final typeId = 1;

  @override
  Localized read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Localized(
      ru: fields[0] == null ? '' : fields[0] as String,
      uz: fields[1] == null ? '' : fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Localized obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ru)
      ..writeByte(1)
      ..write(obj.uz);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Localized _$LocalizedFromJson(Map<String, dynamic> json) => _Localized(
  ru: json['ru'] as String? ?? "",
  uz: json['uz'] as String? ?? "",
);

Map<String, dynamic> _$LocalizedToJson(_Localized instance) =>
    <String, dynamic>{'ru': instance.ru, 'uz': instance.uz};
