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
      duration: (fields[21] as num?)?.toInt(),
      video: fields[22] as String?,
      age: (fields[15] as num?)?.toInt(),
      categories: fields[9] as dynamic,
      country: fields[4] as dynamic,
      cover: fields[12] as String?,
      createdAt: fields[18] as DateTime?,
      creators: (fields[7] as List?)?.cast<ItemModel>(),
      director: fields[6] as dynamic,
      forOnlyMDH: fields[17] as bool?,
      genres: (fields[8] as List?)?.cast<GenreModel>(),
      images: (fields[13] as List?)?.cast<String>(),
      id: fields[1] as String?,
      keywords: (fields[0] as List?)?.cast<dynamic>(),
      publishedYear: (fields[10] as num?)?.toInt(),
      slug: fields[3] as String?,
      studio: fields[5] as dynamic,
      thumbnail: fields[11] as String?,
      totalEpisodes: (fields[16] as num?)?.toInt(),
      trailer: fields[14] as String?,
      updatedAt: fields[19] as DateTime?,
      ru: fields[20] as dynamic,
      uz: fields[2] as dynamic,
      type: fields[23] as String?,
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
  duration: (json['duration'] as num?)?.toInt(),
  video: json['video'] as String?,
  age: (json['age'] as num?)?.toInt(),
  categories: json['categories'],
  country: json['country'],
  cover: addBaseUrl(json['cover'] as String?),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  creators: (json['creators'] as List<dynamic>?)
      ?.map(ItemModel.fromJson)
      .toList(),
  director: json['director'],
  forOnlyMDH: json['for_only_mdh'] as bool?,
  genres: (json['genres'] as List<dynamic>?)?.map(GenreModel.fromJson).toList(),
  images: addBaseUrlAsList(json['images'] as List?),
  id: json['_id'] as String?,
  keywords: json['keywords'] as List<dynamic>?,
  publishedYear: (json['published_year'] as num?)?.toInt(),
  slug: json['slug'] as String?,
  studio: json['studio'],
  thumbnail: addBaseUrl(json['thumbnail'] as String?),
  totalEpisodes: (json['total_episodes'] as num?)?.toInt(),
  trailer: json['trailer'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  ru: json['ru'],
  uz: json['uz'],
  type: json['mediaType'] as String?,
);

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'keywords': instance.keywords,
      '_id': instance.id,
      'uz': instance.uz,
      'ru': instance.ru,
      'slug': instance.slug,
      'country': instance.country,
      'studio': instance.studio,
      'director': instance.director,
      'creators': instance.creators,
      'genres': instance.genres,
      'categories': instance.categories,
      'published_year': instance.publishedYear,
      'thumbnail': instance.thumbnail,
      'cover': instance.cover,
      'images': instance.images,
      'trailer': instance.trailer,
      'age': instance.age,
      'total_episodes': instance.totalEpisodes,
      'for_only_mdh': instance.forOnlyMDH,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'duration': instance.duration,
      'video': instance.video,
      'mediaType': instance.type,
    };
