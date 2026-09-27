import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'avatar.g.dart';
part 'avatar.freezed.dart';

@freezed
@HiveType(typeId: 301)
abstract class Avatar with _$Avatar {
  const factory Avatar({
    @Default("") @HiveField(0) @JsonKey(name: "_id") String id,
    @Default("") @HiveField(1) String avatar,
    @Default("") @HiveField(2) String createdAt,
    @Default("") @HiveField(3) String updatedAt,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
