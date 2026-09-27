import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'localized.g.dart';
part 'localized.freezed.dart';

@Freezed(fromJson: true, toJson: true)
@HiveType(typeId: 1)
abstract class Localized with _$Localized {
  const factory Localized({@Default("") @HiveField(0) String ru, @Default("") @HiveField(1) String uz}) = _Localized;
  factory Localized.fromJson(Map<String, dynamic> json) => _$LocalizedFromJson(json);
}
