import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  final String id;
  final AnimeEntity anime;
  final dynamic type;
  final String image;
  final String mobileImage;
  const SliderEntity({required this.anime, required this.id, required this.image, required this.mobileImage, required this.type});

  @override
  List<Object?> get props => [];
}
