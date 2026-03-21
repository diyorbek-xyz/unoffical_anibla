// import 'package:application/core/entites/translated_entity.dart';
// import 'package:equatable/equatable.dart';

// class AnimeEntity extends Equatable {
//   final String id;
//   final String slug;
//   final CountryEntity? country;
//   final AccountEntity? studio;
//   final AccountEntity? director;
//   final String? thumbnail;
//   final String? cover;
//   final String? trailer;
//   final List<String> images;
//   final List<AccountEntity>? creators;
//   final List<GenreEntity>? genres;
//   final List<CategoryEntity>? categories;
//   final TranslatedEntity title;
//   final TranslatedEntity? description;
//   final int? publishedYear;
//   final int? age;
//   final int? totalEpisodes;
//   final bool? forOnlyMDH;

//   const AnimeEntity({
//     required this.id,
//     required this.slug,
//     required this.images,
//     required this.title,
//     this.description,
//     this.country,
//     this.publishedYear,
//     this.director,
//     this.studio,
//     this.thumbnail,
//     this.cover,
//     this.trailer,
//     this.age,
//     this.forOnlyMDH,
//     this.totalEpisodes,
//     this.categories,
//     this.creators,
//     this.genres,
//   });

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       title,
//       description,
//       slug,
//       country,
//       publishedYear,
//       director,
//       studio,
//       thumbnail,
//       cover,
//       trailer,
//       age,
//       forOnlyMDH,
//       totalEpisodes,
//       categories,
//       creators,
//       genres,
//       images,
//     ];
//   }
// }
