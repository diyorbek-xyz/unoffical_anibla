import 'dart:convert';

import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 5136;

  @override
  Profile read(BinaryReader reader) => Profile.fromJson(jsonDecode(reader.readString()));

  @override
  void write(BinaryWriter writer, Profile obj) => writer.writeString(jsonEncode(obj.toJson()));
}
