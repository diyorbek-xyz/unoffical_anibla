// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Manga {

@HiveField(0) String get slug;@HiveField(1) String get title;@HiveField(2) String get description;@HiveField(3) List<ManoGenre> get genres;@HiveField(4) List<ManoChapter> get chapters;@HiveField(5) MediaType get type;@HiveField(6) List<ManoCategory> get categories;@HiveField(7) List<ManoTranslator> get translators;@HiveField(8)@JsonKey(name: "manga_id") String get id;@HiveField(9)@JsonKey(name: "real_link") String get realLink;@HiveField(10)@JsonKey(name: "likes_count") int get likesCount;@HiveField(11)@JsonKey(name: "views_count") int get viewsCount;@HiveField(12)@JsonKey(name: "image_url") String get thumbnail;@HiveField(13)@JsonKey(name: "is_showed") bool get isShowed;@HiveField(14)@JsonKey(name: "updated_at") String get updatedAt;@HiveField(15)@JsonKey(name: "created_at") String get createdAt;@HiveField(16)@JsonKey(name: "release_year") int get releaseYear;@HiveField(17)@JsonKey(name: "second_title") String get secondTitle;@HiveField(18)@JsonKey(name: "showing_date") String get showingDate;@HiveField(19)@JsonKey(name: "average_rating") int get averageRating;@HiveField(20)@JsonKey(name: "chapters_count") int get chaptersCount;@HiveField(21)@JsonKey(name: "is_bookmarked") bool get isBookmarked;@HiveField(22)@JsonKey(name: "bookmarked_count") int get bookmarkedCount;@HiveField(23)@JsonKey(name: "age_restriction") String get ageRestriction;@HiveField(24)@JsonKey(name: "release_status") BookStatus get releaseStatus;@HiveField(25)@JsonKey(name: "translation_status") BookStatus get translationStatus;
/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaCopyWith<Manga> get copyWith => _$MangaCopyWithImpl<Manga>(this as Manga, _$identity);

  /// Serializes this Manga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Manga&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.translators, translators)&&(identical(other.id, id) || other.id == id)&&(identical(other.realLink, realLink) || other.realLink == realLink)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.isShowed, isShowed) || other.isShowed == isShowed)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.secondTitle, secondTitle) || other.secondTitle == secondTitle)&&(identical(other.showingDate, showingDate) || other.showingDate == showingDate)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.bookmarkedCount, bookmarkedCount) || other.bookmarkedCount == bookmarkedCount)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,slug,title,description,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(chapters),type,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(translators),id,realLink,likesCount,viewsCount,thumbnail,isShowed,updatedAt,createdAt,releaseYear,secondTitle,showingDate,averageRating,chaptersCount,isBookmarked,bookmarkedCount,ageRestriction,releaseStatus,translationStatus]);

@override
String toString() {
  return 'Manga(slug: $slug, title: $title, description: $description, genres: $genres, chapters: $chapters, type: $type, categories: $categories, translators: $translators, id: $id, realLink: $realLink, likesCount: $likesCount, viewsCount: $viewsCount, thumbnail: $thumbnail, isShowed: $isShowed, updatedAt: $updatedAt, createdAt: $createdAt, releaseYear: $releaseYear, secondTitle: $secondTitle, showingDate: $showingDate, averageRating: $averageRating, chaptersCount: $chaptersCount, isBookmarked: $isBookmarked, bookmarkedCount: $bookmarkedCount, ageRestriction: $ageRestriction, releaseStatus: $releaseStatus, translationStatus: $translationStatus)';
}


}

/// @nodoc
abstract mixin class $MangaCopyWith<$Res>  {
  factory $MangaCopyWith(Manga value, $Res Function(Manga) _then) = _$MangaCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String slug,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) List<ManoGenre> genres,@HiveField(4) List<ManoChapter> chapters,@HiveField(5) MediaType type,@HiveField(6) List<ManoCategory> categories,@HiveField(7) List<ManoTranslator> translators,@HiveField(8)@JsonKey(name: "manga_id") String id,@HiveField(9)@JsonKey(name: "real_link") String realLink,@HiveField(10)@JsonKey(name: "likes_count") int likesCount,@HiveField(11)@JsonKey(name: "views_count") int viewsCount,@HiveField(12)@JsonKey(name: "image_url") String thumbnail,@HiveField(13)@JsonKey(name: "is_showed") bool isShowed,@HiveField(14)@JsonKey(name: "updated_at") String updatedAt,@HiveField(15)@JsonKey(name: "created_at") String createdAt,@HiveField(16)@JsonKey(name: "release_year") int releaseYear,@HiveField(17)@JsonKey(name: "second_title") String secondTitle,@HiveField(18)@JsonKey(name: "showing_date") String showingDate,@HiveField(19)@JsonKey(name: "average_rating") int averageRating,@HiveField(20)@JsonKey(name: "chapters_count") int chaptersCount,@HiveField(21)@JsonKey(name: "is_bookmarked") bool isBookmarked,@HiveField(22)@JsonKey(name: "bookmarked_count") int bookmarkedCount,@HiveField(23)@JsonKey(name: "age_restriction") String ageRestriction,@HiveField(24)@JsonKey(name: "release_status") BookStatus releaseStatus,@HiveField(25)@JsonKey(name: "translation_status") BookStatus translationStatus
});




}
/// @nodoc
class _$MangaCopyWithImpl<$Res>
    implements $MangaCopyWith<$Res> {
  _$MangaCopyWithImpl(this._self, this._then);

  final Manga _self;
  final $Res Function(Manga) _then;

/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? title = null,Object? description = null,Object? genres = null,Object? chapters = null,Object? type = null,Object? categories = null,Object? translators = null,Object? id = null,Object? realLink = null,Object? likesCount = null,Object? viewsCount = null,Object? thumbnail = null,Object? isShowed = null,Object? updatedAt = null,Object? createdAt = null,Object? releaseYear = null,Object? secondTitle = null,Object? showingDate = null,Object? averageRating = null,Object? chaptersCount = null,Object? isBookmarked = null,Object? bookmarkedCount = null,Object? ageRestriction = null,Object? releaseStatus = null,Object? translationStatus = null,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<ManoGenre>,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ManoChapter>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ManoCategory>,translators: null == translators ? _self.translators : translators // ignore: cast_nullable_to_non_nullable
as List<ManoTranslator>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,realLink: null == realLink ? _self.realLink : realLink // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,isShowed: null == isShowed ? _self.isShowed : isShowed // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,secondTitle: null == secondTitle ? _self.secondTitle : secondTitle // ignore: cast_nullable_to_non_nullable
as String,showingDate: null == showingDate ? _self.showingDate : showingDate // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,bookmarkedCount: null == bookmarkedCount ? _self.bookmarkedCount : bookmarkedCount // ignore: cast_nullable_to_non_nullable
as int,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as String,releaseStatus: null == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,translationStatus: null == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Manga].
extension MangaPatterns on Manga {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Manga value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Manga value)  $default,){
final _that = this;
switch (_that) {
case _Manga():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Manga value)?  $default,){
final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String slug, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  List<ManoGenre> genres, @HiveField(4)  List<ManoChapter> chapters, @HiveField(5)  MediaType type, @HiveField(6)  List<ManoCategory> categories, @HiveField(7)  List<ManoTranslator> translators, @HiveField(8)@JsonKey(name: "manga_id")  String id, @HiveField(9)@JsonKey(name: "real_link")  String realLink, @HiveField(10)@JsonKey(name: "likes_count")  int likesCount, @HiveField(11)@JsonKey(name: "views_count")  int viewsCount, @HiveField(12)@JsonKey(name: "image_url")  String thumbnail, @HiveField(13)@JsonKey(name: "is_showed")  bool isShowed, @HiveField(14)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(15)@JsonKey(name: "created_at")  String createdAt, @HiveField(16)@JsonKey(name: "release_year")  int releaseYear, @HiveField(17)@JsonKey(name: "second_title")  String secondTitle, @HiveField(18)@JsonKey(name: "showing_date")  String showingDate, @HiveField(19)@JsonKey(name: "average_rating")  int averageRating, @HiveField(20)@JsonKey(name: "chapters_count")  int chaptersCount, @HiveField(21)@JsonKey(name: "is_bookmarked")  bool isBookmarked, @HiveField(22)@JsonKey(name: "bookmarked_count")  int bookmarkedCount, @HiveField(23)@JsonKey(name: "age_restriction")  String ageRestriction, @HiveField(24)@JsonKey(name: "release_status")  BookStatus releaseStatus, @HiveField(25)@JsonKey(name: "translation_status")  BookStatus translationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that.slug,_that.title,_that.description,_that.genres,_that.chapters,_that.type,_that.categories,_that.translators,_that.id,_that.realLink,_that.likesCount,_that.viewsCount,_that.thumbnail,_that.isShowed,_that.updatedAt,_that.createdAt,_that.releaseYear,_that.secondTitle,_that.showingDate,_that.averageRating,_that.chaptersCount,_that.isBookmarked,_that.bookmarkedCount,_that.ageRestriction,_that.releaseStatus,_that.translationStatus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String slug, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  List<ManoGenre> genres, @HiveField(4)  List<ManoChapter> chapters, @HiveField(5)  MediaType type, @HiveField(6)  List<ManoCategory> categories, @HiveField(7)  List<ManoTranslator> translators, @HiveField(8)@JsonKey(name: "manga_id")  String id, @HiveField(9)@JsonKey(name: "real_link")  String realLink, @HiveField(10)@JsonKey(name: "likes_count")  int likesCount, @HiveField(11)@JsonKey(name: "views_count")  int viewsCount, @HiveField(12)@JsonKey(name: "image_url")  String thumbnail, @HiveField(13)@JsonKey(name: "is_showed")  bool isShowed, @HiveField(14)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(15)@JsonKey(name: "created_at")  String createdAt, @HiveField(16)@JsonKey(name: "release_year")  int releaseYear, @HiveField(17)@JsonKey(name: "second_title")  String secondTitle, @HiveField(18)@JsonKey(name: "showing_date")  String showingDate, @HiveField(19)@JsonKey(name: "average_rating")  int averageRating, @HiveField(20)@JsonKey(name: "chapters_count")  int chaptersCount, @HiveField(21)@JsonKey(name: "is_bookmarked")  bool isBookmarked, @HiveField(22)@JsonKey(name: "bookmarked_count")  int bookmarkedCount, @HiveField(23)@JsonKey(name: "age_restriction")  String ageRestriction, @HiveField(24)@JsonKey(name: "release_status")  BookStatus releaseStatus, @HiveField(25)@JsonKey(name: "translation_status")  BookStatus translationStatus)  $default,) {final _that = this;
switch (_that) {
case _Manga():
return $default(_that.slug,_that.title,_that.description,_that.genres,_that.chapters,_that.type,_that.categories,_that.translators,_that.id,_that.realLink,_that.likesCount,_that.viewsCount,_that.thumbnail,_that.isShowed,_that.updatedAt,_that.createdAt,_that.releaseYear,_that.secondTitle,_that.showingDate,_that.averageRating,_that.chaptersCount,_that.isBookmarked,_that.bookmarkedCount,_that.ageRestriction,_that.releaseStatus,_that.translationStatus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String slug, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  List<ManoGenre> genres, @HiveField(4)  List<ManoChapter> chapters, @HiveField(5)  MediaType type, @HiveField(6)  List<ManoCategory> categories, @HiveField(7)  List<ManoTranslator> translators, @HiveField(8)@JsonKey(name: "manga_id")  String id, @HiveField(9)@JsonKey(name: "real_link")  String realLink, @HiveField(10)@JsonKey(name: "likes_count")  int likesCount, @HiveField(11)@JsonKey(name: "views_count")  int viewsCount, @HiveField(12)@JsonKey(name: "image_url")  String thumbnail, @HiveField(13)@JsonKey(name: "is_showed")  bool isShowed, @HiveField(14)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(15)@JsonKey(name: "created_at")  String createdAt, @HiveField(16)@JsonKey(name: "release_year")  int releaseYear, @HiveField(17)@JsonKey(name: "second_title")  String secondTitle, @HiveField(18)@JsonKey(name: "showing_date")  String showingDate, @HiveField(19)@JsonKey(name: "average_rating")  int averageRating, @HiveField(20)@JsonKey(name: "chapters_count")  int chaptersCount, @HiveField(21)@JsonKey(name: "is_bookmarked")  bool isBookmarked, @HiveField(22)@JsonKey(name: "bookmarked_count")  int bookmarkedCount, @HiveField(23)@JsonKey(name: "age_restriction")  String ageRestriction, @HiveField(24)@JsonKey(name: "release_status")  BookStatus releaseStatus, @HiveField(25)@JsonKey(name: "translation_status")  BookStatus translationStatus)?  $default,) {final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that.slug,_that.title,_that.description,_that.genres,_that.chapters,_that.type,_that.categories,_that.translators,_that.id,_that.realLink,_that.likesCount,_that.viewsCount,_that.thumbnail,_that.isShowed,_that.updatedAt,_that.createdAt,_that.releaseYear,_that.secondTitle,_that.showingDate,_that.averageRating,_that.chaptersCount,_that.isBookmarked,_that.bookmarkedCount,_that.ageRestriction,_that.releaseStatus,_that.translationStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Manga implements Manga {
  const _Manga({@HiveField(0) this.slug = "", @HiveField(1) this.title = "", @HiveField(2) this.description = "", @HiveField(3) final  List<ManoGenre> genres = const [], @HiveField(4) final  List<ManoChapter> chapters = const [], @HiveField(5) this.type = MediaType.manga, @HiveField(6) final  List<ManoCategory> categories = const [], @HiveField(7) final  List<ManoTranslator> translators = const [], @HiveField(8)@JsonKey(name: "manga_id") this.id = "", @HiveField(9)@JsonKey(name: "real_link") this.realLink = "", @HiveField(10)@JsonKey(name: "likes_count") this.likesCount = 0, @HiveField(11)@JsonKey(name: "views_count") this.viewsCount = 0, @HiveField(12)@JsonKey(name: "image_url") this.thumbnail = "", @HiveField(13)@JsonKey(name: "is_showed") this.isShowed = false, @HiveField(14)@JsonKey(name: "updated_at") this.updatedAt = "", @HiveField(15)@JsonKey(name: "created_at") this.createdAt = "", @HiveField(16)@JsonKey(name: "release_year") this.releaseYear = 0, @HiveField(17)@JsonKey(name: "second_title") this.secondTitle = "", @HiveField(18)@JsonKey(name: "showing_date") this.showingDate = "", @HiveField(19)@JsonKey(name: "average_rating") this.averageRating = 0, @HiveField(20)@JsonKey(name: "chapters_count") this.chaptersCount = 0, @HiveField(21)@JsonKey(name: "is_bookmarked") this.isBookmarked = false, @HiveField(22)@JsonKey(name: "bookmarked_count") this.bookmarkedCount = 0, @HiveField(23)@JsonKey(name: "age_restriction") this.ageRestriction = "", @HiveField(24)@JsonKey(name: "release_status") this.releaseStatus = BookStatus.stopped, @HiveField(25)@JsonKey(name: "translation_status") this.translationStatus = BookStatus.stopped}): _genres = genres,_chapters = chapters,_categories = categories,_translators = translators;
  factory _Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

@override@JsonKey()@HiveField(0) final  String slug;
@override@JsonKey()@HiveField(1) final  String title;
@override@JsonKey()@HiveField(2) final  String description;
 final  List<ManoGenre> _genres;
@override@JsonKey()@HiveField(3) List<ManoGenre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<ManoChapter> _chapters;
@override@JsonKey()@HiveField(4) List<ManoChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override@JsonKey()@HiveField(5) final  MediaType type;
 final  List<ManoCategory> _categories;
@override@JsonKey()@HiveField(6) List<ManoCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<ManoTranslator> _translators;
@override@JsonKey()@HiveField(7) List<ManoTranslator> get translators {
  if (_translators is EqualUnmodifiableListView) return _translators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_translators);
}

@override@HiveField(8)@JsonKey(name: "manga_id") final  String id;
@override@HiveField(9)@JsonKey(name: "real_link") final  String realLink;
@override@HiveField(10)@JsonKey(name: "likes_count") final  int likesCount;
@override@HiveField(11)@JsonKey(name: "views_count") final  int viewsCount;
@override@HiveField(12)@JsonKey(name: "image_url") final  String thumbnail;
@override@HiveField(13)@JsonKey(name: "is_showed") final  bool isShowed;
@override@HiveField(14)@JsonKey(name: "updated_at") final  String updatedAt;
@override@HiveField(15)@JsonKey(name: "created_at") final  String createdAt;
@override@HiveField(16)@JsonKey(name: "release_year") final  int releaseYear;
@override@HiveField(17)@JsonKey(name: "second_title") final  String secondTitle;
@override@HiveField(18)@JsonKey(name: "showing_date") final  String showingDate;
@override@HiveField(19)@JsonKey(name: "average_rating") final  int averageRating;
@override@HiveField(20)@JsonKey(name: "chapters_count") final  int chaptersCount;
@override@HiveField(21)@JsonKey(name: "is_bookmarked") final  bool isBookmarked;
@override@HiveField(22)@JsonKey(name: "bookmarked_count") final  int bookmarkedCount;
@override@HiveField(23)@JsonKey(name: "age_restriction") final  String ageRestriction;
@override@HiveField(24)@JsonKey(name: "release_status") final  BookStatus releaseStatus;
@override@HiveField(25)@JsonKey(name: "translation_status") final  BookStatus translationStatus;

/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaCopyWith<_Manga> get copyWith => __$MangaCopyWithImpl<_Manga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Manga&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._translators, _translators)&&(identical(other.id, id) || other.id == id)&&(identical(other.realLink, realLink) || other.realLink == realLink)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.isShowed, isShowed) || other.isShowed == isShowed)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.secondTitle, secondTitle) || other.secondTitle == secondTitle)&&(identical(other.showingDate, showingDate) || other.showingDate == showingDate)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.bookmarkedCount, bookmarkedCount) || other.bookmarkedCount == bookmarkedCount)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,slug,title,description,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_chapters),type,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_translators),id,realLink,likesCount,viewsCount,thumbnail,isShowed,updatedAt,createdAt,releaseYear,secondTitle,showingDate,averageRating,chaptersCount,isBookmarked,bookmarkedCount,ageRestriction,releaseStatus,translationStatus]);

@override
String toString() {
  return 'Manga(slug: $slug, title: $title, description: $description, genres: $genres, chapters: $chapters, type: $type, categories: $categories, translators: $translators, id: $id, realLink: $realLink, likesCount: $likesCount, viewsCount: $viewsCount, thumbnail: $thumbnail, isShowed: $isShowed, updatedAt: $updatedAt, createdAt: $createdAt, releaseYear: $releaseYear, secondTitle: $secondTitle, showingDate: $showingDate, averageRating: $averageRating, chaptersCount: $chaptersCount, isBookmarked: $isBookmarked, bookmarkedCount: $bookmarkedCount, ageRestriction: $ageRestriction, releaseStatus: $releaseStatus, translationStatus: $translationStatus)';
}


}

/// @nodoc
abstract mixin class _$MangaCopyWith<$Res> implements $MangaCopyWith<$Res> {
  factory _$MangaCopyWith(_Manga value, $Res Function(_Manga) _then) = __$MangaCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String slug,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) List<ManoGenre> genres,@HiveField(4) List<ManoChapter> chapters,@HiveField(5) MediaType type,@HiveField(6) List<ManoCategory> categories,@HiveField(7) List<ManoTranslator> translators,@HiveField(8)@JsonKey(name: "manga_id") String id,@HiveField(9)@JsonKey(name: "real_link") String realLink,@HiveField(10)@JsonKey(name: "likes_count") int likesCount,@HiveField(11)@JsonKey(name: "views_count") int viewsCount,@HiveField(12)@JsonKey(name: "image_url") String thumbnail,@HiveField(13)@JsonKey(name: "is_showed") bool isShowed,@HiveField(14)@JsonKey(name: "updated_at") String updatedAt,@HiveField(15)@JsonKey(name: "created_at") String createdAt,@HiveField(16)@JsonKey(name: "release_year") int releaseYear,@HiveField(17)@JsonKey(name: "second_title") String secondTitle,@HiveField(18)@JsonKey(name: "showing_date") String showingDate,@HiveField(19)@JsonKey(name: "average_rating") int averageRating,@HiveField(20)@JsonKey(name: "chapters_count") int chaptersCount,@HiveField(21)@JsonKey(name: "is_bookmarked") bool isBookmarked,@HiveField(22)@JsonKey(name: "bookmarked_count") int bookmarkedCount,@HiveField(23)@JsonKey(name: "age_restriction") String ageRestriction,@HiveField(24)@JsonKey(name: "release_status") BookStatus releaseStatus,@HiveField(25)@JsonKey(name: "translation_status") BookStatus translationStatus
});




}
/// @nodoc
class __$MangaCopyWithImpl<$Res>
    implements _$MangaCopyWith<$Res> {
  __$MangaCopyWithImpl(this._self, this._then);

  final _Manga _self;
  final $Res Function(_Manga) _then;

/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? title = null,Object? description = null,Object? genres = null,Object? chapters = null,Object? type = null,Object? categories = null,Object? translators = null,Object? id = null,Object? realLink = null,Object? likesCount = null,Object? viewsCount = null,Object? thumbnail = null,Object? isShowed = null,Object? updatedAt = null,Object? createdAt = null,Object? releaseYear = null,Object? secondTitle = null,Object? showingDate = null,Object? averageRating = null,Object? chaptersCount = null,Object? isBookmarked = null,Object? bookmarkedCount = null,Object? ageRestriction = null,Object? releaseStatus = null,Object? translationStatus = null,}) {
  return _then(_Manga(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<ManoGenre>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ManoChapter>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ManoCategory>,translators: null == translators ? _self._translators : translators // ignore: cast_nullable_to_non_nullable
as List<ManoTranslator>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,realLink: null == realLink ? _self.realLink : realLink // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,isShowed: null == isShowed ? _self.isShowed : isShowed // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,secondTitle: null == secondTitle ? _self.secondTitle : secondTitle // ignore: cast_nullable_to_non_nullable
as String,showingDate: null == showingDate ? _self.showingDate : showingDate // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,bookmarkedCount: null == bookmarkedCount ? _self.bookmarkedCount : bookmarkedCount // ignore: cast_nullable_to_non_nullable
as int,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as String,releaseStatus: null == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,translationStatus: null == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,
  ));
}


}

// dart format on
