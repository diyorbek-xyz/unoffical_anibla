// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  final typeId = 735;

  @override
  Anime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      uz: fields[2] == null ? {} : (fields[2] as Map).cast<String, dynamic>(),
      ru: fields[3] == null ? {} : (fields[3] as Map).cast<String, dynamic>(),
      age: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      slug: fields[4] == null ? '' : fields[4] as String,
      keywords: fields[5] == null ? [] : (fields[5] as List).cast<dynamic>(),
      studio: fields[6] == null ? {} : fields[6] as dynamic,
      duration: fields[7] == null ? 0 : (fields[7] as num).toInt(),
      video: fields[8] == null ? '' : fields[8] as String,
      country: fields[9] == null ? {} : fields[9] as dynamic,
      trailer: fields[10] == null ? '' : fields[10] as String,
      director: fields[11] == null ? {} : fields[11] as dynamic,
      categories: fields[12] == null ? [] : fields[12] as dynamic,
      createdDate: fields[13] == null ? '' : fields[13] as String,
      updatedDate: fields[14] == null ? '' : fields[14] as String,
      genres: fields[15] == null ? [] : (fields[15] as List).cast<Genre>(),
      creators: fields[16] == null ? [] : (fields[16] as List).cast<Creator>(),
      id: fields[17] == null ? '' : fields[17] as String,
      type: fields[18] == null ? AnimeType.serie : fields[18] as AnimeType,
      forOnlyMDH: fields[19] == null ? false : fields[19] as bool,
      publishedYear: fields[20] == null ? 2000 : (fields[20] as num).toInt(),
      totalEpisodes: fields[21] == null ? 0 : (fields[21] as num).toInt(),
      thumbnail: fields[22] == null ? '' : fields[22] as String,
      cover: fields[23] == null ? '' : fields[23] as String,
      images: fields[24] == null ? [] : (fields[24] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(24)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.uz)
      ..writeByte(3)
      ..write(obj.ru)
      ..writeByte(4)
      ..write(obj.slug)
      ..writeByte(5)
      ..write(obj.keywords)
      ..writeByte(6)
      ..write(obj.studio)
      ..writeByte(7)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.video)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.trailer)
      ..writeByte(11)
      ..write(obj.director)
      ..writeByte(12)
      ..write(obj.categories)
      ..writeByte(13)
      ..write(obj.createdDate)
      ..writeByte(14)
      ..write(obj.updatedDate)
      ..writeByte(15)
      ..write(obj.genres)
      ..writeByte(16)
      ..write(obj.creators)
      ..writeByte(17)
      ..write(obj.id)
      ..writeByte(18)
      ..write(obj.type)
      ..writeByte(19)
      ..write(obj.forOnlyMDH)
      ..writeByte(20)
      ..write(obj.publishedYear)
      ..writeByte(21)
      ..write(obj.totalEpisodes)
      ..writeByte(22)
      ..write(obj.thumbnail)
      ..writeByte(23)
      ..write(obj.cover)
      ..writeByte(24)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Anime _$AnimeFromJson(Map<String, dynamic> json) => _Anime(
  uz: json['uz'] as Map<String, dynamic>? ?? const {},
  ru: json['ru'] as Map<String, dynamic>? ?? const {},
  age: (json['age'] as num?)?.toInt() ?? 0,
  slug: json['slug'] as String? ?? "",
  keywords: json['keywords'] as List<dynamic>? ?? const [],
  studio: json['studio'] ?? const {},
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  video: json['video'] as String? ?? "",
  country: json['country'] ?? const {},
  trailer: json['trailer'] as String? ?? "",
  director: json['director'] ?? const {},
  categories: json['categories'] ?? const [],
  createdDate: json['createdDate'] as String? ?? "",
  updatedDate: json['updatedDate'] as String? ?? "",
  genres:
      (json['genres'] as List<dynamic>?)?.map(Genre.fromJson).toList() ??
      const [],
  creators:
      (json['creators'] as List<dynamic>?)?.map(Creator.fromJson).toList() ??
      const [],
  id: json['_id'] as String? ?? "",
  type:
      $enumDecodeNullable(_$AnimeTypeEnumMap, json['mediaType']) ??
      AnimeType.serie,
  forOnlyMDH: json['for_only_mdh'] as bool? ?? false,
  publishedYear: (json['published_year'] as num?)?.toInt() ?? 2000,
  totalEpisodes: (json['total_episodes'] as num?)?.toInt() ?? 0,
  thumbnail: json['thumbnail'] == null
      ? ""
      : addBaseUrl(json['thumbnail'] as String?),
  cover: json['cover'] == null ? "" : addBaseUrl(json['cover'] as String?),
  images: json['images'] == null
      ? const []
      : addBaseUrlAsList(json['images'] as List?),
);

Map<String, dynamic> _$AnimeToJson(_Anime instance) => <String, dynamic>{
  'uz': instance.uz,
  'ru': instance.ru,
  'age': instance.age,
  'slug': instance.slug,
  'keywords': instance.keywords,
  'studio': instance.studio,
  'duration': instance.duration,
  'video': instance.video,
  'country': instance.country,
  'trailer': instance.trailer,
  'director': instance.director,
  'categories': instance.categories,
  'createdDate': instance.createdDate,
  'updatedDate': instance.updatedDate,
  'genres': instance.genres,
  'creators': instance.creators,
  '_id': instance.id,
  'mediaType': _$AnimeTypeEnumMap[instance.type]!,
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
