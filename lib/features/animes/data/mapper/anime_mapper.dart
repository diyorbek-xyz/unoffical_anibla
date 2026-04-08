import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/common/mapper/translated_mapper.dart';
import 'package:application/features/explore/data/mapper/genre_mapper.dart';

class AnimeMapper {
  static AnimeEntity modelToEntity(AnimeModel? model) => AnimeEntity(
    age: model?.age ?? 0,
    categories: model?.categories,
    country: model?.country,
    cover: model?.cover ?? "",
    createdAt: model?.createdAt ?? DateTime(2026),
    creators: model?.creators,
    director: model?.director,
    forOnlyMDH: model?.forOnlyMDH ?? false,
    genres: model?.genres?.map(GenreMapper.modelToEntity).toList() ?? [],
    images: model?.images ?? [],
    id: model?.id ?? "nomalum",
    keywords: model?.keywords,
    publishedYear: model?.publishedYear ?? 2026,
    slug: model?.slug ?? "nomalum",
    studio: model?.studio,
    thumbnail: model?.thumbnail ?? "nomalum",
    totalEpisodes: model?.totalEpisodes ?? 0,
    trailer: model?.trailer ?? "",
    updatedAt: model?.updatedAt ?? DateTime(2026),
    title: TranslatedMapper.extendedToEntity(model, 'title'),
    description: TranslatedMapper.extendedToEntity(model, 'description'),
  );
}
