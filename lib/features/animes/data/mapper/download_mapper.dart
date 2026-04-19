import 'package:application/features/animes/data/models/download_model.dart';
import 'package:application/features/animes/domain/entities/download_entity.dart';

class DownloadMapper {
  static DownloadModel entityToModel(DownloadEntity entity, [String? path]) =>
      DownloadModel(episodeId: entity.episodeId, file: path ?? entity.file, skip: entity.skip);
}
