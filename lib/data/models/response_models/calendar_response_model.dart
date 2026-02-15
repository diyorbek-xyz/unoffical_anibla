import 'package:application/core/resources/response_model.dart';
import 'package:application/data/models/other/calendar_model.dart';
import 'package:application/domain/entities/other/calendar_entity.dart';

class CalendarResponseModel extends ResponseModel<CalendarModel> {
  const CalendarResponseModel({required super.data, required super.message, required super.success});

  factory CalendarResponseModel.fromJson(Map<String, dynamic> json, DateTime day) {
    return CalendarResponseModel(data: CalendarModel.fromJson(json['data'], day), message: json['message'], success: json['success']);
  }
  CalendarEntity getEntity() => data.toEntity();
}
