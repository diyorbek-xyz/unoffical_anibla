import 'package:application/features/anibla/data/models/helper/localized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan.g.dart';
part 'plan.freezed.dart';

@freezed
abstract class Plan with _$Plan {
  const factory Plan({
    @Default(Localized()) @JsonKey(name: "name") Localized title,
    @Default(0) int price,
    @Default(0) int time,
  }) = _Plan;
  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
