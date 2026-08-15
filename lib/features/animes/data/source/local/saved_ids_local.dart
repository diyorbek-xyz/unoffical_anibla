import 'package:hive_ce_flutter/hive_ce_flutter.dart';

abstract class SavedLocal {
  List<String> getSavedIds();
  bool isThisSaved(String id);
  Future<void> saveMedia(String id);
  Future<void> unsaveMedia(String id);
  Future<void> fullChange(List<String> animeIds);
}

class SavedLocalImpl implements SavedLocal {
  final Box<String> box;
  const SavedLocalImpl(this.box);

  @override
  Future<void> fullChange(List<String> animeIds) async {
    await box.clear();
    await box.addAll(animeIds);
  }

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
