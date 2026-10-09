// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaProps {

 String get mediaKey; MediaType get type; String? get seasonKey; String? get chapterKey;
/// Create a copy of MediaProps
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaPropsCopyWith<MediaProps> get copyWith => _$MediaPropsCopyWithImpl<MediaProps>(this as MediaProps, _$identity);

  /// Serializes this MediaProps to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaProps&&(identical(other.mediaKey, mediaKey) || other.mediaKey == mediaKey)&&(identical(other.type, type) || other.type == type)&&(identical(other.seasonKey, seasonKey) || other.seasonKey == seasonKey)&&(identical(other.chapterKey, chapterKey) || other.chapterKey == chapterKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mediaKey,type,seasonKey,chapterKey);

@override
String toString() {
  return 'MediaProps(mediaKey: $mediaKey, type: $type, seasonKey: $seasonKey, chapterKey: $chapterKey)';
}


}

/// @nodoc
abstract mixin class $MediaPropsCopyWith<$Res>  {
  factory $MediaPropsCopyWith(MediaProps value, $Res Function(MediaProps) _then) = _$MediaPropsCopyWithImpl;
@useResult
$Res call({
 String mediaKey, MediaType type, String? seasonKey, String? chapterKey
});




}
/// @nodoc
class _$MediaPropsCopyWithImpl<$Res>
    implements $MediaPropsCopyWith<$Res> {
  _$MediaPropsCopyWithImpl(this._self, this._then);

  final MediaProps _self;
  final $Res Function(MediaProps) _then;

/// Create a copy of MediaProps
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mediaKey = null,Object? type = null,Object? seasonKey = freezed,Object? chapterKey = freezed,}) {
  return _then(_self.copyWith(
mediaKey: null == mediaKey ? _self.mediaKey : mediaKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,seasonKey: freezed == seasonKey ? _self.seasonKey : seasonKey // ignore: cast_nullable_to_non_nullable
as String?,chapterKey: freezed == chapterKey ? _self.chapterKey : chapterKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaProps].
extension MediaPropsPatterns on MediaProps {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaProps value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaProps() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaProps value)  $default,){
final _that = this;
switch (_that) {
case _MediaProps():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaProps value)?  $default,){
final _that = this;
switch (_that) {
case _MediaProps() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mediaKey,  MediaType type,  String? seasonKey,  String? chapterKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaProps() when $default != null:
return $default(_that.mediaKey,_that.type,_that.seasonKey,_that.chapterKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mediaKey,  MediaType type,  String? seasonKey,  String? chapterKey)  $default,) {final _that = this;
switch (_that) {
case _MediaProps():
return $default(_that.mediaKey,_that.type,_that.seasonKey,_that.chapterKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mediaKey,  MediaType type,  String? seasonKey,  String? chapterKey)?  $default,) {final _that = this;
switch (_that) {
case _MediaProps() when $default != null:
return $default(_that.mediaKey,_that.type,_that.seasonKey,_that.chapterKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaProps implements MediaProps {
   _MediaProps({required this.mediaKey, required this.type, this.seasonKey, this.chapterKey});
  factory _MediaProps.fromJson(Map<String, dynamic> json) => _$MediaPropsFromJson(json);

@override final  String mediaKey;
@override final  MediaType type;
@override final  String? seasonKey;
@override final  String? chapterKey;

/// Create a copy of MediaProps
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaPropsCopyWith<_MediaProps> get copyWith => __$MediaPropsCopyWithImpl<_MediaProps>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaPropsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaProps&&(identical(other.mediaKey, mediaKey) || other.mediaKey == mediaKey)&&(identical(other.type, type) || other.type == type)&&(identical(other.seasonKey, seasonKey) || other.seasonKey == seasonKey)&&(identical(other.chapterKey, chapterKey) || other.chapterKey == chapterKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mediaKey,type,seasonKey,chapterKey);

@override
String toString() {
  return 'MediaProps(mediaKey: $mediaKey, type: $type, seasonKey: $seasonKey, chapterKey: $chapterKey)';
}


}

/// @nodoc
abstract mixin class _$MediaPropsCopyWith<$Res> implements $MediaPropsCopyWith<$Res> {
  factory _$MediaPropsCopyWith(_MediaProps value, $Res Function(_MediaProps) _then) = __$MediaPropsCopyWithImpl;
@override @useResult
$Res call({
 String mediaKey, MediaType type, String? seasonKey, String? chapterKey
});




}
/// @nodoc
class __$MediaPropsCopyWithImpl<$Res>
    implements _$MediaPropsCopyWith<$Res> {
  __$MediaPropsCopyWithImpl(this._self, this._then);

  final _MediaProps _self;
  final $Res Function(_MediaProps) _then;

/// Create a copy of MediaProps
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mediaKey = null,Object? type = null,Object? seasonKey = freezed,Object? chapterKey = freezed,}) {
  return _then(_MediaProps(
mediaKey: null == mediaKey ? _self.mediaKey : mediaKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,seasonKey: freezed == seasonKey ? _self.seasonKey : seasonKey // ignore: cast_nullable_to_non_nullable
as String?,chapterKey: freezed == chapterKey ? _self.chapterKey : chapterKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
