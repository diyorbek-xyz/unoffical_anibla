import 'package:application/core/entites/translated.dart';
import 'package:application/features/calendar/domain/entities/timer_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timer_model.g.dart';

Translated messageFromJson(dynamic json) => TranslatedModel.fromJson2(json, "message");

@HiveType(typeId: 2)
@JsonSerializable()
class TimerModel {
  @HiveField(0)
  @JsonKey(name: "media")
  final dynamic anime;

  @HiveField(1)
  @JsonKey(name: "_id")
  final String id;

  @HiveField(2)
  final TranslatedModel message;

  @HiveField(3)
  final DateTime time;

  @HiveField(4)
  @JsonKey(name: "mediaType")
  final String type;

  const TimerModel({required this.anime, required this.message, required this.id, required this.time, required this.type});

  factory TimerModel.fromJson(Map<String, dynamic> json) => _$TimerModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimerModelToJson(this);

  TimerEntity toEntity() => TimerEntity(id: id, anime: anime, message: message, type: type, time: time);
}
