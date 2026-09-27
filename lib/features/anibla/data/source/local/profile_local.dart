import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:hive_ce_flutter/adapters.dart';

abstract class ProfileLocal {
  Future<void> saveProfile(Profile profile);
  Future<Profile?> getProfile();
  Future<void> removeProfile();
}

class ProfileLocalImpl implements ProfileLocal {
  final Box<Profile> profileBox;
  const ProfileLocalImpl(this.profileBox);

  @override
  Future<Profile?> getProfile() async {
    return profileBox.get("profile");
  }

  @override
  Future<void> removeProfile() async {
    await profileBox.delete("profile");
  }

  @override
  Future<void> saveProfile(Profile profile) async {
    await profileBox.put("profile", profile);
  }
}
