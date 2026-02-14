import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:equatable/equatable.dart';

class SeasonEntity extends Equatable {
  final String? id;
  final TranslatedEntity? title;
  final String? slug;
  final String? animeId;
  final AnimeEntity? anime;
  const SeasonEntity({this.id, this.title, this.slug, this.animeId, this.anime});

  @override
  List<Object?> get props => [id, title, slug, animeId, anime];
}
