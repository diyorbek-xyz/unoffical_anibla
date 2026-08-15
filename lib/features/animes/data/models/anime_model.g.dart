// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeModelAdapter extends TypeAdapter<AnimeModel> {
  @override
  final typeId = 2;

  @override
  AnimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeModel(
      age: (fields[15] as num?)?.toInt(),
      uz: fields[2] as dynamic,
      ru: fields[20] as dynamic,
      slug: fields[3] as String?,
      keywords: (fields[0] as List?)?.cast<dynamic>(),
      studio: fields[5] as dynamic,
      duration: (fields[21] as num?)?.toInt(),
      video: fields[22] as String?,
      country: fields[4] as dynamic,
      trailer: fields[14] as String?,
      director: fields[6] as dynamic,
      categories: fields[9] as dynamic,
      createdAt: fields[18] as DateTime?,
      updatedAt: fields[19] as DateTime?,
      genres: (fields[8] as List?)?.cast<GenreModel>(),
      creators: (fields[7] as List?)?.cast<ItemModel>(),
      id: fields[1] as String?,
      type: fields[23] as AnimeType?,
      forOnlyMDH: fields[17] as bool?,
      publishedYear: (fields[10] as num?)?.toInt(),
      totalEpisodes: (fields[16] as num?)?.toInt(),
      thumbnail: fields[11] as String?,
      cover: fields[12] as String?,
      images: (fields[13] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AnimeModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.keywords)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.uz)
      ..writeByte(3)
      ..write(obj.slug)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.studio)
      ..writeByte(6)
      ..write(obj.director)
      ..writeByte(7)
      ..write(obj.creators)
      ..writeByte(8)
      ..write(obj.genres)
      ..writeByte(9)
      ..write(obj.categories)
      ..writeByte(10)
      ..write(obj.publishedYear)
      ..writeByte(11)
      ..write(obj.thumbnail)
      ..writeByte(12)
      ..write(obj.cover)
      ..writeByte(13)
      ..write(obj.images)
      ..writeByte(14)
      ..write(obj.trailer)
      ..writeByte(15)
      ..write(obj.age)
      ..writeByte(16)
      ..write(obj.totalEpisodes)
      ..writeByte(17)
      ..write(obj.forOnlyMDH)
      ..writeByte(18)
      ..write(obj.createdAt)
      ..writeByte(19)
      ..write(obj.updatedAt)
      ..writeByte(20)
      ..write(obj.ru)
      ..writeByte(21)
      ..write(obj.duration)
      ..writeByte(22)
      ..write(obj.video)
      ..writeByte(23)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnimeTypeAdapter extends TypeAdapter<AnimeType> {
  @override
  final typeId = 9483;

  @override
  AnimeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AnimeType.movie;
      case 1:
        return AnimeType.serie;
      default:
        return AnimeType.movie;
    }
  }

  @override
  void write(BinaryWriter writer, AnimeType obj) {
    switch (obj) {
      case AnimeType.movie:
        writer.writeByte(0);
      case AnimeType.serie:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => _AnimeModel(
  age: (json['age'] as num?)?.toInt(),
  uz: json['uz'],
  ru: json['ru'],
  slug: json['slug'] as String?,
  keywords: json['keywords'] as List<dynamic>?,
  studio: json['studio'],
  duration: (json['duration'] as num?)?.toInt(),
  video: json['video'] as String?,
  country: json['country'],
  trailer: json['trailer'] as String?,
  director: json['director'],
  categories: json['categories'],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  genres: (json['genres'] as List<dynamic>?)?.map(GenreModel.fromJson).toList(),
  creators: (json['creators'] as List<dynamic>?)
      ?.map(ItemModel.fromJson)
      .toList(),
  id: json['_id'] as String?,
  type: $enumDecodeNullable(_$AnimeTypeEnumMap, json['mediaType']),
  forOnlyMDH: json['for_only_mdh'] as bool?,
  publishedYear: (json['published_year'] as num?)?.toInt(),
  totalEpisodes: (json['total_episodes'] as num?)?.toInt(),
  thumbnail: addBaseUrl(json['thumbnail'] as String?),
  cover: addBaseUrl(json['cover'] as String?),
  images: addBaseUrlAsList(json['images'] as List?),
);

Map<String, dynamic> _$AnimeModelToJson(_AnimeModel instance) =>
    <String, dynamic>{
      'age': instance.age,
      'uz': instance.uz,
      'ru': instance.ru,
      'slug': instance.slug,
      'keywords': instance.keywords,
      'studio': instance.studio,
      'duration': instance.duration,
      'video': instance.video,
      'country': instance.country,
      'trailer': instance.trailer,
      'director': instance.director,
      'categories': instance.categories,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'genres': instance.genres,
      'creators': instance.creators,
      '_id': instance.id,
      'mediaType': _$AnimeTypeEnumMap[instance.type],
      'for_only_mdh': instance.forOnlyMDH,
      'published_year': instance.publishedYear,
      'total_episodes': instance.totalEpisodes,
      'thumbnail': instance.thumbnail,
      'cover': instance.cover,
      'images': instance.images,
    };

const _$AnimeTypeEnumMap = {
  AnimeType.movie: 'Movies',
  AnimeType.serie: 'Series',
};
