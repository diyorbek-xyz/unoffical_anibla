import 'package:equatable/equatable.dart';

class TranslatedEntity extends Equatable {
  final String uz;
  final String ru;
  const TranslatedEntity({required this.ru, required this.uz});

  @override
  List<Object?> get props {
    return [uz, ru];
  }
}
