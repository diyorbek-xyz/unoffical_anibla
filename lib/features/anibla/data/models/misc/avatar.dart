import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar.g.dart';
part 'avatar.freezed.dart';

@freezed
abstract class Avatar with _$Avatar {
  const factory Avatar({@Default("") String id, @Default("") String title}) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

@freezed
abstract class AvatarGroup with _$AvatarGroup {
  const factory AvatarGroup({@Default("") String title, @Default([]) List<Avatar> assets}) = _AvatarGroup;
  factory AvatarGroup.fromJson(Map<String, dynamic> json) => _$AvatarGroupFromJson(json);
}
