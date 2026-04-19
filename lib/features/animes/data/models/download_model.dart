import 'package:hive_ce/hive_ce.dart';

part 'download_model.g.dart';

@HiveType(typeId: 325)
class DownloadModel {
  @HiveField(0)
  final String file;
  @HiveField(1)
  final String skip;
  @HiveField(2)
  final String episodeId;
  const DownloadModel({required this.episodeId, required this.file, required this.skip});
}
