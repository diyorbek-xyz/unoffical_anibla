// import 'package:hive_ce_flutter/hive_ce_flutter.dart';
// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
// @HiveType(typeId: 0)
// class AnimeModel {
//   @JsonKey(name: '_id')
//   @HiveField(0)
//   final String? id;

//   @HiveField(1)
//   final TranslatedModel? title;

//   @HiveField(2)
//   final TranslatedModel? description;

//   @JsonKey(name: 'images')
//   @HiveField(3)
//   final List<String>? frames;

//   @HiveField(4)
//   final String? thumbnail;

//   @HiveField(5)
//   final String? slug;

//   @HiveField(6)
//   final String? trailer;

//   @HiveField(7)
//   final int? age;

//   @HiveField(8)
//   final String? cover;

//   @JsonKey(name: 'published_year')
//   @HiveField(9)
//   final int? year;

//   @HiveField(10)
//   final CountryModel? country;

//   @HiveField(11)
//   final AccountModel? studio;

//   @HiveField(12)
//   final AccountModel? director;

//   @HiveField(13)
//   final List<AccountModel>? creators;

//   @HiveField(14)
//   final List<GenreModel>? genres;

//   @HiveField(15)
//   final List<CategoryModel>? categories;

//   @JsonKey(name: 'for_only_mdh')
//   @HiveField(16)
//   final bool? onlyForMDH;

//   @JsonKey(name: 'total_episodes')
//   @HiveField(17)
//   final int? totalEpisodes;

//   const AnimeModel({
//     this.id,
//     this.title,
//     this.description,
//     this.slug,
//     this.frames,
//     this.thumbnail,
//     this.trailer,
//     this.age,
//     this.cover,
//     this.year,
//     this.categories,
//     this.country,
//     this.creators,
//     this.director,
//     this.genres,
//     this.studio,
//     this.onlyForMDH,
//     this.totalEpisodes,
//   });
// }
