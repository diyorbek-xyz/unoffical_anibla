class VerifyModel {
  final int phoneNumber;
  final String code;
  const VerifyModel({required this.code, required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {"login": phoneNumber, "code": code};
  }
}
