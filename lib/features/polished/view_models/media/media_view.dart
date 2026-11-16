import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "media_view.freezed.dart";

typedef OpenMediaCallback = void Function(String? chapterKey);

@freezed
abstract class MediaView with _$MediaView {
  const factory MediaView({
    @Default(0) int releaseYear,
    @Default(0) int ageRestriction,
    @Default(0) int views,
    @Default(0) int likes,
    @Default(0) int saves,
    @Default("") String key,
    @Default("") String cover,
    @Default("") String title,
    @Default("") String author,
    @Default("") String studio,
    @Default("") String mediaUrl,
    @Default("") String thumbnail,
    @Default("") String description,
    @Default([]) List<String> frames,
    @Default({}) Map<String, String> genres,
    @Default({}) Map<String, String> categories,
    @Default({}) Map<String, String> translators,
    @Default(MediaType.comics) MediaType type,
  }) = _MediaView;

  factory MediaView.fromBook(Book book) => .new(
    key: book.id,
    type: book.type,
    title: book.title,
    cover: book.thumbnail,
    likes: book.likesCount,
    views: book.viewsCount,
    thumbnail: book.thumbnail,
    saves: book.bookmarkedCount,
    description: book.description,
    releaseYear: book.releaseYear,
    ageRestriction: book.ageRestriction.tryParseInt() ?? 0,
    categories: Map.fromEntries(book.categories.map((e) => MapEntry(e.id, e.title))),
    genres: Map.fromEntries(book.genres.map((e) => MapEntry(e.id, e.title))),
    translators: Map.fromEntries(book.translators.map((e) => MapEntry(e.id, e.firstName))),
  );
  factory MediaView.fromAnime(Anime anime) => .new(
    key: anime.slug,
    type: anime.type,
    cover: anime.cover,
    frames: anime.images,
    title: anime.title.uz,
    mediaUrl: anime.video,
    ageRestriction: anime.age,
    thumbnail: anime.thumbnail,
    releaseYear: anime.publishedYear,
    description: anime.description.uz,
    studio: anime.studio['name'].toString(),
    author: anime.director['name'].toString(),
    genres: Map.fromEntries(anime.genres.map((e) => MapEntry(e.id, e.title.uz))),
    translators: Map.fromEntries(anime.creators.map((e) => MapEntry(e.id, e.name))),
    categories: Map.fromEntries(anime.categories.map((e) => MapEntry(e.id, e.name.uz))),
  );
}
