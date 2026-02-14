import 'package:application/domain/entities/translated_entity.dart';
import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final String? id;
  final String? slug;
  final String? country;
  final String? studio;
  final String? director;
  final String? thumbnail;
  final String? cover;
  final String? trailer;
  final List<String>? images;
  final List<String>? creators;
  final List<String>? genres;
  final List<String>? categories;
  final TranslatedEntity? title;
  final TranslatedEntity? description;
  final int? publishedYear;
  final int? age;
  final int? totalEpisodes;
  final bool? forOnlyMDH;

  const AnimeEntity({
    this.id,
    this.title,
    this.description,
    this.slug,
    this.country,
    this.publishedYear,
    this.director,
    this.studio,
    this.thumbnail,
    this.cover,
    this.trailer,
    this.age,
    this.forOnlyMDH,
    this.totalEpisodes,
    this.categories,
    this.creators,
    this.genres,
    this.images,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      slug,
      country,
      publishedYear,
      director,
      studio,
      thumbnail,
      cover,
      trailer,
      age,
      forOnlyMDH,
      totalEpisodes,
      categories,
      creators,
      genres,
      images,
    ];
  }
}
