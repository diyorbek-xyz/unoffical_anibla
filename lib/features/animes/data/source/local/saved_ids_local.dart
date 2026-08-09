import 'package:hive_ce_flutter/hive_ce_flutter.dart';

abstract class SavedLocal {
  List<String> getSavedIds();
  bool isThisSaved(String id);
  Future<void> saveMedia(String id);
  Future<void> unsaveMedia(String id);
}

class SavedLocalImpl implements SavedLocal {
  final Box<String> box;
  const SavedLocalImpl(this.box);

  @override
  bool isThisSaved(String id) {
    return box.values.toList().contains(id);
  }

  @override
  List<String> getSavedIds() {
    return box.values.toList();
  }

  @override
  Future<void> saveMedia(String id) async {
    await box.add(id);
  }

  @override
  Future<void> unsaveMedia(String id) async {
    await box.delete(id);
  }
}
