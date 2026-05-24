// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrivacyModelAdapter extends TypeAdapter<PrivacyModel> {
  @override
  final typeId = 3642;

  @override
  PrivacyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrivacyModel(
      showComments: fields[0] as bool?,
      showFavorites: fields[1] as bool?,
      id: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PrivacyModel obj) {
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
      other is PrivacyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrivacyModel _$PrivacyModelFromJson(Map<String, dynamic> json) =>
    _PrivacyModel(
      showComments: json['show_comments'] as bool?,
      showFavorites: json['show_favorites'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PrivacyModelToJson(_PrivacyModel instance) =>
    <String, dynamic>{
      'show_comments': instance.showComments,
      'show_favorites': instance.showFavorites,
      'id': instance.id,
    };
