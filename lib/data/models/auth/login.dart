class LoginModel {
  final int phoneNumber;
  const LoginModel(this.phoneNumber);

  factory LoginModel.fromJson(dynamic json) {
    return LoginModel(json['phone']);
  }
  Map<String, int> toJson() {
    return {"phone_number": phoneNumber};
  }
}
