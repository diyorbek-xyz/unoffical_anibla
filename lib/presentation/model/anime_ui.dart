import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/other/country_entity.dart';
import 'package:application/domain/entities/users/account_entity.dart';
import 'package:application/presentation/model/account_ui.dart';
import 'package:application/presentation/model/category_ui.dart';
import 'package:application/presentation/model/country_ui.dart';
import 'package:application/presentation/model/genre_ui.dart';
import 'package:application/presentation/model/translated_ui.dart';

class AnimeUiModel {
  final String id;
  final String slug;
  final CountryUiModel? country;
  final AccountUiModel? studio;
  final AccountUiModel? director;
  final String thumbnail;
  final String cover;
  final String trailer;
  final List<String> images;
  final List<AccountUiModel> creators;
  final List<GenreUiModel> genres;
  final List<CategoryUiModel> categories;
  final TranslatedUiModel title;
  final TranslatedUiModel description;
  final int publishedYear;
  final int age;
  final int totalEpisodes;
  final bool forOnlyMDH;

  const AnimeUiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.slug,
    required this.country,
    required this.publishedYear,
    required this.director,
    required this.studio,
    required this.thumbnail,
    required this.cover,
    required this.trailer,
    required this.age,
    required this.forOnlyMDH,
    required this.totalEpisodes,
    required this.categories,
    required this.creators,
    required this.genres,
    required this.images,
  });

  factory AnimeUiModel.fromEntity(AnimeEntity anime) {
    return AnimeUiModel(
      id: anime.id ?? "id",
      slug: anime.slug ?? "slug",
      thumbnail: anime.thumbnail ?? "thumbnail",
      cover: anime.cover ?? "cover",
      trailer: anime.trailer ?? "trailer",
      forOnlyMDH: anime.forOnlyMDH ?? false,
      age: anime.age ?? 0,
      publishedYear: anime.publishedYear ?? 2026,
      totalEpisodes: anime.totalEpisodes ?? 1,
      images: anime.images ?? [],
      title: TranslatedUiModel.fromEntity(anime.title ?? TranslatedEntity()),
      description: TranslatedUiModel.fromEntity(anime.title ?? TranslatedEntity()),
      country: CountryUiModel.fromEntity(anime.country ?? CountryEntity()),
      director: AccountUiModel.fromEntity(anime.director ?? AccountEntity()),
      studio: AccountUiModel.fromEntity(anime.studio ?? AccountEntity()),
      categories: anime.categories?.map((category) => CategoryUiModel.fromEntity(category)).toList() ?? [],
      creators: anime.creators?.map((e) => AccountUiModel.fromEntity(e)).toList() ?? [],
      genres: anime.genres?.map((genre) => GenreUiModel.fromEntity(genre)).toList() ?? [],
    );
  }
}
