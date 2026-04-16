import 'dart:io';

abstract class Errors {
  static const String tooManySessions = "too_many_sessions";
  static const String userNotFound = "user_not_found";
}

class ErrorMessages {
  static final String badRequest = "Notog'ri sorov";
  static final String conflict = "Bunday ma'lumot avval mavjud";
  static final String unauthorized = "Royxatdan o'tmagansiz";
  static final String forbidden = "Malumot yo'qolgan";
  static final String notFound = "Malumot topilmadi";
  static final String methodNotAllowed = "Bu harakat bajarish uchun ruxsat yoq";
  static final String loopDetected = "Serverda nosozlik";
  static final String noContent = "Malumot yoq";
  static final String requestTimeout = "Sorov yuborish vaqti o'tdi";
  static final String unknown = "Nimadur xato ketti:";

  static String fromStatus(int status) {
    switch (status) {
      case HttpStatus.badRequest:
        return ErrorMessages.badRequest;
      case HttpStatus.conflict:
        return ErrorMessages.conflict;
      case HttpStatus.unauthorized:
        return ErrorMessages.unauthorized;
      case HttpStatus.forbidden:
        return ErrorMessages.forbidden;
      case HttpStatus.notFound:
        return ErrorMessages.notFound;
      case HttpStatus.methodNotAllowed:
        return ErrorMessages.methodNotAllowed;
      case HttpStatus.loopDetected:
        return ErrorMessages.loopDetected;
      case HttpStatus.noContent:
        return ErrorMessages.noContent;
      case HttpStatus.requestTimeout:
        return ErrorMessages.requestTimeout;
      default:
        return "${ErrorMessages.unknown} $status";
    }
  }
}
