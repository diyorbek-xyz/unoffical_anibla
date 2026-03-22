import 'package:application/features/template/domain/entities/template_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template_model.g.dart';

@HiveType(typeId: -1)
@JsonSerializable()
class TemplateModel {
  const TemplateModel();

  factory TemplateModel.fromJson(Map<String, dynamic> json) => _$TemplateModelFromJson(json);
  Map<String, dynamic> toJson() => _$TemplateModelToJson(this);
  TemplateEntity toEntity() => TemplateEntity();
}
