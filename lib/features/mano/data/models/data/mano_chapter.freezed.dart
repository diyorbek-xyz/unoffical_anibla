// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoChapter {

@HiveField(0)@JsonKey(name: "chapter_id") String get id;@HiveField(1)@JsonKey(name: "chapter_number") int get chapterNumber;@HiveField(2)@JsonKey(name: "release_date") String get releaseDate;@HiveField(3)@JsonKey(name: "views_count") int get viewsCount;@HiveField(4)@JsonKey(name: "likes_count") int get likesCount;@HiveField(5)@JsonKey(name: "is_read") bool get isRead;@HiveField(6)@JsonKey(name: "is_liked") bool get isLiked;@HiveField(7)@JsonKey(name: "is_free") bool get isFree;@HiveField(8)@JsonKey(name: "pages") List<ChapterPage> get pages;@HiveField(9)@JsonKey(name: "title") String get title;
/// Create a copy of ManoChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoChapterCopyWith<ManoChapter> get copyWith => _$ManoChapterCopyWithImpl<ManoChapter>(this as ManoChapter, _$identity);

  /// Serializes this ManoChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterNumber, chapterNumber) || other.chapterNumber == chapterNumber)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterNumber,releaseDate,viewsCount,likesCount,isRead,isLiked,isFree,const DeepCollectionEquality().hash(pages),title);

@override
String toString() {
  return 'ManoChapter(id: $id, chapterNumber: $chapterNumber, releaseDate: $releaseDate, viewsCount: $viewsCount, likesCount: $likesCount, isRead: $isRead, isLiked: $isLiked, isFree: $isFree, pages: $pages, title: $title)';
}


}

/// @nodoc
abstract mixin class $ManoChapterCopyWith<$Res>  {
  factory $ManoChapterCopyWith(ManoChapter value, $Res Function(ManoChapter) _then) = _$ManoChapterCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "chapter_id") String id,@HiveField(1)@JsonKey(name: "chapter_number") int chapterNumber,@HiveField(2)@JsonKey(name: "release_date") String releaseDate,@HiveField(3)@JsonKey(name: "views_count") int viewsCount,@HiveField(4)@JsonKey(name: "likes_count") int likesCount,@HiveField(5)@JsonKey(name: "is_read") bool isRead,@HiveField(6)@JsonKey(name: "is_liked") bool isLiked,@HiveField(7)@JsonKey(name: "is_free") bool isFree,@HiveField(8)@JsonKey(name: "pages") List<ChapterPage> pages,@HiveField(9)@JsonKey(name: "title") String title
});




}
/// @nodoc
class _$ManoChapterCopyWithImpl<$Res>
    implements $ManoChapterCopyWith<$Res> {
  _$ManoChapterCopyWithImpl(this._self, this._then);

  final ManoChapter _self;
  final $Res Function(ManoChapter) _then;

/// Create a copy of ManoChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterNumber = null,Object? releaseDate = null,Object? viewsCount = null,Object? likesCount = null,Object? isRead = null,Object? isLiked = null,Object? isFree = null,Object? pages = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _self.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<ChapterPage>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoChapter].
extension ManoChapterPatterns on ManoChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoChapter value)  $default,){
final _that = this;
switch (_that) {
case _ManoChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoChapter value)?  $default,){
final _that = this;
switch (_that) {
case _ManoChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "chapter_id")  String id, @HiveField(1)@JsonKey(name: "chapter_number")  int chapterNumber, @HiveField(2)@JsonKey(name: "release_date")  String releaseDate, @HiveField(3)@JsonKey(name: "views_count")  int viewsCount, @HiveField(4)@JsonKey(name: "likes_count")  int likesCount, @HiveField(5)@JsonKey(name: "is_read")  bool isRead, @HiveField(6)@JsonKey(name: "is_liked")  bool isLiked, @HiveField(7)@JsonKey(name: "is_free")  bool isFree, @HiveField(8)@JsonKey(name: "pages")  List<ChapterPage> pages, @HiveField(9)@JsonKey(name: "title")  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoChapter() when $default != null:
return $default(_that.id,_that.chapterNumber,_that.releaseDate,_that.viewsCount,_that.likesCount,_that.isRead,_that.isLiked,_that.isFree,_that.pages,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "chapter_id")  String id, @HiveField(1)@JsonKey(name: "chapter_number")  int chapterNumber, @HiveField(2)@JsonKey(name: "release_date")  String releaseDate, @HiveField(3)@JsonKey(name: "views_count")  int viewsCount, @HiveField(4)@JsonKey(name: "likes_count")  int likesCount, @HiveField(5)@JsonKey(name: "is_read")  bool isRead, @HiveField(6)@JsonKey(name: "is_liked")  bool isLiked, @HiveField(7)@JsonKey(name: "is_free")  bool isFree, @HiveField(8)@JsonKey(name: "pages")  List<ChapterPage> pages, @HiveField(9)@JsonKey(name: "title")  String title)  $default,) {final _that = this;
switch (_that) {
case _ManoChapter():
return $default(_that.id,_that.chapterNumber,_that.releaseDate,_that.viewsCount,_that.likesCount,_that.isRead,_that.isLiked,_that.isFree,_that.pages,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "chapter_id")  String id, @HiveField(1)@JsonKey(name: "chapter_number")  int chapterNumber, @HiveField(2)@JsonKey(name: "release_date")  String releaseDate, @HiveField(3)@JsonKey(name: "views_count")  int viewsCount, @HiveField(4)@JsonKey(name: "likes_count")  int likesCount, @HiveField(5)@JsonKey(name: "is_read")  bool isRead, @HiveField(6)@JsonKey(name: "is_liked")  bool isLiked, @HiveField(7)@JsonKey(name: "is_free")  bool isFree, @HiveField(8)@JsonKey(name: "pages")  List<ChapterPage> pages, @HiveField(9)@JsonKey(name: "title")  String title)?  $default,) {final _that = this;
switch (_that) {
case _ManoChapter() when $default != null:
return $default(_that.id,_that.chapterNumber,_that.releaseDate,_that.viewsCount,_that.likesCount,_that.isRead,_that.isLiked,_that.isFree,_that.pages,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoChapter implements ManoChapter {
  const _ManoChapter({@HiveField(0)@JsonKey(name: "chapter_id") this.id = "", @HiveField(1)@JsonKey(name: "chapter_number") this.chapterNumber = 0, @HiveField(2)@JsonKey(name: "release_date") this.releaseDate = "", @HiveField(3)@JsonKey(name: "views_count") this.viewsCount = 0, @HiveField(4)@JsonKey(name: "likes_count") this.likesCount = 0, @HiveField(5)@JsonKey(name: "is_read") this.isRead = false, @HiveField(6)@JsonKey(name: "is_liked") this.isLiked = false, @HiveField(7)@JsonKey(name: "is_free") this.isFree = false, @HiveField(8)@JsonKey(name: "pages") final  List<ChapterPage> pages = const [], @HiveField(9)@JsonKey(name: "title") this.title = ""}): _pages = pages;
  factory _ManoChapter.fromJson(Map<String, dynamic> json) => _$ManoChapterFromJson(json);

@override@HiveField(0)@JsonKey(name: "chapter_id") final  String id;
@override@HiveField(1)@JsonKey(name: "chapter_number") final  int chapterNumber;
@override@HiveField(2)@JsonKey(name: "release_date") final  String releaseDate;
@override@HiveField(3)@JsonKey(name: "views_count") final  int viewsCount;
@override@HiveField(4)@JsonKey(name: "likes_count") final  int likesCount;
@override@HiveField(5)@JsonKey(name: "is_read") final  bool isRead;
@override@HiveField(6)@JsonKey(name: "is_liked") final  bool isLiked;
@override@HiveField(7)@JsonKey(name: "is_free") final  bool isFree;
 final  List<ChapterPage> _pages;
@override@HiveField(8)@JsonKey(name: "pages") List<ChapterPage> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override@HiveField(9)@JsonKey(name: "title") final  String title;

/// Create a copy of ManoChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoChapterCopyWith<_ManoChapter> get copyWith => __$ManoChapterCopyWithImpl<_ManoChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterNumber, chapterNumber) || other.chapterNumber == chapterNumber)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterNumber,releaseDate,viewsCount,likesCount,isRead,isLiked,isFree,const DeepCollectionEquality().hash(_pages),title);

@override
String toString() {
  return 'ManoChapter(id: $id, chapterNumber: $chapterNumber, releaseDate: $releaseDate, viewsCount: $viewsCount, likesCount: $likesCount, isRead: $isRead, isLiked: $isLiked, isFree: $isFree, pages: $pages, title: $title)';
}


}

/// @nodoc
abstract mixin class _$ManoChapterCopyWith<$Res> implements $ManoChapterCopyWith<$Res> {
  factory _$ManoChapterCopyWith(_ManoChapter value, $Res Function(_ManoChapter) _then) = __$ManoChapterCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "chapter_id") String id,@HiveField(1)@JsonKey(name: "chapter_number") int chapterNumber,@HiveField(2)@JsonKey(name: "release_date") String releaseDate,@HiveField(3)@JsonKey(name: "views_count") int viewsCount,@HiveField(4)@JsonKey(name: "likes_count") int likesCount,@HiveField(5)@JsonKey(name: "is_read") bool isRead,@HiveField(6)@JsonKey(name: "is_liked") bool isLiked,@HiveField(7)@JsonKey(name: "is_free") bool isFree,@HiveField(8)@JsonKey(name: "pages") List<ChapterPage> pages,@HiveField(9)@JsonKey(name: "title") String title
});




}
/// @nodoc
class __$ManoChapterCopyWithImpl<$Res>
    implements _$ManoChapterCopyWith<$Res> {
  __$ManoChapterCopyWithImpl(this._self, this._then);

  final _ManoChapter _self;
  final $Res Function(_ManoChapter) _then;

/// Create a copy of ManoChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chapterNumber = null,Object? releaseDate = null,Object? viewsCount = null,Object? likesCount = null,Object? isRead = null,Object? isLiked = null,Object? isFree = null,Object? pages = null,Object? title = null,}) {
  return _then(_ManoChapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _self.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<ChapterPage>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
