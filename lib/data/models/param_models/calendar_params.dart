import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class GetCalendarParams extends Equatable {
  final DateTime day;
  const GetCalendarParams(this.day);

  String compact() {
    return DateFormat("d-MM-y").format(day);
  }

  @override
  List<Object?> get props => [day];
}
