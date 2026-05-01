import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/calendar/data/models/timer_model.dart';
import 'package:application/features/calendar/domain/entities/timer_entity.dart';

class TimerMapper {
  static TimerEntity modelToEntity(TimerModel? model) => TimerEntity(
    id: model?.id ?? "",
    anime: AnimeMapper.modelToEntity(model?.anime, model?.type),
    type: model?.type ?? AnimeType.serie,
    time: (model?.time ?? DateTime(2026)).add(Duration(hours: 5)),
    episode: EpisodeMapper.modelToEntity(model?.episode),
  );
}
