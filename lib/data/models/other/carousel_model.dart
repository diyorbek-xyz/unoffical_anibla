import 'package:application/data/models/enums/anime.dart';
import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/domain/entities/carousel_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'carousel_model.g.dart';

@HiveType(typeId: 22)
class CarouselItemModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final AnimeModel anime;
  @HiveField(2)
  final AnimeType type;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String mobileImage;

  const CarouselItemModel({required this.anime, required this.type, required this.image, required this.mobileImage, required this.id});
  factory CarouselItemModel.fromJson(dynamic json) {
    String baseUrl = dotenv.env['NEW_BASE_URL'] ?? "";
    return CarouselItemModel(
      id: json['_id'],
      anime: AnimeModel.fromJson(json['media']),
      type: AnimeType.fromString(json['mediaType']),
      image: "$baseUrl${json['image']}",
      mobileImage: "$baseUrl${json['mobile_image']}",
    );
  }

  CarouselItemEntity toEntity() {
    return CarouselItemEntity(id: id, anime: anime.toEntity(), image: image, mobileImage: mobileImage, type: type);
  }
}
