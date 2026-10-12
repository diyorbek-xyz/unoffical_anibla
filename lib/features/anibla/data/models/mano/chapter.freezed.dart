// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chapter {

@JsonKey(name: "chapter_id") String get id;@JsonKey(name: "chapter_number") int get chapterNumber;@JsonKey(name: "release_date") String get releaseDate;@JsonKey(name: "views_count") int get viewsCount;@JsonKey(name: "likes_count") int get likesCount;@JsonKey(name: "is_read") bool get isRead;@JsonKey(name: "is_liked") bool get isLiked;@JsonKey(name: "is_free") bool get isFree;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterNumber, chapterNumber) || other.chapterNumber == chapterNumber)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isFree, isFree) || other.isFree == isFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterNumber,releaseDate,viewsCount,likesCount,isRead,isLiked,isFree);

@override
String toString() {
  return 'Chapter(id: $id, chapterNumber: $chapterNumber, releaseDate: $releaseDate, viewsCount: $viewsCount, likesCount: $likesCount, isRead: $isRead, isLiked: $isLiked, isFree: $isFree)';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "chapter_id") String id,@JsonKey(name: "chapter_number") int chapterNumber,@JsonKey(name: "release_date") String releaseDate,@JsonKey(name: "views_count") int viewsCount,@JsonKey(name: "likes_count") int likesCount,@JsonKey(name: "is_read") bool isRead,@JsonKey(name: "is_liked") bool isLiked,@JsonKey(name: "is_free") bool isFree
});




}
/// @nodoc
class _$ChapterCopyWithImpl<$Res>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterNumber = null,Object? releaseDate = null,Object? viewsCount = null,Object? likesCount = null,Object? isRead = null,Object? isLiked = null,Object? isFree = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _self.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Chapter].
extension ChapterPatterns on Chapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chapter value)  $default,){
final _that = this;
switch (_that) {
case _Chapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chapter value)?  $default,){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "chapter_id")  String id, @JsonKey(name: "chapter_number")  int chapterNumber, @JsonKey(name: "release_date")  String releaseDate, @JsonKey(name: "views_count")  int viewsCount, @JsonKey(name: "likes_count")  int likesCount, @JsonKey(name: "is_read")  bool isRead, @JsonKey(name: "is_liked")  bool isLiked, @JsonKey(name: "is_free")  bool isFree)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.chapterNumber,_that.releaseDate,_that.viewsCount,_that.likesCount,_that.isRead,_that.isLiked,_that.isFree);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "chapter_id")  String id, @JsonKey(name: "chapter_number")  int chapterNumber, @JsonKey(name: "release_date")  String releaseDate, @JsonKey(name: "views_count")  int viewsCount, @JsonKey(name: "likes_count")  int likesCount, @JsonKey(name: "is_read")  bool isRead, @JsonKey(name: "is_liked")  bool isLiked, @JsonKey(name: "is_free")  bool isFree)  $default,) {final _that = this;
switch (_that) {
case _Chapter():
return $default(_that.id,_that.chapterNumber,_that.releaseDate,_that.viewsCount,_that.likesCount,_that.isRead,_that.isLiked,_that.isFree);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "chapter_id")  String id, @JsonKey(name: "chapter_number")  int chapterNumber, @JsonKey(name: "release_date")  String releaseDate, @JsonKey(name: "views_count")  int viewsCount, @JsonKey(name: "likes_count")  int likesCount, @JsonKey(name: "is_read")  bool isRead, @JsonKey(name: "is_liked")  bool isLiked, @JsonKey(name: "is_free")  bool isFree)?  $default,) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.chapterNumber,_that.releaseDate,_that.viewsCount,_that.likesCount,_that.isRead,_that.isLiked,_that.isFree);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chapter implements Chapter {
  const _Chapter({@JsonKey(name: "chapter_id") this.id = "", @JsonKey(name: "chapter_number") this.chapterNumber = 0, @JsonKey(name: "release_date") this.releaseDate = "", @JsonKey(name: "views_count") this.viewsCount = 0, @JsonKey(name: "likes_count") this.likesCount = 0, @JsonKey(name: "is_read") this.isRead = false, @JsonKey(name: "is_liked") this.isLiked = false, @JsonKey(name: "is_free") this.isFree = false});
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override@JsonKey(name: "chapter_id") final  String id;
@override@JsonKey(name: "chapter_number") final  int chapterNumber;
@override@JsonKey(name: "release_date") final  String releaseDate;
@override@JsonKey(name: "views_count") final  int viewsCount;
@override@JsonKey(name: "likes_count") final  int likesCount;
@override@JsonKey(name: "is_read") final  bool isRead;
@override@JsonKey(name: "is_liked") final  bool isLiked;
@override@JsonKey(name: "is_free") final  bool isFree;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterCopyWith<_Chapter> get copyWith => __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterNumber, chapterNumber) || other.chapterNumber == chapterNumber)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isFree, isFree) || other.isFree == isFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterNumber,releaseDate,viewsCount,likesCount,isRead,isLiked,isFree);

@override
String toString() {
  return 'Chapter(id: $id, chapterNumber: $chapterNumber, releaseDate: $releaseDate, viewsCount: $viewsCount, likesCount: $likesCount, isRead: $isRead, isLiked: $isLiked, isFree: $isFree)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "chapter_id") String id,@JsonKey(name: "chapter_number") int chapterNumber,@JsonKey(name: "release_date") String releaseDate,@JsonKey(name: "views_count") int viewsCount,@JsonKey(name: "likes_count") int likesCount,@JsonKey(name: "is_read") bool isRead,@JsonKey(name: "is_liked") bool isLiked,@JsonKey(name: "is_free") bool isFree
});




}
/// @nodoc
class __$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chapterNumber = null,Object? releaseDate = null,Object? viewsCount = null,Object? likesCount = null,Object? isRead = null,Object? isLiked = null,Object? isFree = null,}) {
  return _then(_Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _self.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
