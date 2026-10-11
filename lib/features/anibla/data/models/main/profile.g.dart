// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AniblaProfile _$AniblaProfileFromJson(Map<String, dynamic> json) =>
    _AniblaProfile(
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
      lastMediaType: json['last_anime_type'] as String? ?? "",
      nameLC: json['name_lc'] as String? ?? "",
      phoneStr: json['phone_str'] as String? ?? "",
      paymentIdStr: json['unique_id_str'] as String? ?? "",
      lastAnime: json['last_anime'] == null
          ? const Anime()
          : Anime.fromJson(json['last_anime']),
      tokenId: json['token_id'] as String? ?? "",
      savedSeries: json['saved_series'] as List<dynamic>? ?? const [],
      savedMovies: json['saved_movies'] as List<dynamic>? ?? const [],
      avatar: json['avatar'] == null
          ? ""
          : addBaseUrl(json['avatar'] as String?),
      privacySettings: json['privacy_settings'] == null
          ? const Privacy()
          : Privacy.fromJson(json['privacy_settings'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AniblaProfileToJson(_AniblaProfile instance) =>
    <String, dynamic>{
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
      'last_anime_type': instance.lastMediaType,
      'name_lc': instance.nameLC,
      'phone_str': instance.phoneStr,
      'unique_id_str': instance.paymentIdStr,
      'last_anime': instance.lastAnime,
      'token_id': instance.tokenId,
      'saved_series': instance.savedSeries,
      'saved_movies': instance.savedMovies,
      'avatar': instance.avatar,
      'privacy_settings': instance.privacySettings,
      'runtimeType': instance.$type,
    };

_ManoProfile _$ManoProfileFromJson(Map<String, dynamic> json) => _ManoProfile(
  id: json['id'] as String? ?? "",
  role: json['role'] as String? ?? "",
  balance: (json['balance'] as num?)?.toDouble() ?? 0,
  warning: (json['warning'] as num?)?.toInt() ?? 0,
  banned: json['banned'] as bool? ?? false,
  createdDate: json['createdDate'] as String? ?? "",
  paymentId: (json['external_user_id'] as num?)?.toInt() ?? 0,
  name: json['first_name'] as String? ?? "",
  phoneNumber: json['phone_number'] as String? ?? "",
  avatar: json['picture_link'] as String? ?? "",
  adminScope: json['admin_scope'] as String? ?? "",
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ManoProfileToJson(_ManoProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'balance': instance.balance,
      'warning': instance.warning,
      'banned': instance.banned,
      'createdDate': instance.createdDate,
      'external_user_id': instance.paymentId,
      'first_name': instance.name,
      'phone_number': instance.phoneNumber,
      'picture_link': instance.avatar,
      'admin_scope': instance.adminScope,
      'runtimeType': instance.$type,
    };
