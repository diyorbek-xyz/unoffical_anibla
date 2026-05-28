import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/slider/data/models/slider_model.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';

class SliderMapper {
  static SliderEntity modelToEntity(SliderModel? model) => SliderEntity(
    anime: AnimeMapper.modelToEntity(model?.anime, model?.type),
    id: model?.id ?? "",
    image: model?.image ?? "",
    mobileImage: model?.mobileImage ?? "",
    type: model?.type,
  );
}
