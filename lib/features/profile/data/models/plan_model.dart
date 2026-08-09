import 'package:application/features/common/data/models/helpers/translated.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.g.dart';
part 'plan_model.freezed.dart';

@freezed
abstract class PlanModel with _$PlanModel {
  factory PlanModel({@JsonKey(name: "name") TranslatedModel? title, int? price, int? time}) = _PlanModel;
  factory PlanModel.fromJson(Map<String,dynamic> json) => _$PlanModelFromJson(json);
}
