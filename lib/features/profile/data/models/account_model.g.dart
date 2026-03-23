// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final typeId = 5;

  @override
  AccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountModel(
      activated: fields[5] as bool?,
      balance: (fields[6] as num?)?.toDouble(),
      email: fields[1] as String?,
      id: fields[0] as String?,
      name: fields[2] as String?,
      phoneNumber: (fields[3] as num?)?.toInt(),
      role: fields[7] as String?,
      image: fields[4] as String?,
      subscription: fields[8] as dynamic,
      transactions: (fields[9] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.activated)
      ..writeByte(6)
      ..write(obj.balance)
      ..writeByte(7)
      ..write(obj.role)
      ..writeByte(8)
      ..write(obj.subscription)
      ..writeByte(9)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
  activated: json['activated'] as bool?,
  balance: (json['balance'] as num?)?.toDouble(),
  email: json['email'] as String?,
  id: json['_id'] as String?,
  name: json['name'] as String?,
  phoneNumber: (json['phone_number'] as num?)?.toInt(),
  role: json['role'] as String?,
  image: json['image'] as String?,
  subscription: json['subscription'],
  transactions: json['transactions'] as List<dynamic>?,
);

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'image': instance.image,
      'activated': instance.activated,
      'balance': instance.balance,
      'role': instance.role,
      'subscription': instance.subscription,
      'transactions': instance.transactions,
    };
