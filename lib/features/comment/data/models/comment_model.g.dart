// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentModelAdapter extends TypeAdapter<CommentModel> {
  @override
  final typeId = 64;

  @override
  CommentModel read(BinaryReader reader) {
    reader.readByte();
    return CommentModel();
  }

  @override
  void write(BinaryWriter writer, CommentModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    CommentModel();

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{};
