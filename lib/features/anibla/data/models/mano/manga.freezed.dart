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

@JsonKey(name: "manga_id") String get id; String get title; String get slug;@JsonKey(name: "image_url") String get thumbnail;@JsonKey(name: "second_title") String get secondTitle; String get description;@JsonKey(name: "age_restriction") String get ageRestriction;@JsonKey(name: "real_link") String get realLink;@JsonKey(name: "created_at") String get createdAt;@JsonKey(name: "updated_at") String get updatedAt;@JsonKey(name: "showing_date") String get showingDate; MediaType get type;@JsonKey(name: "release_status") MangaStatus get releaseStatus;@JsonKey(name: "translation_status") MangaStatus get translationStatus;@JsonKey(name: "likes_count") int get likesCount;@JsonKey(name: "views_count") int get viewsCount;@JsonKey(name: "average_rating") int get averageRating;@JsonKey(name: "release_year") int get releaseYear;@JsonKey(name: "chapters_count") int get chaptersCount;@JsonKey(name: "bookmarked_count") int get bookmarkedCount;@JsonKey(name: "is_bookmarked") bool get isBookmarked;@JsonKey(name: "is_showed") bool get isShowed; List<ManoTranslator> get translators; List<ManoGenre> get genres; List<ManoCategory> get categories; List<Chapter> get chapters;
/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaCopyWith<Manga> get copyWith => _$MangaCopyWithImpl<Manga>(this as Manga, _$identity);

  /// Serializes this Manga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Manga&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.secondTitle, secondTitle) || other.secondTitle == secondTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.realLink, realLink) || other.realLink == realLink)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.showingDate, showingDate) || other.showingDate == showingDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.bookmarkedCount, bookmarkedCount) || other.bookmarkedCount == bookmarkedCount)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.isShowed, isShowed) || other.isShowed == isShowed)&&const DeepCollectionEquality().equals(other.translators, translators)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.chapters, chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,slug,thumbnail,secondTitle,description,ageRestriction,realLink,createdAt,updatedAt,showingDate,type,releaseStatus,translationStatus,likesCount,viewsCount,averageRating,releaseYear,chaptersCount,bookmarkedCount,isBookmarked,isShowed,const DeepCollectionEquality().hash(translators),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(chapters)]);

@override
String toString() {
  return 'Manga(id: $id, title: $title, slug: $slug, thumbnail: $thumbnail, secondTitle: $secondTitle, description: $description, ageRestriction: $ageRestriction, realLink: $realLink, createdAt: $createdAt, updatedAt: $updatedAt, showingDate: $showingDate, type: $type, releaseStatus: $releaseStatus, translationStatus: $translationStatus, likesCount: $likesCount, viewsCount: $viewsCount, averageRating: $averageRating, releaseYear: $releaseYear, chaptersCount: $chaptersCount, bookmarkedCount: $bookmarkedCount, isBookmarked: $isBookmarked, isShowed: $isShowed, translators: $translators, genres: $genres, categories: $categories, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class $MangaCopyWith<$Res>  {
  factory $MangaCopyWith(Manga value, $Res Function(Manga) _then) = _$MangaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "manga_id") String id, String title, String slug,@JsonKey(name: "image_url") String thumbnail,@JsonKey(name: "second_title") String secondTitle, String description,@JsonKey(name: "age_restriction") String ageRestriction,@JsonKey(name: "real_link") String realLink,@JsonKey(name: "created_at") String createdAt,@JsonKey(name: "updated_at") String updatedAt,@JsonKey(name: "showing_date") String showingDate, MediaType type,@JsonKey(name: "release_status") MangaStatus releaseStatus,@JsonKey(name: "translation_status") MangaStatus translationStatus,@JsonKey(name: "likes_count") int likesCount,@JsonKey(name: "views_count") int viewsCount,@JsonKey(name: "average_rating") int averageRating,@JsonKey(name: "release_year") int releaseYear,@JsonKey(name: "chapters_count") int chaptersCount,@JsonKey(name: "bookmarked_count") int bookmarkedCount,@JsonKey(name: "is_bookmarked") bool isBookmarked,@JsonKey(name: "is_showed") bool isShowed, List<ManoTranslator> translators, List<ManoGenre> genres, List<ManoCategory> categories, List<Chapter> chapters
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? thumbnail = null,Object? secondTitle = null,Object? description = null,Object? ageRestriction = null,Object? realLink = null,Object? createdAt = null,Object? updatedAt = null,Object? showingDate = null,Object? type = null,Object? releaseStatus = null,Object? translationStatus = null,Object? likesCount = null,Object? viewsCount = null,Object? averageRating = null,Object? releaseYear = null,Object? chaptersCount = null,Object? bookmarkedCount = null,Object? isBookmarked = null,Object? isShowed = null,Object? translators = null,Object? genres = null,Object? categories = null,Object? chapters = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,secondTitle: null == secondTitle ? _self.secondTitle : secondTitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as String,realLink: null == realLink ? _self.realLink : realLink // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,showingDate: null == showingDate ? _self.showingDate : showingDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,releaseStatus: null == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as MangaStatus,translationStatus: null == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as MangaStatus,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,bookmarkedCount: null == bookmarkedCount ? _self.bookmarkedCount : bookmarkedCount // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,isShowed: null == isShowed ? _self.isShowed : isShowed // ignore: cast_nullable_to_non_nullable
as bool,translators: null == translators ? _self.translators : translators // ignore: cast_nullable_to_non_nullable
as List<ManoTranslator>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<ManoGenre>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ManoCategory>,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<Chapter>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "manga_id")  String id,  String title,  String slug, @JsonKey(name: "image_url")  String thumbnail, @JsonKey(name: "second_title")  String secondTitle,  String description, @JsonKey(name: "age_restriction")  String ageRestriction, @JsonKey(name: "real_link")  String realLink, @JsonKey(name: "created_at")  String createdAt, @JsonKey(name: "updated_at")  String updatedAt, @JsonKey(name: "showing_date")  String showingDate,  MediaType type, @JsonKey(name: "release_status")  MangaStatus releaseStatus, @JsonKey(name: "translation_status")  MangaStatus translationStatus, @JsonKey(name: "likes_count")  int likesCount, @JsonKey(name: "views_count")  int viewsCount, @JsonKey(name: "average_rating")  int averageRating, @JsonKey(name: "release_year")  int releaseYear, @JsonKey(name: "chapters_count")  int chaptersCount, @JsonKey(name: "bookmarked_count")  int bookmarkedCount, @JsonKey(name: "is_bookmarked")  bool isBookmarked, @JsonKey(name: "is_showed")  bool isShowed,  List<ManoTranslator> translators,  List<ManoGenre> genres,  List<ManoCategory> categories,  List<Chapter> chapters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.thumbnail,_that.secondTitle,_that.description,_that.ageRestriction,_that.realLink,_that.createdAt,_that.updatedAt,_that.showingDate,_that.type,_that.releaseStatus,_that.translationStatus,_that.likesCount,_that.viewsCount,_that.averageRating,_that.releaseYear,_that.chaptersCount,_that.bookmarkedCount,_that.isBookmarked,_that.isShowed,_that.translators,_that.genres,_that.categories,_that.chapters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "manga_id")  String id,  String title,  String slug, @JsonKey(name: "image_url")  String thumbnail, @JsonKey(name: "second_title")  String secondTitle,  String description, @JsonKey(name: "age_restriction")  String ageRestriction, @JsonKey(name: "real_link")  String realLink, @JsonKey(name: "created_at")  String createdAt, @JsonKey(name: "updated_at")  String updatedAt, @JsonKey(name: "showing_date")  String showingDate,  MediaType type, @JsonKey(name: "release_status")  MangaStatus releaseStatus, @JsonKey(name: "translation_status")  MangaStatus translationStatus, @JsonKey(name: "likes_count")  int likesCount, @JsonKey(name: "views_count")  int viewsCount, @JsonKey(name: "average_rating")  int averageRating, @JsonKey(name: "release_year")  int releaseYear, @JsonKey(name: "chapters_count")  int chaptersCount, @JsonKey(name: "bookmarked_count")  int bookmarkedCount, @JsonKey(name: "is_bookmarked")  bool isBookmarked, @JsonKey(name: "is_showed")  bool isShowed,  List<ManoTranslator> translators,  List<ManoGenre> genres,  List<ManoCategory> categories,  List<Chapter> chapters)  $default,) {final _that = this;
switch (_that) {
case _Manga():
return $default(_that.id,_that.title,_that.slug,_that.thumbnail,_that.secondTitle,_that.description,_that.ageRestriction,_that.realLink,_that.createdAt,_that.updatedAt,_that.showingDate,_that.type,_that.releaseStatus,_that.translationStatus,_that.likesCount,_that.viewsCount,_that.averageRating,_that.releaseYear,_that.chaptersCount,_that.bookmarkedCount,_that.isBookmarked,_that.isShowed,_that.translators,_that.genres,_that.categories,_that.chapters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "manga_id")  String id,  String title,  String slug, @JsonKey(name: "image_url")  String thumbnail, @JsonKey(name: "second_title")  String secondTitle,  String description, @JsonKey(name: "age_restriction")  String ageRestriction, @JsonKey(name: "real_link")  String realLink, @JsonKey(name: "created_at")  String createdAt, @JsonKey(name: "updated_at")  String updatedAt, @JsonKey(name: "showing_date")  String showingDate,  MediaType type, @JsonKey(name: "release_status")  MangaStatus releaseStatus, @JsonKey(name: "translation_status")  MangaStatus translationStatus, @JsonKey(name: "likes_count")  int likesCount, @JsonKey(name: "views_count")  int viewsCount, @JsonKey(name: "average_rating")  int averageRating, @JsonKey(name: "release_year")  int releaseYear, @JsonKey(name: "chapters_count")  int chaptersCount, @JsonKey(name: "bookmarked_count")  int bookmarkedCount, @JsonKey(name: "is_bookmarked")  bool isBookmarked, @JsonKey(name: "is_showed")  bool isShowed,  List<ManoTranslator> translators,  List<ManoGenre> genres,  List<ManoCategory> categories,  List<Chapter> chapters)?  $default,) {final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.thumbnail,_that.secondTitle,_that.description,_that.ageRestriction,_that.realLink,_that.createdAt,_that.updatedAt,_that.showingDate,_that.type,_that.releaseStatus,_that.translationStatus,_that.likesCount,_that.viewsCount,_that.averageRating,_that.releaseYear,_that.chaptersCount,_that.bookmarkedCount,_that.isBookmarked,_that.isShowed,_that.translators,_that.genres,_that.categories,_that.chapters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Manga implements Manga {
  const _Manga({@JsonKey(name: "manga_id") this.id = "", this.title = "", this.slug = "", @JsonKey(name: "image_url") this.thumbnail = "", @JsonKey(name: "second_title") this.secondTitle = "", this.description = "", @JsonKey(name: "age_restriction") this.ageRestriction = "", @JsonKey(name: "real_link") this.realLink = "", @JsonKey(name: "created_at") this.createdAt = "", @JsonKey(name: "updated_at") this.updatedAt = "", @JsonKey(name: "showing_date") this.showingDate = "", this.type = MediaType.manga, @JsonKey(name: "release_status") this.releaseStatus = MangaStatus.stopped, @JsonKey(name: "translation_status") this.translationStatus = MangaStatus.stopped, @JsonKey(name: "likes_count") this.likesCount = 0, @JsonKey(name: "views_count") this.viewsCount = 0, @JsonKey(name: "average_rating") this.averageRating = 0, @JsonKey(name: "release_year") this.releaseYear = 0, @JsonKey(name: "chapters_count") this.chaptersCount = 0, @JsonKey(name: "bookmarked_count") this.bookmarkedCount = 0, @JsonKey(name: "is_bookmarked") this.isBookmarked = false, @JsonKey(name: "is_showed") this.isShowed = false, final  List<ManoTranslator> translators = const [], final  List<ManoGenre> genres = const [], final  List<ManoCategory> categories = const [], final  List<Chapter> chapters = const []}): _translators = translators,_genres = genres,_categories = categories,_chapters = chapters;
  factory _Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

@override@JsonKey(name: "manga_id") final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String slug;
@override@JsonKey(name: "image_url") final  String thumbnail;
@override@JsonKey(name: "second_title") final  String secondTitle;
@override@JsonKey() final  String description;
@override@JsonKey(name: "age_restriction") final  String ageRestriction;
@override@JsonKey(name: "real_link") final  String realLink;
@override@JsonKey(name: "created_at") final  String createdAt;
@override@JsonKey(name: "updated_at") final  String updatedAt;
@override@JsonKey(name: "showing_date") final  String showingDate;
@override@JsonKey() final  MediaType type;
@override@JsonKey(name: "release_status") final  MangaStatus releaseStatus;
@override@JsonKey(name: "translation_status") final  MangaStatus translationStatus;
@override@JsonKey(name: "likes_count") final  int likesCount;
@override@JsonKey(name: "views_count") final  int viewsCount;
@override@JsonKey(name: "average_rating") final  int averageRating;
@override@JsonKey(name: "release_year") final  int releaseYear;
@override@JsonKey(name: "chapters_count") final  int chaptersCount;
@override@JsonKey(name: "bookmarked_count") final  int bookmarkedCount;
@override@JsonKey(name: "is_bookmarked") final  bool isBookmarked;
@override@JsonKey(name: "is_showed") final  bool isShowed;
 final  List<ManoTranslator> _translators;
@override@JsonKey() List<ManoTranslator> get translators {
  if (_translators is EqualUnmodifiableListView) return _translators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_translators);
}

 final  List<ManoGenre> _genres;
@override@JsonKey() List<ManoGenre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<ManoCategory> _categories;
@override@JsonKey() List<ManoCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<Chapter> _chapters;
@override@JsonKey() List<Chapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Manga&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.secondTitle, secondTitle) || other.secondTitle == secondTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.realLink, realLink) || other.realLink == realLink)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.showingDate, showingDate) || other.showingDate == showingDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.bookmarkedCount, bookmarkedCount) || other.bookmarkedCount == bookmarkedCount)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.isShowed, isShowed) || other.isShowed == isShowed)&&const DeepCollectionEquality().equals(other._translators, _translators)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._chapters, _chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,slug,thumbnail,secondTitle,description,ageRestriction,realLink,createdAt,updatedAt,showingDate,type,releaseStatus,translationStatus,likesCount,viewsCount,averageRating,releaseYear,chaptersCount,bookmarkedCount,isBookmarked,isShowed,const DeepCollectionEquality().hash(_translators),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_chapters)]);

@override
String toString() {
  return 'Manga(id: $id, title: $title, slug: $slug, thumbnail: $thumbnail, secondTitle: $secondTitle, description: $description, ageRestriction: $ageRestriction, realLink: $realLink, createdAt: $createdAt, updatedAt: $updatedAt, showingDate: $showingDate, type: $type, releaseStatus: $releaseStatus, translationStatus: $translationStatus, likesCount: $likesCount, viewsCount: $viewsCount, averageRating: $averageRating, releaseYear: $releaseYear, chaptersCount: $chaptersCount, bookmarkedCount: $bookmarkedCount, isBookmarked: $isBookmarked, isShowed: $isShowed, translators: $translators, genres: $genres, categories: $categories, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class _$MangaCopyWith<$Res> implements $MangaCopyWith<$Res> {
  factory _$MangaCopyWith(_Manga value, $Res Function(_Manga) _then) = __$MangaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "manga_id") String id, String title, String slug,@JsonKey(name: "image_url") String thumbnail,@JsonKey(name: "second_title") String secondTitle, String description,@JsonKey(name: "age_restriction") String ageRestriction,@JsonKey(name: "real_link") String realLink,@JsonKey(name: "created_at") String createdAt,@JsonKey(name: "updated_at") String updatedAt,@JsonKey(name: "showing_date") String showingDate, MediaType type,@JsonKey(name: "release_status") MangaStatus releaseStatus,@JsonKey(name: "translation_status") MangaStatus translationStatus,@JsonKey(name: "likes_count") int likesCount,@JsonKey(name: "views_count") int viewsCount,@JsonKey(name: "average_rating") int averageRating,@JsonKey(name: "release_year") int releaseYear,@JsonKey(name: "chapters_count") int chaptersCount,@JsonKey(name: "bookmarked_count") int bookmarkedCount,@JsonKey(name: "is_bookmarked") bool isBookmarked,@JsonKey(name: "is_showed") bool isShowed, List<ManoTranslator> translators, List<ManoGenre> genres, List<ManoCategory> categories, List<Chapter> chapters
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? thumbnail = null,Object? secondTitle = null,Object? description = null,Object? ageRestriction = null,Object? realLink = null,Object? createdAt = null,Object? updatedAt = null,Object? showingDate = null,Object? type = null,Object? releaseStatus = null,Object? translationStatus = null,Object? likesCount = null,Object? viewsCount = null,Object? averageRating = null,Object? releaseYear = null,Object? chaptersCount = null,Object? bookmarkedCount = null,Object? isBookmarked = null,Object? isShowed = null,Object? translators = null,Object? genres = null,Object? categories = null,Object? chapters = null,}) {
  return _then(_Manga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,secondTitle: null == secondTitle ? _self.secondTitle : secondTitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as String,realLink: null == realLink ? _self.realLink : realLink // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,showingDate: null == showingDate ? _self.showingDate : showingDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,releaseStatus: null == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as MangaStatus,translationStatus: null == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as MangaStatus,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,bookmarkedCount: null == bookmarkedCount ? _self.bookmarkedCount : bookmarkedCount // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,isShowed: null == isShowed ? _self.isShowed : isShowed // ignore: cast_nullable_to_non_nullable
as bool,translators: null == translators ? _self._translators : translators // ignore: cast_nullable_to_non_nullable
as List<ManoTranslator>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<ManoGenre>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ManoCategory>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<Chapter>,
  ));
}


}

// dart format on
