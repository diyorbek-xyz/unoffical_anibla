import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'episode_type.g.dart';

@HiveType(typeId: 1001)
enum EpisodeType {
  @HiveField(0)
  @JsonValue("free")
  free,
  @HiveField(1)
  @JsonValue("paid")
  paid;

  bool get isFree => this == EpisodeType.free;
  bool get isPaid => this == EpisodeType.paid;

  @override
  String toString() => name;
}
