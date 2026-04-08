import 'package:application/features/profile/data/models/profile_model.dart';
import 'package:hive_ce_flutter/adapters.dart';

abstract class ProfileLocal {
  Future<void> saveProfile(ProfileModel profile);
  Future<ProfileModel?> getProfile();
  Future<void> removeProfile();
}

class ProfileLocalImpl extends ProfileLocal {
  final Box<ProfileModel> profileBox;
  ProfileLocalImpl(this.profileBox);

  @override
  Future<ProfileModel?> getProfile() async {
    return profileBox.get("profile");
  }

  @override
  Future<void> removeProfile() async {
    await profileBox.delete("profile");
  }

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    await profileBox.put("profile", profile);
  }
}
