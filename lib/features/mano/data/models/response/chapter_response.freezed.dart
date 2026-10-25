// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterResponse<T> {

 T get chapters; int get limit; int get offset; int get total;
/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterResponseCopyWith<T, ChapterResponse<T>> get copyWith => _$ChapterResponseCopyWithImpl<T, ChapterResponse<T>>(this as ChapterResponse<T>, _$identity);

  /// Serializes this ChapterResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterResponse<T>&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chapters),limit,offset,total);

@override
String toString() {
  return 'ChapterResponse<$T>(chapters: $chapters, limit: $limit, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class $ChapterResponseCopyWith<T,$Res>  {
  factory $ChapterResponseCopyWith(ChapterResponse<T> value, $Res Function(ChapterResponse<T>) _then) = _$ChapterResponseCopyWithImpl;
@useResult
$Res call({
 T chapters, int limit, int offset, int total
});




}
/// @nodoc
class _$ChapterResponseCopyWithImpl<T,$Res>
    implements $ChapterResponseCopyWith<T, $Res> {
  _$ChapterResponseCopyWithImpl(this._self, this._then);

  final ChapterResponse<T> _self;
  final $Res Function(ChapterResponse<T>) _then;

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapters = freezed,Object? limit = null,Object? offset = null,Object? total = null,}) {
  return _then(_self.copyWith(
chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as T,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterResponse].
extension ChapterResponsePatterns<T> on ChapterResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _ChapterResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T chapters,  int limit,  int offset,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
return $default(_that.chapters,_that.limit,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T chapters,  int limit,  int offset,  int total)  $default,) {final _that = this;
switch (_that) {
case _ChapterResponse():
return $default(_that.chapters,_that.limit,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T chapters,  int limit,  int offset,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
return $default(_that.chapters,_that.limit,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ChapterResponse<T> implements ChapterResponse<T> {
  const _ChapterResponse({required this.chapters, this.limit = 0, this.offset = 0, this.total = 0});
  factory _ChapterResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ChapterResponseFromJson(json,fromJsonT);

@override final  T chapters;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;
@override@JsonKey() final  int total;

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterResponseCopyWith<T, _ChapterResponse<T>> get copyWith => __$ChapterResponseCopyWithImpl<T, _ChapterResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ChapterResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterResponse<T>&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chapters),limit,offset,total);

@override
String toString() {
  return 'ChapterResponse<$T>(chapters: $chapters, limit: $limit, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ChapterResponseCopyWith<T,$Res> implements $ChapterResponseCopyWith<T, $Res> {
  factory _$ChapterResponseCopyWith(_ChapterResponse<T> value, $Res Function(_ChapterResponse<T>) _then) = __$ChapterResponseCopyWithImpl;
@override @useResult
$Res call({
 T chapters, int limit, int offset, int total
});




}
/// @nodoc
class __$ChapterResponseCopyWithImpl<T,$Res>
    implements _$ChapterResponseCopyWith<T, $Res> {
  __$ChapterResponseCopyWithImpl(this._self, this._then);

  final _ChapterResponse<T> _self;
  final $Res Function(_ChapterResponse<T>) _then;

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapters = freezed,Object? limit = null,Object? offset = null,Object? total = null,}) {
  return _then(_ChapterResponse<T>(
chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as T,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
