import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'timeline_model.g.dart';

@HiveType(typeId: 7182)
class TimelineModel {
  @HiveField(0)
  final Duration progress;
  @HiveField(1)
  final Duration duration;
  const TimelineModel({required this.duration, required this.progress});
}
