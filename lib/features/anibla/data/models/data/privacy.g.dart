// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrivacyAdapter extends TypeAdapter<Privacy> {
  @override
  final typeId = 105;

  @override
  Privacy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Privacy(
      showComments: fields[0] == null ? false : fields[0] as bool,
      showFavorites: fields[1] == null ? false : fields[1] as bool,
      id: fields[2] == null ? '' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Privacy obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.showComments)
      ..writeByte(1)
      ..write(obj.showFavorites)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrivacyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Privacy _$PrivacyFromJson(Map<String, dynamic> json) => _Privacy(
  showComments: json['show_comments'] as bool? ?? false,
  showFavorites: json['show_favorites'] as bool? ?? false,
  id: json['id'] as String? ?? "",
);

Map<String, dynamic> _$PrivacyToJson(_Privacy instance) => <String, dynamic>{
  'show_comments': instance.showComments,
  'show_favorites': instance.showFavorites,
  'id': instance.id,
};
