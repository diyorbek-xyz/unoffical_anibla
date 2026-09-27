import 'dart:io';

abstract class Errors {
  static const String tooManySessions = "too_many_sessions";
  static const String userNotFound = "user_not_found";
  static const String seriesAlreadyExist = "series_already_exist";
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

  static String fromStatus(int status) => switch (status) {
    HttpStatus.badRequest => ErrorMessages.badRequest,
    HttpStatus.conflict => ErrorMessages.conflict,
    HttpStatus.unauthorized => ErrorMessages.unauthorized,
    HttpStatus.forbidden => ErrorMessages.forbidden,
    HttpStatus.notFound => ErrorMessages.notFound,
    HttpStatus.methodNotAllowed => ErrorMessages.methodNotAllowed,
    HttpStatus.loopDetected => ErrorMessages.loopDetected,
    HttpStatus.noContent => ErrorMessages.noContent,
    HttpStatus.requestTimeout => ErrorMessages.requestTimeout,
    _ => "${ErrorMessages.unknown} $status",
  };
}
