// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterPage {

@HiveField(0)@JsonKey(name: "page_id") String get id;@HiveField(1)@JsonKey(name: "image_url") String get imageUrl;@HiveField(2)@JsonKey(name: "chapter_id") String get chapterId;@HiveField(3)@JsonKey(name: "page_number") int get pageNumber;@HiveField(4)@JsonKey(name: "width") int get width;@HiveField(5)@JsonKey(name: "height") int get height;
/// Create a copy of ChapterPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterPageCopyWith<ChapterPage> get copyWith => _$ChapterPageCopyWithImpl<ChapterPage>(this as ChapterPage, _$identity);

  /// Serializes this ChapterPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterPage&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,chapterId,pageNumber,width,height);

@override
String toString() {
  return 'ChapterPage(id: $id, imageUrl: $imageUrl, chapterId: $chapterId, pageNumber: $pageNumber, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $ChapterPageCopyWith<$Res>  {
  factory $ChapterPageCopyWith(ChapterPage value, $Res Function(ChapterPage) _then) = _$ChapterPageCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "page_id") String id,@HiveField(1)@JsonKey(name: "image_url") String imageUrl,@HiveField(2)@JsonKey(name: "chapter_id") String chapterId,@HiveField(3)@JsonKey(name: "page_number") int pageNumber,@HiveField(4)@JsonKey(name: "width") int width,@HiveField(5)@JsonKey(name: "height") int height
});




}
/// @nodoc
class _$ChapterPageCopyWithImpl<$Res>
    implements $ChapterPageCopyWith<$Res> {
  _$ChapterPageCopyWithImpl(this._self, this._then);

  final ChapterPage _self;
  final $Res Function(ChapterPage) _then;

/// Create a copy of ChapterPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,Object? chapterId = null,Object? pageNumber = null,Object? width = null,Object? height = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterPage].
extension ChapterPagePatterns on ChapterPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterPage value)  $default,){
final _that = this;
switch (_that) {
case _ChapterPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterPage value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "page_id")  String id, @HiveField(1)@JsonKey(name: "image_url")  String imageUrl, @HiveField(2)@JsonKey(name: "chapter_id")  String chapterId, @HiveField(3)@JsonKey(name: "page_number")  int pageNumber, @HiveField(4)@JsonKey(name: "width")  int width, @HiveField(5)@JsonKey(name: "height")  int height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterPage() when $default != null:
return $default(_that.id,_that.imageUrl,_that.chapterId,_that.pageNumber,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "page_id")  String id, @HiveField(1)@JsonKey(name: "image_url")  String imageUrl, @HiveField(2)@JsonKey(name: "chapter_id")  String chapterId, @HiveField(3)@JsonKey(name: "page_number")  int pageNumber, @HiveField(4)@JsonKey(name: "width")  int width, @HiveField(5)@JsonKey(name: "height")  int height)  $default,) {final _that = this;
switch (_that) {
case _ChapterPage():
return $default(_that.id,_that.imageUrl,_that.chapterId,_that.pageNumber,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "page_id")  String id, @HiveField(1)@JsonKey(name: "image_url")  String imageUrl, @HiveField(2)@JsonKey(name: "chapter_id")  String chapterId, @HiveField(3)@JsonKey(name: "page_number")  int pageNumber, @HiveField(4)@JsonKey(name: "width")  int width, @HiveField(5)@JsonKey(name: "height")  int height)?  $default,) {final _that = this;
switch (_that) {
case _ChapterPage() when $default != null:
return $default(_that.id,_that.imageUrl,_that.chapterId,_that.pageNumber,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterPage implements ChapterPage {
  const _ChapterPage({@HiveField(0)@JsonKey(name: "page_id") this.id = "", @HiveField(1)@JsonKey(name: "image_url") this.imageUrl = "", @HiveField(2)@JsonKey(name: "chapter_id") this.chapterId = "", @HiveField(3)@JsonKey(name: "page_number") this.pageNumber = 0, @HiveField(4)@JsonKey(name: "width") this.width = 0, @HiveField(5)@JsonKey(name: "height") this.height = 0});
  factory _ChapterPage.fromJson(Map<String, dynamic> json) => _$ChapterPageFromJson(json);

@override@HiveField(0)@JsonKey(name: "page_id") final  String id;
@override@HiveField(1)@JsonKey(name: "image_url") final  String imageUrl;
@override@HiveField(2)@JsonKey(name: "chapter_id") final  String chapterId;
@override@HiveField(3)@JsonKey(name: "page_number") final  int pageNumber;
@override@HiveField(4)@JsonKey(name: "width") final  int width;
@override@HiveField(5)@JsonKey(name: "height") final  int height;

/// Create a copy of ChapterPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterPageCopyWith<_ChapterPage> get copyWith => __$ChapterPageCopyWithImpl<_ChapterPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterPage&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,chapterId,pageNumber,width,height);

@override
String toString() {
  return 'ChapterPage(id: $id, imageUrl: $imageUrl, chapterId: $chapterId, pageNumber: $pageNumber, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$ChapterPageCopyWith<$Res> implements $ChapterPageCopyWith<$Res> {
  factory _$ChapterPageCopyWith(_ChapterPage value, $Res Function(_ChapterPage) _then) = __$ChapterPageCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "page_id") String id,@HiveField(1)@JsonKey(name: "image_url") String imageUrl,@HiveField(2)@JsonKey(name: "chapter_id") String chapterId,@HiveField(3)@JsonKey(name: "page_number") int pageNumber,@HiveField(4)@JsonKey(name: "width") int width,@HiveField(5)@JsonKey(name: "height") int height
});




}
/// @nodoc
class __$ChapterPageCopyWithImpl<$Res>
    implements _$ChapterPageCopyWith<$Res> {
  __$ChapterPageCopyWithImpl(this._self, this._then);

  final _ChapterPage _self;
  final $Res Function(_ChapterPage) _then;

/// Create a copy of ChapterPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,Object? chapterId = null,Object? pageNumber = null,Object? width = null,Object? height = null,}) {
  return _then(_ChapterPage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
