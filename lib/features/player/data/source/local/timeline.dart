import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

abstract class Timeline {
  Future<void> saveTimeline(String episodeId, TimelineModel timeline);
  TimelineModel? getTimeline(String episodeId);
  List<TimelineModel>? getAllTimelines();
}

class TimelineImpl implements Timeline {
  final Box<TimelineModel> box;
  const TimelineImpl(this.box);

  @override
  TimelineModel? getTimeline(String episodeId) {
    return box.get(episodeId);
  }

  @override
  Future<void> saveTimeline(String episodeId, TimelineModel timeline) async {
    await box.put(episodeId, timeline);
  }
  @override
  List<TimelineModel>? getAllTimelines() {
    return box.values.toList();
  }
}
