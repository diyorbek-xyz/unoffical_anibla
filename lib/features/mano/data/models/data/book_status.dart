import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'book_status.g.dart';

@HiveType(typeId: 5326)
enum BookStatus {
  @JsonValue('continue')
  @HiveField(0)
  continuing,
  @HiveField(1)
  stopped,
  @HiveField(2)
  finished,
}
