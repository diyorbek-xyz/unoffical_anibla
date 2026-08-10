// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimePageProps {

@JsonKey(name: "type") AnimeType get animeType;@JsonKey(name: "anime") String get animeSlug;@JsonKey(name: "season") String? get seasonSlug;@JsonKey(name: "episode") String? get episodeSlug;
/// Create a copy of AnimePageProps
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimePagePropsCopyWith<AnimePageProps> get copyWith => _$AnimePagePropsCopyWithImpl<AnimePageProps>(this as AnimePageProps, _$identity);

  /// Serializes this AnimePageProps to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimePageProps&&(identical(other.animeType, animeType) || other.animeType == animeType)&&(identical(other.animeSlug, animeSlug) || other.animeSlug == animeSlug)&&(identical(other.seasonSlug, seasonSlug) || other.seasonSlug == seasonSlug)&&(identical(other.episodeSlug, episodeSlug) || other.episodeSlug == episodeSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,animeType,animeSlug,seasonSlug,episodeSlug);

@override
String toString() {
  return 'AnimePageProps(animeType: $animeType, animeSlug: $animeSlug, seasonSlug: $seasonSlug, episodeSlug: $episodeSlug)';
}


}

/// @nodoc
abstract mixin class $AnimePagePropsCopyWith<$Res>  {
  factory $AnimePagePropsCopyWith(AnimePageProps value, $Res Function(AnimePageProps) _then) = _$AnimePagePropsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "type") AnimeType animeType,@JsonKey(name: "anime") String animeSlug,@JsonKey(name: "season") String? seasonSlug,@JsonKey(name: "episode") String? episodeSlug
});




}
/// @nodoc
class _$AnimePagePropsCopyWithImpl<$Res>
    implements $AnimePagePropsCopyWith<$Res> {
  _$AnimePagePropsCopyWithImpl(this._self, this._then);

  final AnimePageProps _self;
  final $Res Function(AnimePageProps) _then;

/// Create a copy of AnimePageProps
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? animeType = null,Object? animeSlug = null,Object? seasonSlug = freezed,Object? episodeSlug = freezed,}) {
  return _then(_self.copyWith(
animeType: null == animeType ? _self.animeType : animeType // ignore: cast_nullable_to_non_nullable
as AnimeType,animeSlug: null == animeSlug ? _self.animeSlug : animeSlug // ignore: cast_nullable_to_non_nullable
as String,seasonSlug: freezed == seasonSlug ? _self.seasonSlug : seasonSlug // ignore: cast_nullable_to_non_nullable
as String?,episodeSlug: freezed == episodeSlug ? _self.episodeSlug : episodeSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimePageProps].
extension AnimePagePropsPatterns on AnimePageProps {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimePageProps value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimePageProps() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimePageProps value)  $default,){
final _that = this;
switch (_that) {
case _AnimePageProps():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimePageProps value)?  $default,){
final _that = this;
switch (_that) {
case _AnimePageProps() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "type")  AnimeType animeType, @JsonKey(name: "anime")  String animeSlug, @JsonKey(name: "season")  String? seasonSlug, @JsonKey(name: "episode")  String? episodeSlug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimePageProps() when $default != null:
return $default(_that.animeType,_that.animeSlug,_that.seasonSlug,_that.episodeSlug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "type")  AnimeType animeType, @JsonKey(name: "anime")  String animeSlug, @JsonKey(name: "season")  String? seasonSlug, @JsonKey(name: "episode")  String? episodeSlug)  $default,) {final _that = this;
switch (_that) {
case _AnimePageProps():
return $default(_that.animeType,_that.animeSlug,_that.seasonSlug,_that.episodeSlug);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "type")  AnimeType animeType, @JsonKey(name: "anime")  String animeSlug, @JsonKey(name: "season")  String? seasonSlug, @JsonKey(name: "episode")  String? episodeSlug)?  $default,) {final _that = this;
switch (_that) {
case _AnimePageProps() when $default != null:
return $default(_that.animeType,_that.animeSlug,_that.seasonSlug,_that.episodeSlug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimePageProps implements AnimePageProps {
   _AnimePageProps({@JsonKey(name: "type") required this.animeType, @JsonKey(name: "anime") required this.animeSlug, @JsonKey(name: "season") this.seasonSlug, @JsonKey(name: "episode") this.episodeSlug});
  factory _AnimePageProps.fromJson(Map<String, dynamic> json) => _$AnimePagePropsFromJson(json);

@override@JsonKey(name: "type") final  AnimeType animeType;
@override@JsonKey(name: "anime") final  String animeSlug;
@override@JsonKey(name: "season") final  String? seasonSlug;
@override@JsonKey(name: "episode") final  String? episodeSlug;

/// Create a copy of AnimePageProps
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimePagePropsCopyWith<_AnimePageProps> get copyWith => __$AnimePagePropsCopyWithImpl<_AnimePageProps>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimePagePropsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimePageProps&&(identical(other.animeType, animeType) || other.animeType == animeType)&&(identical(other.animeSlug, animeSlug) || other.animeSlug == animeSlug)&&(identical(other.seasonSlug, seasonSlug) || other.seasonSlug == seasonSlug)&&(identical(other.episodeSlug, episodeSlug) || other.episodeSlug == episodeSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,animeType,animeSlug,seasonSlug,episodeSlug);

@override
String toString() {
  return 'AnimePageProps(animeType: $animeType, animeSlug: $animeSlug, seasonSlug: $seasonSlug, episodeSlug: $episodeSlug)';
}


}

/// @nodoc
abstract mixin class _$AnimePagePropsCopyWith<$Res> implements $AnimePagePropsCopyWith<$Res> {
  factory _$AnimePagePropsCopyWith(_AnimePageProps value, $Res Function(_AnimePageProps) _then) = __$AnimePagePropsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "type") AnimeType animeType,@JsonKey(name: "anime") String animeSlug,@JsonKey(name: "season") String? seasonSlug,@JsonKey(name: "episode") String? episodeSlug
});




}
/// @nodoc
class __$AnimePagePropsCopyWithImpl<$Res>
    implements _$AnimePagePropsCopyWith<$Res> {
  __$AnimePagePropsCopyWithImpl(this._self, this._then);

  final _AnimePageProps _self;
  final $Res Function(_AnimePageProps) _then;

/// Create a copy of AnimePageProps
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? animeType = null,Object? animeSlug = null,Object? seasonSlug = freezed,Object? episodeSlug = freezed,}) {
  return _then(_AnimePageProps(
animeType: null == animeType ? _self.animeType : animeType // ignore: cast_nullable_to_non_nullable
as AnimeType,animeSlug: null == animeSlug ? _self.animeSlug : animeSlug // ignore: cast_nullable_to_non_nullable
as String,seasonSlug: freezed == seasonSlug ? _self.seasonSlug : seasonSlug // ignore: cast_nullable_to_non_nullable
as String?,episodeSlug: freezed == episodeSlug ? _self.episodeSlug : episodeSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
