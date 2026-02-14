import 'package:hive_ce/hive_ce.dart';

part 'user_role.g.dart';

@HiveType(typeId: 102)
enum UserRole {
  @HiveField(0)
  studio,
  @HiveField(1)
  director,
  @HiveField(2)
  creator,
  @HiveField(3)
  user;

  factory UserRole.fromString(String str) {
    switch (str) {
      case "studio":
        return UserRole.studio;
      case "director":
        return UserRole.director;
      case "creator":
        return UserRole.creator;
      default:
        return UserRole.user;
    }
  }
}
