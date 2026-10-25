// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaChapter {

 int get total; int get offset; bool get isFree; bool get isSaved; double get progress; String get key; String get title; String get mediaUrl;
/// Create a copy of MediaChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaChapterCopyWith<MediaChapter> get copyWith => _$MediaChapterCopyWithImpl<MediaChapter>(this as MediaChapter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaChapter&&(identical(other.total, total) || other.total == total)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl));
}


@override
int get hashCode => Object.hash(runtimeType,total,offset,isFree,isSaved,progress,key,title,mediaUrl);

@override
String toString() {
  return 'MediaChapter(total: $total, offset: $offset, isFree: $isFree, isSaved: $isSaved, progress: $progress, key: $key, title: $title, mediaUrl: $mediaUrl)';
}


}

/// @nodoc
abstract mixin class $MediaChapterCopyWith<$Res>  {
  factory $MediaChapterCopyWith(MediaChapter value, $Res Function(MediaChapter) _then) = _$MediaChapterCopyWithImpl;
@useResult
$Res call({
 int total, int offset, bool isFree, bool isSaved, double progress, String key, String title, String mediaUrl
});




}
/// @nodoc
class _$MediaChapterCopyWithImpl<$Res>
    implements $MediaChapterCopyWith<$Res> {
  _$MediaChapterCopyWithImpl(this._self, this._then);

  final MediaChapter _self;
  final $Res Function(MediaChapter) _then;

/// Create a copy of MediaChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? offset = null,Object? isFree = null,Object? isSaved = null,Object? progress = null,Object? key = null,Object? title = null,Object? mediaUrl = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaChapter].
extension MediaChapterPatterns on MediaChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaChapter value)  $default,){
final _that = this;
switch (_that) {
case _MediaChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaChapter value)?  $default,){
final _that = this;
switch (_that) {
case _MediaChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int offset,  bool isFree,  bool isSaved,  double progress,  String key,  String title,  String mediaUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaChapter() when $default != null:
return $default(_that.total,_that.offset,_that.isFree,_that.isSaved,_that.progress,_that.key,_that.title,_that.mediaUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int offset,  bool isFree,  bool isSaved,  double progress,  String key,  String title,  String mediaUrl)  $default,) {final _that = this;
switch (_that) {
case _MediaChapter():
return $default(_that.total,_that.offset,_that.isFree,_that.isSaved,_that.progress,_that.key,_that.title,_that.mediaUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int offset,  bool isFree,  bool isSaved,  double progress,  String key,  String title,  String mediaUrl)?  $default,) {final _that = this;
switch (_that) {
case _MediaChapter() when $default != null:
return $default(_that.total,_that.offset,_that.isFree,_that.isSaved,_that.progress,_that.key,_that.title,_that.mediaUrl);case _:
  return null;

}
}

}

/// @nodoc


class _MediaChapter implements MediaChapter {
  const _MediaChapter({this.total = 0, this.offset = 0, this.isFree = false, this.isSaved = false, this.progress = 0.0, this.key = "", this.title = "", this.mediaUrl = ""});
  

@override@JsonKey() final  int total;
@override@JsonKey() final  int offset;
@override@JsonKey() final  bool isFree;
@override@JsonKey() final  bool isSaved;
@override@JsonKey() final  double progress;
@override@JsonKey() final  String key;
@override@JsonKey() final  String title;
@override@JsonKey() final  String mediaUrl;

/// Create a copy of MediaChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaChapterCopyWith<_MediaChapter> get copyWith => __$MediaChapterCopyWithImpl<_MediaChapter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaChapter&&(identical(other.total, total) || other.total == total)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl));
}


@override
int get hashCode => Object.hash(runtimeType,total,offset,isFree,isSaved,progress,key,title,mediaUrl);

@override
String toString() {
  return 'MediaChapter(total: $total, offset: $offset, isFree: $isFree, isSaved: $isSaved, progress: $progress, key: $key, title: $title, mediaUrl: $mediaUrl)';
}


}

/// @nodoc
abstract mixin class _$MediaChapterCopyWith<$Res> implements $MediaChapterCopyWith<$Res> {
  factory _$MediaChapterCopyWith(_MediaChapter value, $Res Function(_MediaChapter) _then) = __$MediaChapterCopyWithImpl;
@override @useResult
$Res call({
 int total, int offset, bool isFree, bool isSaved, double progress, String key, String title, String mediaUrl
});




}
/// @nodoc
class __$MediaChapterCopyWithImpl<$Res>
    implements _$MediaChapterCopyWith<$Res> {
  __$MediaChapterCopyWithImpl(this._self, this._then);

  final _MediaChapter _self;
  final $Res Function(_MediaChapter) _then;

/// Create a copy of MediaChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? offset = null,Object? isFree = null,Object? isSaved = null,Object? progress = null,Object? key = null,Object? title = null,Object? mediaUrl = null,}) {
  return _then(_MediaChapter(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
