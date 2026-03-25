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
      activated: fields[10] as bool?,
      balance: (fields[7] as num?)?.toDouble(),
      email: fields[4] as String?,
      id: fields[1] as String?,
      name: fields[3] as String?,
      phoneNumber: (fields[6] as num?)?.toInt(),
      role: fields[9] as String?,
      image: fields[14] as String?,
      subscription: fields[8] as dynamic,
      transactions: (fields[13] as List?)?.cast<dynamic>(),
      appleId: fields[0] as String?,
      createdAt: fields[2] as DateTime?,
      createdByAdmin: fields[11] as bool?,
      emailLC: fields[16] as String?,
      lastAnime: fields[21] as dynamic,
      lastAnimeType: fields[17] as String?,
      nameLC: fields[18] as String?,
      paymentId: (fields[5] as num?)?.toInt(),
      paymentIdStr: fields[20] as String?,
      phoneStr: fields[19] as String?,
      savedMovies: (fields[25] as List?)?.cast<dynamic>(),
      savedSeries: (fields[24] as List?)?.cast<dynamic>(),
      sessions: (fields[23] as List?)?.cast<SessionModel>(),
      telegramToken: fields[12] as String?,
      tokenId: fields[22] as String?,
      total: (fields[26] as num?)?.toInt(),
      updatedAt: fields[15] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.appleId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.paymentId)
      ..writeByte(6)
      ..write(obj.phoneNumber)
      ..writeByte(7)
      ..write(obj.balance)
      ..writeByte(8)
      ..write(obj.subscription)
      ..writeByte(9)
      ..write(obj.role)
      ..writeByte(10)
      ..write(obj.activated)
      ..writeByte(11)
      ..write(obj.createdByAdmin)
      ..writeByte(12)
      ..write(obj.telegramToken)
      ..writeByte(13)
      ..write(obj.transactions)
      ..writeByte(14)
      ..write(obj.image)
      ..writeByte(15)
      ..write(obj.updatedAt)
      ..writeByte(16)
      ..write(obj.emailLC)
      ..writeByte(17)
      ..write(obj.lastAnimeType)
      ..writeByte(18)
      ..write(obj.nameLC)
      ..writeByte(19)
      ..write(obj.phoneStr)
      ..writeByte(20)
      ..write(obj.paymentIdStr)
      ..writeByte(21)
      ..write(obj.lastAnime)
      ..writeByte(22)
      ..write(obj.tokenId)
      ..writeByte(23)
      ..write(obj.sessions)
      ..writeByte(24)
      ..write(obj.savedSeries)
      ..writeByte(25)
      ..write(obj.savedMovies)
      ..writeByte(26)
      ..write(obj.total);
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
  image: addBaseUrl(json['image'] as String?),
  subscription: json['subscription'],
  transactions: json['transactions'] as List<dynamic>?,
  appleId: json['apple_id'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  createdByAdmin: json['created_by_admin'] as bool?,
  emailLC: json['email_lc'] as String?,
  lastAnime: json['last_anime'],
  lastAnimeType: json['last_anime_type'] as String?,
  nameLC: json['name_lc'] as String?,
  paymentId: (json['unique_id'] as num?)?.toInt(),
  paymentIdStr: json['unique_id_str'] as String?,
  phoneStr: json['phone_str'] as String?,
  savedMovies: json['saved_movies'] as List<dynamic>?,
  savedSeries: json['saved_series'] as List<dynamic>?,
  sessions: (json['sessions'] as List<dynamic>?)
      ?.map((e) => SessionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  telegramToken: json['telegram_token'] as String?,
  tokenId: json['token_id'] as String?,
  total: (json['total'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'apple_id': instance.appleId,
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'name': instance.name,
      'email': instance.email,
      'unique_id': instance.paymentId,
      'phone_number': instance.phoneNumber,
      'balance': instance.balance,
      'subscription': instance.subscription,
      'role': instance.role,
      'activated': instance.activated,
      'created_by_admin': instance.createdByAdmin,
      'telegram_token': instance.telegramToken,
      'transactions': instance.transactions,
      'image': instance.image,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'email_lc': instance.emailLC,
      'last_anime_type': instance.lastAnimeType,
      'name_lc': instance.nameLC,
      'phone_str': instance.phoneStr,
      'unique_id_str': instance.paymentIdStr,
      'last_anime': instance.lastAnime,
      'token_id': instance.tokenId,
      'sessions': instance.sessions,
      'saved_series': instance.savedSeries,
      'saved_movies': instance.savedMovies,
      'total': instance.total,
    };
