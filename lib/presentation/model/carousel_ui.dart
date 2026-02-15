import 'package:application/data/models/enums/anime.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/entities/other/carousel_entity.dart';
import 'package:application/presentation/model/anime_ui.dart';

class CarouselItemUiModel {
  final String id;
  final AnimeType type;
  final String image;
  final String mobileImage;
  final AnimeUiModel anime;

  const CarouselItemUiModel({required this.anime, required this.id, required this.image, required this.mobileImage, required this.type});

  factory CarouselItemUiModel.fromEntity(CarouselItemEntity entity) {
    return CarouselItemUiModel(
      id: entity.id ?? "id",
      anime: AnimeUiModel.fromEntity(entity.anime ?? AnimeEntity()),
      image: entity.image ?? "image",
      mobileImage: entity.mobileImage ?? "mobImage",
      type: entity.type ?? AnimeType.serie,
    );
  }
}
