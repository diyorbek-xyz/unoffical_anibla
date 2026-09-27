import 'package:application/shared/utils/base_url.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'creator.g.dart';
part 'creator.freezed.dart';

@HiveType(typeId: 101)
@Freezed(fromJson: true, toJson: true)
abstract class Creator with _$Creator {
  const factory Creator({
    @Default("") @HiveField(0) final String id,
    @Default("") @HiveField(1) final String name,
    @Default("") @HiveField(2) final String role,
    @Default(false) @HiveField(3) final bool status,
    @Default("") @JsonKey(fromJson: addBaseUrl, includeFromJson: true) @HiveField(4) final String image,
  }) = _Creator;

  factory Creator.fromJson(dynamic json) {
    if (json is String) return Creator(id: json);
    return _$CreatorFromJson(json);
  }
}
