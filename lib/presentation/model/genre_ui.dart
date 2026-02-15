import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/filter/genre_entity.dart';
import 'package:application/presentation/model/translated_ui.dart';

class GenreUiModel {
  final String id;
  final TranslatedUiModel name;
  final String slug;
  const GenreUiModel({required this.id, required this.name, required this.slug});

  factory GenreUiModel.fromEntity(GenreEntity genre) {
    return GenreUiModel(
      id: genre.id ?? "id",
      name: TranslatedUiModel.fromEntity(genre.name ?? TranslatedEntity()),
      slug: genre.slug ?? "slug",
    );
  }
}
