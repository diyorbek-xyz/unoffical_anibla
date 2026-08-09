import 'package:application/features/common/domain/entities/translated_entity.dart';
import 'package:equatable/equatable.dart';

class PlanEntity extends Equatable {
  final Translated title;
  final int price;
  final int time;
  const PlanEntity({required this.price, required this.time, required this.title});

  @override
  List<Object?> get props => [title, price, time];
}
