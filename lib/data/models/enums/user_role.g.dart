// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRoleAdapter extends TypeAdapter<UserRole> {
  @override
  final typeId = 102;

  @override
  UserRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRole.studio;
      case 1:
        return UserRole.director;
      case 2:
        return UserRole.creator;
      case 3:
        return UserRole.user;
      default:
        return UserRole.studio;
    }
  }

  @override
  void write(BinaryWriter writer, UserRole obj) {
    switch (obj) {
      case UserRole.studio:
        writer.writeByte(0);
      case UserRole.director:
        writer.writeByte(1);
      case UserRole.creator:
        writer.writeByte(2);
      case UserRole.user:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
