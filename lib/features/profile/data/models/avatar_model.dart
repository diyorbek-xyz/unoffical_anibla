import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'avatar_model.g.dart';
part 'avatar_model.freezed.dart';

@freezed
@HiveType(typeId: 9345)
sealed class AvatarModel with _$AvatarModel {
  factory AvatarModel({
    @HiveField(0) @JsonKey(name: "_id") String? id,
    @HiveField(1) String? avatar,
    @HiveField(2) DateTime? createdAt,
    @HiveField(3) DateTime? updatedAt,
  }) = _AvatarModel;

  factory AvatarModel.fromJson(Map<String, dynamic> json) => _$AvatarModelFromJson(json);
}
