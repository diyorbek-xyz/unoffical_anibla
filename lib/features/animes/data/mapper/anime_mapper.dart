import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/common/data/mapper/item_mapper.dart';
import 'package:application/features/common/mapper/translated_mapper.dart';
import 'package:application/features/explore/data/mapper/genre_mapper.dart';

class AnimeMapper {
  static AnimeEntity modelToEntity(AnimeModel? model, [String? type]) => AnimeEntity(
    age: model?.age ?? 0,
    categories: model?.categories ?? [],
    country: model?.country,
    cover: model?.cover ?? "",
    createdAt: model?.createdAt ?? DateTime(2026),
    creators: model?.creators?.map(ItemMapper.modelToEntity).toList() ?? [],
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
    video: model?.video ?? "",
    duration: model?.duration ?? 0,
    type: model?.type ?? type ?? AnimeType.serie,
    updatedAt: model?.updatedAt ?? DateTime(2026),
    title: TranslatedMapper.extendedToEntity(model, 'title'),
    description: TranslatedMapper.extendedToEntity(model, 'description'),
  );

  static AnimeModel entityToModel(AnimeEntity? entity) => AnimeModel(
    age: entity?.age,
    categories: entity?.categories,
    country: entity?.country,
    cover: entity?.cover,
    createdAt: entity?.createdAt,
    creators: entity?.creators.map(ItemMapper.entityToModel).toList(),
    director: entity?.director,
    forOnlyMDH: entity?.forOnlyMDH,
    genres: entity?.genres.map(GenreMapper.entityToModel).toList(),
    images: entity?.images,
    id: entity?.id,
    keywords: entity?.keywords,
    publishedYear: entity?.publishedYear,
    slug: entity?.slug,
    studio: entity?.studio,
    thumbnail: entity?.thumbnail,
    totalEpisodes: entity?.totalEpisodes,
    trailer: entity?.trailer,
    updatedAt: entity?.updatedAt,
    ru: {"name": entity?.title.ru, "description": entity?.description.ru},
    uz: {"name": entity?.title.uz, "description": entity?.description.uz},
    duration: entity?.duration,
    type: entity?.type,
    video: entity?.video,
  );
}
