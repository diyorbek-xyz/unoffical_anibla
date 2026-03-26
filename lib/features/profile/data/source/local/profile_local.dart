import 'package:application/features/profile/data/models/account_model.dart';
import 'package:hive_ce_flutter/adapters.dart';

abstract class ProfileLocal {
  Future<void> saveProfile(AccountModel profile);
  Future<AccountModel?> getProfile();
  Future<void> removeProfile();
}

class ProfileLocalImpl extends ProfileLocal {
  final Box<AccountModel> profileBox;
  ProfileLocalImpl(this.profileBox);

  @override
  Future<AccountModel?> getProfile() async {
    return profileBox.get("profile");
  }

  @override
  Future<void> removeProfile() async {
    await profileBox.delete("profile");
  }

  @override
  Future<void> saveProfile(AccountModel profile) async {
    await profileBox.put("profile", profile);
  }
}
