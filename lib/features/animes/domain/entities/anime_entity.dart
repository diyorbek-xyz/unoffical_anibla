import 'package:application/features/common/domain/entities/item_entity.dart';
import 'package:application/features/common/domain/entities/translated_entity.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeType {
  static const movie = "Movies";
  static const serie = "Series";
}

class AnimeEntity extends Equatable {
  final List? keywords;
  final String id;
  final Translated title;
  final Translated description;
  final String slug;
  final dynamic country;
  final dynamic studio;
  final dynamic director;
  final List<ItemEntity> creators;
  final List<GenreEntity> genres;
  final dynamic categories;
  final int publishedYear;
  final String thumbnail;
  final String cover;
  final List<String> images;
  final String trailer;
  final int age;
  final int totalEpisodes;
  final bool forOnlyMDH;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int duration;
  final String video;
  final String type;

  const AnimeEntity({
    required this.age,
    required this.categories,
    required this.country,
    required this.cover,
    required this.createdAt,
    required this.creators,
    required this.director,
    required this.forOnlyMDH,
    required this.genres,
    required this.images,
    required this.id,
    required this.keywords,
    required this.publishedYear,
    required this.slug,
    required this.studio,
    required this.thumbnail,
    required this.totalEpisodes,
    required this.trailer,
    required this.updatedAt,
    required this.title,
    required this.description,
    required this.duration,
    required this.type,
    required this.video,
  });
  @override
  List<Object?> get props => [
    title,
    age,
    categories,
    country,
    cover,
    createdAt,
    creators,
    director,
    forOnlyMDH,
    genres,
    images,
    id,
    keywords,
    publishedYear,
    slug,
    studio,
    thumbnail,
    totalEpisodes,
    trailer,
    updatedAt,
    description,
    duration,
    video,
    type,
  ];
}

final sample = {
  "keywords": [],
  "_id": "6973a4a6de2f55a4c7898aaa",
  "uz": {
    "title": "Re:Zero O'zga olamda Noldan hayot",
    "description": "Do'kondan qaytayotganda, ",
    "_id": "6973a4a6de2f55a4c7898aab",
  },
  "ru": {
    "title": "Re:Zero. Жизнь с нуля в альтернативном мире",
    "description": "На обратном пути из магазина",
    "_id": "6973a4a6de2f55a4c7898aac",
  },
  "slug": "re-zero-o-zga-olamda-noldan-hayot",
  "country": {
    "_id": "67f51ec01af1f5ec7b37f5da",
    "name": {"uz": "Yaponiya", "ru": "Япония", "_id": "680bc8b06f7f02c30d282c8f"},
    "flag": "uploads/1744117433396-377828372.png",
    "status": true,
    "createdAt": "2025-04-08T13:04:00.681Z",
    "updatedAt": "2025-04-25T17:38:56.750Z",
    "__v": 0,
  },
  "studio": {
    "_id": "68165bc1a4f5ab34c05a94d1",
    "name": "White Fox",
    "image": "uploads/1746295739119-893839498.jpg",
    "status": true,
    "role": "studio",
    "createdAt": "2025-05-03T18:09:05.449Z",
    "updatedAt": "2025-05-03T18:09:05.449Z",
    "__v": 0,
  },
  "director": {
    "_id": "69739f0bde2f55a4c788028d",
    "name": "Masaharu Vatanabe",
    "image": "uploads/1769185031699-17842607.png",
    "status": true,
    "role": "director",
    "createdAt": "2026-01-23T16:17:15.119Z",
    "updatedAt": "2026-01-23T16:17:15.119Z",
    "__v": 0,
  },
  "creators": [
    {
      "_id": "68093c9d6f7f02c30d275a95",
      "name": "Natsu ( Asrbek Xolmirzayev )",
      "image": "uploads/1745435803966-387047021.jpg",
      "status": true,
      "role": "creator",
      "createdAt": "2025-04-23T19:16:45.666Z",
      "updatedAt": "2025-04-23T19:16:45.666Z",
      "__v": 0,
    },
    {
      "_id": "68093db56f7f02c30d275abe",
      "name": "Nanami ( Gulsevar Xalilova )",
      "image": "uploads/1745436081194-295350901.jpg",
      "status": true,
      "role": "creator",
      "createdAt": "2025-04-23T19:21:25.392Z",
      "updatedAt": "2025-04-23T19:21:25.392Z",
      "__v": 0,
    },
    {
      "_id": "68093eb16f7f02c30d275af8",
      "name": "Kapone ( Buranbayev Ibrat )",
      "image": "uploads/1745436332203-162369613.jpg",
      "status": true,
      "role": "creator",
      "createdAt": "2025-04-23T19:25:37.331Z",
      "updatedAt": "2025-04-23T19:25:37.331Z",
      "__v": 0,
    },
  ],
  "genres": [
    {
      "_id": "680bc1cf6f7f02c30d282aa3",
      "name": {"uz": "Fantaziya", "ru": "Фэнтези", "_id": "680bc1cf6f7f02c30d282aa4"},
      "slug": "fantaziya",
      "status": true,
      "createdAt": "2025-04-25T17:09:35.029Z",
      "updatedAt": "2025-04-25T17:09:35.029Z",
      "__v": 0,
    },
    {
      "_id": "680bc1a06f7f02c30d282a98",
      "name": {"uz": "Drama", "ru": "Драма", "_id": "680bc1a06f7f02c30d282a99"},
      "slug": "drama",
      "status": true,
      "createdAt": "2025-04-25T17:08:48.206Z",
      "updatedAt": "2025-04-25T17:08:48.206Z",
      "__v": 0,
    },
    {
      "_id": "680bc6626f7f02c30d282b9d",
      "name": {"uz": "Triller", "ru": "Триллер", "_id": "680bc6626f7f02c30d282b9e"},
      "slug": "triller",
      "status": true,
      "createdAt": "2025-04-25T17:29:06.705Z",
      "updatedAt": "2025-04-25T17:29:06.705Z",
      "__v": 0,
    },
    {
      "_id": "680bc64b6f7f02c30d282b94",
      "name": {"uz": "O'zga dunyo", "ru": "Исекай", "_id": "680bc64b6f7f02c30d282b95"},
      "slug": "o-zga-dunyo",
      "status": true,
      "createdAt": "2025-04-25T17:28:43.597Z",
      "updatedAt": "2025-04-25T17:28:43.597Z",
      "__v": 0,
    },
    {
      "_id": "680bbdd16f7f02c30d2826e7",
      "name": {"uz": "Psixologik", "ru": "Психологическое", "_id": "680bbdd16f7f02c30d2826e8"},
      "slug": "psixologik",
      "status": true,
      "createdAt": "2025-04-25T16:52:33.400Z",
      "updatedAt": "2025-04-25T16:52:33.400Z",
      "__v": 0,
    },
  ],
  "categories": [
    {
      "_id": "680bbe206f7f02c30d282717",
      "name": {"uz": "Hamma animelar", "ru": "Все аниме", "_id": "680bbe206f7f02c30d282718"},
      "slug": "hamma-animelar",
      "status": true,
      "createdAt": "2025-04-25T16:53:52.262Z",
      "updatedAt": "2025-04-25T16:53:52.262Z",
      "__v": 0,
    },
    {
      "_id": "67fb7bb9f3c5660ed7e9cc1b",
      "name": {"uz": "Ongoing", "ru": "Онгоинг", "_id": "67fb7bb9f3c5660ed7e9cc1c"},
      "slug": "ongoing",
      "status": true,
      "createdAt": "2025-04-13T08:54:17.470Z",
      "updatedAt": "2025-04-13T08:54:17.470Z",
      "__v": 0,
    },
  ],
  "published_year": 2016,
  "thumbnail": "uploads/1769185926300-216465077.jpg",
  "cover": "uploads/1769185974657-556482194.jpg",
  "images": [
    "/uploads/1769185983522-451116238.jpg",
    "/uploads/1769185986962-490953689.jpg",
    "/uploads/1769185992330-932080022.jpg",
    "/uploads/1769185995679-297956431.jpg",
  ],
  "trailer": "https://www.youtube.com/embed/Slz_rahWp6Y",
  "age": 17,
  "total_episodes": 26,
  "for_only_mdh": true,
  "createdAt": "2026-01-23T16:41:10.042Z",
  "updatedAt": "2026-03-27T12:05:30.241Z",
  "__v": 0,
  "home_boosted_at": null,
};
