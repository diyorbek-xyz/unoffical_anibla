import 'package:equatable/equatable.dart';

class Translated extends Equatable {
  final String uz;
  final String ru;
  const Translated({required this.ru, required this.uz});

  @override
  List<Object?> get props => [uz, ru];
}
