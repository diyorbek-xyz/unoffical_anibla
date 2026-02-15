import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/entities/animes/season_entity.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:application/presentation/model/translated_ui.dart';

class SeasonUiModel {
  final String id;
  final TranslatedUiModel? title;
  final String slug;
  final String animeId;
  final AnimeUiModel? anime;
  const SeasonUiModel({required this.id, required this.title, required this.slug, required this.animeId, required this.anime});
  factory SeasonUiModel.fromEntity(SeasonEntity season) {
    return SeasonUiModel(
      id: season.id ?? "id",
      title: TranslatedUiModel.fromEntity(season.title ?? TranslatedEntity()),
      slug: season.slug ?? "slug",
      animeId: season.anime?.id ?? "animeId",
      anime: AnimeUiModel.fromEntity(season.anime ?? AnimeEntity()),
    );
  }
}
