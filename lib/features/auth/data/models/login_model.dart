import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  @JsonKey(name: "phone_number")
  final int phoneNumber;
  const LoginRequestModel(this.phoneNumber);
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);
}

@JsonSerializable()
class LoginResponseModel {
  final int login;
  const LoginResponseModel(this.login);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class ConfirmModel {
  final int login;
  final int code;
  const ConfirmModel({required this.code, required this.login});

  Map<String, dynamic> toJson() => _$ConfirmModelToJson(this);
  factory ConfirmModel.fromJson(Map<String, dynamic> json) => _$ConfirmModelFromJson(json);
}

@JsonSerializable()
class ConfirmedModel {
  final dynamic user;
  final TokensModel token;
  const ConfirmedModel({required this.token, required this.user});

  factory ConfirmedModel.fromJson(Map<String, dynamic> json) => _$ConfirmedModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmedModelToJson(this);
}

@JsonSerializable()
class TokensModel {
  final String accessToken;
  final String refreshToken;
  const TokensModel({required this.accessToken, required this.refreshToken});

  factory TokensModel.fromJson(Map<String, dynamic> json) => _$TokensModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokensModelToJson(this);
}
