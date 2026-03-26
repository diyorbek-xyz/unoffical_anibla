// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{'phone_number': instance.phoneNumber};

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel((json['login'] as num).toInt());

Map<String, dynamic> _$ConfirmModelToJson(ConfirmModel instance) =>
    <String, dynamic>{'login': instance.login, 'code': instance.code};

ConfirmedModel _$ConfirmedModelFromJson(Map<String, dynamic> json) =>
    ConfirmedModel(
      token: TokensModel.fromJson(json['token'] as Map<String, dynamic>),
      user: json['user'],
    );

Map<String, dynamic> _$ConfirmedModelToJson(ConfirmedModel instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};

TokensModel _$TokensModelFromJson(Map<String, dynamic> json) => TokensModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$TokensModelToJson(TokensModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
