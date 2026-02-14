import 'package:application/data/models/enums/anime.dart';
import 'package:application/domain/entities/anime_entity.dart';
import 'package:equatable/equatable.dart';

class CarouselItemEntity extends Equatable {
  final String? id;
  final AnimeType? type;
  final String? image;
  final String? mobileImage;
  final AnimeEntity? anime;

  const CarouselItemEntity({this.anime, this.id, this.image, this.mobileImage, this.type});

  @override
  List<Object?> get props => [id, type, image, mobileImage, anime];
}