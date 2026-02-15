import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class CalendarParams extends Equatable {
  final DateTime day;
  const CalendarParams(this.day);

  String compact() {
    return DateFormat("d-MM-y").format(day);
  }

  @override
  List<Object?> get props => [day];
}
