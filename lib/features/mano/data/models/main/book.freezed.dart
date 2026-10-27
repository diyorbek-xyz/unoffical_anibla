// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Book {

@HiveField(0) String get slug;@HiveField(1) String get title;@HiveField(2) String get description;@HiveField(3) List<ManoGenre> get genres;@HiveField(4) List<ManoChapter> get chapters;@HiveField(5) List<ManoCategory> get categories;@HiveField(6) List<ManoTranslator> get translators;@HiveField(7)@JsonKey(name: "likes_count") int get likesCount;@HiveField(8)@JsonKey(name: "views_count") int get viewsCount;@HiveField(9)@JsonKey(name: "release_year") int get releaseYear;@HiveField(10)@JsonKey(name: "average_rating") int get averageRating;@HiveField(11)@JsonKey(name: "chapters_count") int get chaptersCount;@HiveField(12)@JsonKey(name: "bookmarked_count") int get bookmarkedCount;@HiveField(13)@JsonKey(name: "is_showed") bool get isShowed;@HiveField(14)@JsonKey(name: "is_bookmarked") bool get isBookmarked;@HiveField(15) MediaType get type;@HiveField(26)@JsonKey(name: "is_comment_enabled") bool get isCommentEnabled;@HiveField(16) String get id;@HiveField(17)@JsonKey(name: "real_link") String get realLink;@HiveField(18)@JsonKey(name: "image_url") String get thumbnail;@HiveField(19)@JsonKey(name: "updated_at") String get updatedAt;@HiveField(20)@JsonKey(name: "created_at") String get createdAt;@HiveField(21)@JsonKey(name: "second_title") String get secondTitle;@HiveField(22)@JsonKey(name: "showing_date") String get showingDate;@HiveField(23)@JsonKey(name: "age_restriction") String get ageRestriction;@HiveField(24)@JsonKey(name: "release_status") BookStatus get releaseStatus;@HiveField(25)@JsonKey(name: "translation_status") BookStatus get translationStatus;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.translators, translators)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.bookmarkedCount, bookmarkedCount) || other.bookmarkedCount == bookmarkedCount)&&(identical(other.isShowed, isShowed) || other.isShowed == isShowed)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.type, type) || other.type == type)&&(identical(other.isCommentEnabled, isCommentEnabled) || other.isCommentEnabled == isCommentEnabled)&&(identical(other.id, id) || other.id == id)&&(identical(other.realLink, realLink) || other.realLink == realLink)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.secondTitle, secondTitle) || other.secondTitle == secondTitle)&&(identical(other.showingDate, showingDate) || other.showingDate == showingDate)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,slug,title,description,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(chapters),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(translators),likesCount,viewsCount,releaseYear,averageRating,chaptersCount,bookmarkedCount,isShowed,isBookmarked,type,isCommentEnabled,id,realLink,thumbnail,updatedAt,createdAt,secondTitle,showingDate,ageRestriction,releaseStatus,translationStatus]);

@override
String toString() {
  return 'Book(slug: $slug, title: $title, description: $description, genres: $genres, chapters: $chapters, categories: $categories, translators: $translators, likesCount: $likesCount, viewsCount: $viewsCount, releaseYear: $releaseYear, averageRating: $averageRating, chaptersCount: $chaptersCount, bookmarkedCount: $bookmarkedCount, isShowed: $isShowed, isBookmarked: $isBookmarked, type: $type, isCommentEnabled: $isCommentEnabled, id: $id, realLink: $realLink, thumbnail: $thumbnail, updatedAt: $updatedAt, createdAt: $createdAt, secondTitle: $secondTitle, showingDate: $showingDate, ageRestriction: $ageRestriction, releaseStatus: $releaseStatus, translationStatus: $translationStatus)';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String slug,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) List<ManoGenre> genres,@HiveField(4) List<ManoChapter> chapters,@HiveField(5) List<ManoCategory> categories,@HiveField(6) List<ManoTranslator> translators,@HiveField(7)@JsonKey(name: "likes_count") int likesCount,@HiveField(8)@JsonKey(name: "views_count") int viewsCount,@HiveField(9)@JsonKey(name: "release_year") int releaseYear,@HiveField(10)@JsonKey(name: "average_rating") int averageRating,@HiveField(11)@JsonKey(name: "chapters_count") int chaptersCount,@HiveField(12)@JsonKey(name: "bookmarked_count") int bookmarkedCount,@HiveField(13)@JsonKey(name: "is_showed") bool isShowed,@HiveField(14)@JsonKey(name: "is_bookmarked") bool isBookmarked,@HiveField(15) MediaType type,@HiveField(26)@JsonKey(name: "is_comment_enabled") bool isCommentEnabled,@HiveField(16) String id,@HiveField(17)@JsonKey(name: "real_link") String realLink,@HiveField(18)@JsonKey(name: "image_url") String thumbnail,@HiveField(19)@JsonKey(name: "updated_at") String updatedAt,@HiveField(20)@JsonKey(name: "created_at") String createdAt,@HiveField(21)@JsonKey(name: "second_title") String secondTitle,@HiveField(22)@JsonKey(name: "showing_date") String showingDate,@HiveField(23)@JsonKey(name: "age_restriction") String ageRestriction,@HiveField(24)@JsonKey(name: "release_status") BookStatus releaseStatus,@HiveField(25)@JsonKey(name: "translation_status") BookStatus translationStatus
});




}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? title = null,Object? description = null,Object? genres = null,Object? chapters = null,Object? categories = null,Object? translators = null,Object? likesCount = null,Object? viewsCount = null,Object? releaseYear = null,Object? averageRating = null,Object? chaptersCount = null,Object? bookmarkedCount = null,Object? isShowed = null,Object? isBookmarked = null,Object? type = null,Object? isCommentEnabled = null,Object? id = null,Object? realLink = null,Object? thumbnail = null,Object? updatedAt = null,Object? createdAt = null,Object? secondTitle = null,Object? showingDate = null,Object? ageRestriction = null,Object? releaseStatus = null,Object? translationStatus = null,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<ManoGenre>,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ManoChapter>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ManoCategory>,translators: null == translators ? _self.translators : translators // ignore: cast_nullable_to_non_nullable
as List<ManoTranslator>,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,bookmarkedCount: null == bookmarkedCount ? _self.bookmarkedCount : bookmarkedCount // ignore: cast_nullable_to_non_nullable
as int,isShowed: null == isShowed ? _self.isShowed : isShowed // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,isCommentEnabled: null == isCommentEnabled ? _self.isCommentEnabled : isCommentEnabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,realLink: null == realLink ? _self.realLink : realLink // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,secondTitle: null == secondTitle ? _self.secondTitle : secondTitle // ignore: cast_nullable_to_non_nullable
as String,showingDate: null == showingDate ? _self.showingDate : showingDate // ignore: cast_nullable_to_non_nullable
as String,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as String,releaseStatus: null == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,translationStatus: null == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Book].
extension BookPatterns on Book {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Book value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Book value)  $default,){
final _that = this;
switch (_that) {
case _Book():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Book value)?  $default,){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String slug, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  List<ManoGenre> genres, @HiveField(4)  List<ManoChapter> chapters, @HiveField(5)  List<ManoCategory> categories, @HiveField(6)  List<ManoTranslator> translators, @HiveField(7)@JsonKey(name: "likes_count")  int likesCount, @HiveField(8)@JsonKey(name: "views_count")  int viewsCount, @HiveField(9)@JsonKey(name: "release_year")  int releaseYear, @HiveField(10)@JsonKey(name: "average_rating")  int averageRating, @HiveField(11)@JsonKey(name: "chapters_count")  int chaptersCount, @HiveField(12)@JsonKey(name: "bookmarked_count")  int bookmarkedCount, @HiveField(13)@JsonKey(name: "is_showed")  bool isShowed, @HiveField(14)@JsonKey(name: "is_bookmarked")  bool isBookmarked, @HiveField(15)  MediaType type, @HiveField(26)@JsonKey(name: "is_comment_enabled")  bool isCommentEnabled, @HiveField(16)  String id, @HiveField(17)@JsonKey(name: "real_link")  String realLink, @HiveField(18)@JsonKey(name: "image_url")  String thumbnail, @HiveField(19)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(20)@JsonKey(name: "created_at")  String createdAt, @HiveField(21)@JsonKey(name: "second_title")  String secondTitle, @HiveField(22)@JsonKey(name: "showing_date")  String showingDate, @HiveField(23)@JsonKey(name: "age_restriction")  String ageRestriction, @HiveField(24)@JsonKey(name: "release_status")  BookStatus releaseStatus, @HiveField(25)@JsonKey(name: "translation_status")  BookStatus translationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.slug,_that.title,_that.description,_that.genres,_that.chapters,_that.categories,_that.translators,_that.likesCount,_that.viewsCount,_that.releaseYear,_that.averageRating,_that.chaptersCount,_that.bookmarkedCount,_that.isShowed,_that.isBookmarked,_that.type,_that.isCommentEnabled,_that.id,_that.realLink,_that.thumbnail,_that.updatedAt,_that.createdAt,_that.secondTitle,_that.showingDate,_that.ageRestriction,_that.releaseStatus,_that.translationStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String slug, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  List<ManoGenre> genres, @HiveField(4)  List<ManoChapter> chapters, @HiveField(5)  List<ManoCategory> categories, @HiveField(6)  List<ManoTranslator> translators, @HiveField(7)@JsonKey(name: "likes_count")  int likesCount, @HiveField(8)@JsonKey(name: "views_count")  int viewsCount, @HiveField(9)@JsonKey(name: "release_year")  int releaseYear, @HiveField(10)@JsonKey(name: "average_rating")  int averageRating, @HiveField(11)@JsonKey(name: "chapters_count")  int chaptersCount, @HiveField(12)@JsonKey(name: "bookmarked_count")  int bookmarkedCount, @HiveField(13)@JsonKey(name: "is_showed")  bool isShowed, @HiveField(14)@JsonKey(name: "is_bookmarked")  bool isBookmarked, @HiveField(15)  MediaType type, @HiveField(26)@JsonKey(name: "is_comment_enabled")  bool isCommentEnabled, @HiveField(16)  String id, @HiveField(17)@JsonKey(name: "real_link")  String realLink, @HiveField(18)@JsonKey(name: "image_url")  String thumbnail, @HiveField(19)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(20)@JsonKey(name: "created_at")  String createdAt, @HiveField(21)@JsonKey(name: "second_title")  String secondTitle, @HiveField(22)@JsonKey(name: "showing_date")  String showingDate, @HiveField(23)@JsonKey(name: "age_restriction")  String ageRestriction, @HiveField(24)@JsonKey(name: "release_status")  BookStatus releaseStatus, @HiveField(25)@JsonKey(name: "translation_status")  BookStatus translationStatus)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.slug,_that.title,_that.description,_that.genres,_that.chapters,_that.categories,_that.translators,_that.likesCount,_that.viewsCount,_that.releaseYear,_that.averageRating,_that.chaptersCount,_that.bookmarkedCount,_that.isShowed,_that.isBookmarked,_that.type,_that.isCommentEnabled,_that.id,_that.realLink,_that.thumbnail,_that.updatedAt,_that.createdAt,_that.secondTitle,_that.showingDate,_that.ageRestriction,_that.releaseStatus,_that.translationStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String slug, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  List<ManoGenre> genres, @HiveField(4)  List<ManoChapter> chapters, @HiveField(5)  List<ManoCategory> categories, @HiveField(6)  List<ManoTranslator> translators, @HiveField(7)@JsonKey(name: "likes_count")  int likesCount, @HiveField(8)@JsonKey(name: "views_count")  int viewsCount, @HiveField(9)@JsonKey(name: "release_year")  int releaseYear, @HiveField(10)@JsonKey(name: "average_rating")  int averageRating, @HiveField(11)@JsonKey(name: "chapters_count")  int chaptersCount, @HiveField(12)@JsonKey(name: "bookmarked_count")  int bookmarkedCount, @HiveField(13)@JsonKey(name: "is_showed")  bool isShowed, @HiveField(14)@JsonKey(name: "is_bookmarked")  bool isBookmarked, @HiveField(15)  MediaType type, @HiveField(26)@JsonKey(name: "is_comment_enabled")  bool isCommentEnabled, @HiveField(16)  String id, @HiveField(17)@JsonKey(name: "real_link")  String realLink, @HiveField(18)@JsonKey(name: "image_url")  String thumbnail, @HiveField(19)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(20)@JsonKey(name: "created_at")  String createdAt, @HiveField(21)@JsonKey(name: "second_title")  String secondTitle, @HiveField(22)@JsonKey(name: "showing_date")  String showingDate, @HiveField(23)@JsonKey(name: "age_restriction")  String ageRestriction, @HiveField(24)@JsonKey(name: "release_status")  BookStatus releaseStatus, @HiveField(25)@JsonKey(name: "translation_status")  BookStatus translationStatus)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.slug,_that.title,_that.description,_that.genres,_that.chapters,_that.categories,_that.translators,_that.likesCount,_that.viewsCount,_that.releaseYear,_that.averageRating,_that.chaptersCount,_that.bookmarkedCount,_that.isShowed,_that.isBookmarked,_that.type,_that.isCommentEnabled,_that.id,_that.realLink,_that.thumbnail,_that.updatedAt,_that.createdAt,_that.secondTitle,_that.showingDate,_that.ageRestriction,_that.releaseStatus,_that.translationStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Book implements Book {
  const _Book({@HiveField(0) this.slug = "", @HiveField(1) this.title = "", @HiveField(2) this.description = "", @HiveField(3) final  List<ManoGenre> genres = const [], @HiveField(4) final  List<ManoChapter> chapters = const [], @HiveField(5) final  List<ManoCategory> categories = const [], @HiveField(6) final  List<ManoTranslator> translators = const [], @HiveField(7)@JsonKey(name: "likes_count") this.likesCount = 0, @HiveField(8)@JsonKey(name: "views_count") this.viewsCount = 0, @HiveField(9)@JsonKey(name: "release_year") this.releaseYear = 0, @HiveField(10)@JsonKey(name: "average_rating") this.averageRating = 0, @HiveField(11)@JsonKey(name: "chapters_count") this.chaptersCount = 0, @HiveField(12)@JsonKey(name: "bookmarked_count") this.bookmarkedCount = 0, @HiveField(13)@JsonKey(name: "is_showed") this.isShowed = false, @HiveField(14)@JsonKey(name: "is_bookmarked") this.isBookmarked = false, @HiveField(15) this.type = MediaType.novel, @HiveField(26)@JsonKey(name: "is_comment_enabled") this.isCommentEnabled = false, @HiveField(16) this.id = "", @HiveField(17)@JsonKey(name: "real_link") this.realLink = "", @HiveField(18)@JsonKey(name: "image_url") this.thumbnail = "", @HiveField(19)@JsonKey(name: "updated_at") this.updatedAt = "", @HiveField(20)@JsonKey(name: "created_at") this.createdAt = "", @HiveField(21)@JsonKey(name: "second_title") this.secondTitle = "", @HiveField(22)@JsonKey(name: "showing_date") this.showingDate = "", @HiveField(23)@JsonKey(name: "age_restriction") this.ageRestriction = "", @HiveField(24)@JsonKey(name: "release_status") this.releaseStatus = BookStatus.stopped, @HiveField(25)@JsonKey(name: "translation_status") this.translationStatus = BookStatus.stopped}): _genres = genres,_chapters = chapters,_categories = categories,_translators = translators;
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

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

 final  List<ManoCategory> _categories;
@override@JsonKey()@HiveField(5) List<ManoCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<ManoTranslator> _translators;
@override@JsonKey()@HiveField(6) List<ManoTranslator> get translators {
  if (_translators is EqualUnmodifiableListView) return _translators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_translators);
}

@override@HiveField(7)@JsonKey(name: "likes_count") final  int likesCount;
@override@HiveField(8)@JsonKey(name: "views_count") final  int viewsCount;
@override@HiveField(9)@JsonKey(name: "release_year") final  int releaseYear;
@override@HiveField(10)@JsonKey(name: "average_rating") final  int averageRating;
@override@HiveField(11)@JsonKey(name: "chapters_count") final  int chaptersCount;
@override@HiveField(12)@JsonKey(name: "bookmarked_count") final  int bookmarkedCount;
@override@HiveField(13)@JsonKey(name: "is_showed") final  bool isShowed;
@override@HiveField(14)@JsonKey(name: "is_bookmarked") final  bool isBookmarked;
@override@JsonKey()@HiveField(15) final  MediaType type;
@override@HiveField(26)@JsonKey(name: "is_comment_enabled") final  bool isCommentEnabled;
@override@JsonKey()@HiveField(16) final  String id;
@override@HiveField(17)@JsonKey(name: "real_link") final  String realLink;
@override@HiveField(18)@JsonKey(name: "image_url") final  String thumbnail;
@override@HiveField(19)@JsonKey(name: "updated_at") final  String updatedAt;
@override@HiveField(20)@JsonKey(name: "created_at") final  String createdAt;
@override@HiveField(21)@JsonKey(name: "second_title") final  String secondTitle;
@override@HiveField(22)@JsonKey(name: "showing_date") final  String showingDate;
@override@HiveField(23)@JsonKey(name: "age_restriction") final  String ageRestriction;
@override@HiveField(24)@JsonKey(name: "release_status") final  BookStatus releaseStatus;
@override@HiveField(25)@JsonKey(name: "translation_status") final  BookStatus translationStatus;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._translators, _translators)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.bookmarkedCount, bookmarkedCount) || other.bookmarkedCount == bookmarkedCount)&&(identical(other.isShowed, isShowed) || other.isShowed == isShowed)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.type, type) || other.type == type)&&(identical(other.isCommentEnabled, isCommentEnabled) || other.isCommentEnabled == isCommentEnabled)&&(identical(other.id, id) || other.id == id)&&(identical(other.realLink, realLink) || other.realLink == realLink)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.secondTitle, secondTitle) || other.secondTitle == secondTitle)&&(identical(other.showingDate, showingDate) || other.showingDate == showingDate)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,slug,title,description,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_chapters),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_translators),likesCount,viewsCount,releaseYear,averageRating,chaptersCount,bookmarkedCount,isShowed,isBookmarked,type,isCommentEnabled,id,realLink,thumbnail,updatedAt,createdAt,secondTitle,showingDate,ageRestriction,releaseStatus,translationStatus]);

@override
String toString() {
  return 'Book(slug: $slug, title: $title, description: $description, genres: $genres, chapters: $chapters, categories: $categories, translators: $translators, likesCount: $likesCount, viewsCount: $viewsCount, releaseYear: $releaseYear, averageRating: $averageRating, chaptersCount: $chaptersCount, bookmarkedCount: $bookmarkedCount, isShowed: $isShowed, isBookmarked: $isBookmarked, type: $type, isCommentEnabled: $isCommentEnabled, id: $id, realLink: $realLink, thumbnail: $thumbnail, updatedAt: $updatedAt, createdAt: $createdAt, secondTitle: $secondTitle, showingDate: $showingDate, ageRestriction: $ageRestriction, releaseStatus: $releaseStatus, translationStatus: $translationStatus)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String slug,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) List<ManoGenre> genres,@HiveField(4) List<ManoChapter> chapters,@HiveField(5) List<ManoCategory> categories,@HiveField(6) List<ManoTranslator> translators,@HiveField(7)@JsonKey(name: "likes_count") int likesCount,@HiveField(8)@JsonKey(name: "views_count") int viewsCount,@HiveField(9)@JsonKey(name: "release_year") int releaseYear,@HiveField(10)@JsonKey(name: "average_rating") int averageRating,@HiveField(11)@JsonKey(name: "chapters_count") int chaptersCount,@HiveField(12)@JsonKey(name: "bookmarked_count") int bookmarkedCount,@HiveField(13)@JsonKey(name: "is_showed") bool isShowed,@HiveField(14)@JsonKey(name: "is_bookmarked") bool isBookmarked,@HiveField(15) MediaType type,@HiveField(26)@JsonKey(name: "is_comment_enabled") bool isCommentEnabled,@HiveField(16) String id,@HiveField(17)@JsonKey(name: "real_link") String realLink,@HiveField(18)@JsonKey(name: "image_url") String thumbnail,@HiveField(19)@JsonKey(name: "updated_at") String updatedAt,@HiveField(20)@JsonKey(name: "created_at") String createdAt,@HiveField(21)@JsonKey(name: "second_title") String secondTitle,@HiveField(22)@JsonKey(name: "showing_date") String showingDate,@HiveField(23)@JsonKey(name: "age_restriction") String ageRestriction,@HiveField(24)@JsonKey(name: "release_status") BookStatus releaseStatus,@HiveField(25)@JsonKey(name: "translation_status") BookStatus translationStatus
});




}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? title = null,Object? description = null,Object? genres = null,Object? chapters = null,Object? categories = null,Object? translators = null,Object? likesCount = null,Object? viewsCount = null,Object? releaseYear = null,Object? averageRating = null,Object? chaptersCount = null,Object? bookmarkedCount = null,Object? isShowed = null,Object? isBookmarked = null,Object? type = null,Object? isCommentEnabled = null,Object? id = null,Object? realLink = null,Object? thumbnail = null,Object? updatedAt = null,Object? createdAt = null,Object? secondTitle = null,Object? showingDate = null,Object? ageRestriction = null,Object? releaseStatus = null,Object? translationStatus = null,}) {
  return _then(_Book(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<ManoGenre>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ManoChapter>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ManoCategory>,translators: null == translators ? _self._translators : translators // ignore: cast_nullable_to_non_nullable
as List<ManoTranslator>,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,bookmarkedCount: null == bookmarkedCount ? _self.bookmarkedCount : bookmarkedCount // ignore: cast_nullable_to_non_nullable
as int,isShowed: null == isShowed ? _self.isShowed : isShowed // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,isCommentEnabled: null == isCommentEnabled ? _self.isCommentEnabled : isCommentEnabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,realLink: null == realLink ? _self.realLink : realLink // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,secondTitle: null == secondTitle ? _self.secondTitle : secondTitle // ignore: cast_nullable_to_non_nullable
as String,showingDate: null == showingDate ? _self.showingDate : showingDate // ignore: cast_nullable_to_non_nullable
as String,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as String,releaseStatus: null == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,translationStatus: null == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as BookStatus,
  ));
}


}

// dart format on
