import 'package:application/core/entites/translated.dart';
import 'package:equatable/equatable.dart';

class TimerEntity extends Equatable {
  final String id;
  final Translated message;
  final dynamic anime;
  final String type;
  final DateTime time;
  const TimerEntity({required this.id, required this.anime, required this.message, required this.type, required this.time});
  @override
  List<Object?> get props => [];
}
