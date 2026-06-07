// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final typeId = 7;

  @override
  ProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileModel(
      createdAt: fields[1] as DateTime?,
      name: fields[2] as String?,
      email: fields[3] as String?,
      balance: (fields[4] as num?)?.toDouble(),
      subscription: fields[5] as dynamic,
      role: fields[6] as String?,
      activated: fields[7] as bool?,
      transactions: (fields[8] as List?)?.cast<dynamic>(),
      updatedAt: fields[9] as DateTime?,
      sessions: (fields[10] as List?)?.cast<SessionModel>(),
      total: (fields[11] as num?)?.toInt(),
      appleId: fields[12] as String?,
      id: fields[13] as String?,
      paymentId: (fields[14] as num?)?.toInt(),
      phoneNumber: (fields[15] as num?)?.toInt(),
      createdByAdmin: fields[16] as bool?,
      telegramToken: fields[17] as String?,
      emailLC: fields[18] as String?,
      lastAnimeType: fields[19] as String?,
      nameLC: fields[20] as String?,
      phoneStr: fields[21] as String?,
      paymentIdStr: fields[22] as String?,
      lastAnime: fields[23] as AnimeModel?,
      tokenId: fields[24] as String?,
      savedSeries: (fields[25] as List?)?.cast<dynamic>(),
      savedMovies: (fields[26] as List?)?.cast<dynamic>(),
      image: fields[27] as String?,
      privacySettings: fields[28] as PrivacyModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(28)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.balance)
      ..writeByte(5)
      ..write(obj.subscription)
      ..writeByte(6)
      ..write(obj.role)
      ..writeByte(7)
      ..write(obj.activated)
      ..writeByte(8)
      ..write(obj.transactions)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.sessions)
      ..writeByte(11)
      ..write(obj.total)
      ..writeByte(12)
      ..write(obj.appleId)
      ..writeByte(13)
      ..write(obj.id)
      ..writeByte(14)
      ..write(obj.paymentId)
      ..writeByte(15)
      ..write(obj.phoneNumber)
      ..writeByte(16)
      ..write(obj.createdByAdmin)
      ..writeByte(17)
      ..write(obj.telegramToken)
      ..writeByte(18)
      ..write(obj.emailLC)
      ..writeByte(19)
      ..write(obj.lastAnimeType)
      ..writeByte(20)
      ..write(obj.nameLC)
      ..writeByte(21)
      ..write(obj.phoneStr)
      ..writeByte(22)
      ..write(obj.paymentIdStr)
      ..writeByte(23)
      ..write(obj.lastAnime)
      ..writeByte(24)
      ..write(obj.tokenId)
      ..writeByte(25)
      ..write(obj.savedSeries)
      ..writeByte(26)
      ..write(obj.savedMovies)
      ..writeByte(27)
      ..write(obj.image)
      ..writeByte(28)
      ..write(obj.privacySettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String?,
      email: json['email'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      subscription: json['subscription'],
      role: json['role'] as String?,
      activated: json['activated'] as bool?,
      transactions: json['transactions'] as List<dynamic>?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => SessionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      appleId: json['apple_id'] as String?,
      id: json['_id'] as String?,
      paymentId: (json['unique_id'] as num?)?.toInt(),
      phoneNumber: (json['phone_number'] as num?)?.toInt(),
      createdByAdmin: json['created_by_admin'] as bool?,
      telegramToken: json['telegram_token'] as String?,
      emailLC: json['email_lc'] as String?,
      lastAnimeType: json['last_anime_type'] as String?,
      nameLC: json['name_lc'] as String?,
      phoneStr: json['phone_str'] as String?,
      paymentIdStr: json['unique_id_str'] as String?,
      lastAnime: json['last_anime'] == null
          ? null
          : AnimeModel.fromJson(json['last_anime']),
      tokenId: json['token_id'] as String?,
      savedSeries: json['saved_series'] as List<dynamic>?,
      savedMovies: json['saved_movies'] as List<dynamic>?,
      image: addBaseUrl(json['image'] as String?),
      privacySettings: json['privacy_settings'] == null
          ? null
          : PrivacyModel.fromJson(
              json['privacy_settings'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'name': instance.name,
      'email': instance.email,
      'balance': instance.balance,
      'subscription': instance.subscription,
      'role': instance.role,
      'activated': instance.activated,
      'transactions': instance.transactions,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'sessions': instance.sessions,
      'total': instance.total,
      'apple_id': instance.appleId,
      '_id': instance.id,
      'unique_id': instance.paymentId,
      'phone_number': instance.phoneNumber,
      'created_by_admin': instance.createdByAdmin,
      'telegram_token': instance.telegramToken,
      'email_lc': instance.emailLC,
      'last_anime_type': instance.lastAnimeType,
      'name_lc': instance.nameLC,
      'phone_str': instance.phoneStr,
      'unique_id_str': instance.paymentIdStr,
      'last_anime': instance.lastAnime,
      'token_id': instance.tokenId,
      'saved_series': instance.savedSeries,
      'saved_movies': instance.savedMovies,
      'image': instance.image,
      'privacy_settings': instance.privacySettings,
    };
