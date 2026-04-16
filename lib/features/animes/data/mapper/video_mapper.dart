import 'package:application/features/animes/data/models/video_model.dart';
import 'package:application/features/animes/domain/entities/video_entity.dart';

class VideoMapper {
  static VideoEntity modelToEntity(VideoModel model) =>
      VideoEntity(file: model.file ?? "", skip: model.skip);
}
