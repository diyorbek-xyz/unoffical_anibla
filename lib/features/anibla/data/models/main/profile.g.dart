// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final typeId = 7;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      createdAt: fields[1] == null ? '' : fields[1] as String,
      name: fields[2] == null ? '' : fields[2] as String,
      email: fields[3] == null ? '' : fields[3] as String,
      balance: fields[4] == null ? 0.0 : (fields[4] as num).toDouble(),
      subscription: fields[5] == null ? '' : fields[5] as dynamic,
      role: fields[6] == null ? '' : fields[6] as String,
      activated: fields[7] == null ? false : fields[7] as bool,
      transactions: fields[8] == null
          ? []
          : (fields[8] as List).cast<dynamic>(),
      updatedAt: fields[9] == null ? '' : fields[9] as String,
      sessions: fields[10] == null ? [] : (fields[10] as List).cast<Session>(),
      total: fields[11] == null ? 0 : (fields[11] as num).toInt(),
      appleId: fields[12] == null ? '' : fields[12] as String,
      id: fields[13] == null ? '' : fields[13] as String,
      paymentId: fields[14] == null ? 0 : (fields[14] as num).toInt(),
      phoneNumber: fields[15] == null ? 0 : (fields[15] as num).toInt(),
      createdByAdmin: fields[16] == null ? false : fields[16] as bool,
      telegramToken: fields[17] == null ? '' : fields[17] as String,
      emailLC: fields[18] == null ? '' : fields[18] as String,
      lastAnimeType: fields[19] == null ? '' : fields[19] as String,
      nameLC: fields[20] == null ? '' : fields[20] as String,
      phoneStr: fields[21] == null ? '' : fields[21] as String,
      paymentIdStr: fields[22] == null ? '' : fields[22] as String,
      lastAnime: fields[23] == null ? const Anime() : fields[23] as Anime,
      tokenId: fields[24] == null ? '' : fields[24] as String,
      savedSeries: fields[25] == null
          ? []
          : (fields[25] as List).cast<dynamic>(),
      savedMovies: fields[26] == null
          ? []
          : (fields[26] as List).cast<dynamic>(),
      image: fields[27] == null ? '' : fields[27] as String,
      privacySettings: fields[28] == null
          ? const Privacy()
          : fields[28] as Privacy,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
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
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  createdAt: json['createdAt'] as String? ?? "",
  name: json['name'] as String? ?? "",
  email: json['email'] as String? ?? "",
  balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
  subscription: json['subscription'] ?? "",
  role: json['role'] as String? ?? "",
  activated: json['activated'] as bool? ?? false,
  transactions: json['transactions'] as List<dynamic>? ?? const [],
  updatedAt: json['updatedAt'] as String? ?? "",
  sessions:
      (json['sessions'] as List<dynamic>?)
          ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  appleId: json['apple_id'] as String? ?? "",
  id: json['_id'] as String? ?? "",
  paymentId: (json['unique_id'] as num?)?.toInt() ?? 0,
  phoneNumber: (json['phone_number'] as num?)?.toInt() ?? 0,
  createdByAdmin: json['created_by_admin'] as bool? ?? false,
  telegramToken: json['telegram_token'] as String? ?? "",
  emailLC: json['email_lc'] as String? ?? "",
  lastAnimeType: json['last_anime_type'] as String? ?? "",
  nameLC: json['name_lc'] as String? ?? "",
  phoneStr: json['phone_str'] as String? ?? "",
  paymentIdStr: json['unique_id_str'] as String? ?? "",
  lastAnime: json['last_anime'] == null
      ? const Anime()
      : Anime.fromJson(json['last_anime']),
  tokenId: json['token_id'] as String? ?? "",
  savedSeries: json['saved_series'] as List<dynamic>? ?? const [],
  savedMovies: json['saved_movies'] as List<dynamic>? ?? const [],
  image: json['image'] == null ? "" : addBaseUrl(json['image'] as String?),
  privacySettings: json['privacy_settings'] == null
      ? const Privacy()
      : Privacy.fromJson(json['privacy_settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'createdAt': instance.createdAt,
  'name': instance.name,
  'email': instance.email,
  'balance': instance.balance,
  'subscription': instance.subscription,
  'role': instance.role,
  'activated': instance.activated,
  'transactions': instance.transactions,
  'updatedAt': instance.updatedAt,
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
