import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/misc/premiere.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'premieres.freezed.dart';
part 'premieres.g.dart';

@HiveType(typeId: 302)
@freezed
abstract class Premieres with _$Premieres {
  const factory Premieres({
    @Default(Pagination()) @HiveField(0) Pagination pagination,
    @Default("") @HiveField(2) String date,
    @Default([]) @JsonKey(name: "timers") @HiveField(1) List<Premiere> premieres,
  }) = _Premieres;

  factory Premieres.fromJson(Map<String, dynamic> json) => _$PremieresFromJson(json);
}
