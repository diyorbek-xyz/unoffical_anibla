import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/slider/data/models/slider_model.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';

class SliderMapper {
  static SliderEntity modelToEntity(SliderModel? model) => SliderEntity(
    anime: AnimeMapper.modelToEntity(model?.anime),
    id: model?.id ?? "NN",
    image: model?.image ?? "NN",
    mobileImage: model?.mobileImage ?? "NN",
    type: model?.type,
  );
}
