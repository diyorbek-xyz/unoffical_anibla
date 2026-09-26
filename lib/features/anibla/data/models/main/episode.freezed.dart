// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Episode {

@HiveField(0)@JsonKey(name: "_id") String get id;@HiveField(1)@JsonKey(name: "episode_number") int get episodeNumber;@HiveField(2) dynamic get uz;@HiveField(3) dynamic get ru;@HiveField(4) String get slug;@HiveField(5) EpisodeType get type;@HiveField(6) String get video;
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeCopyWith<Episode> get copyWith => _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Episode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.type, type) || other.type == type)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeNumber,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug,type,video);

@override
String toString() {
  return 'Episode(id: $id, episodeNumber: $episodeNumber, uz: $uz, ru: $ru, slug: $slug, type: $type, video: $video)';
}


}

/// @nodoc
abstract mixin class $EpisodeCopyWith<$Res>  {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) _then) = _$EpisodeCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String id,@HiveField(1)@JsonKey(name: "episode_number") int episodeNumber,@HiveField(2) dynamic uz,@HiveField(3) dynamic ru,@HiveField(4) String slug,@HiveField(5) EpisodeType type,@HiveField(6) String video
});




}
/// @nodoc
class _$EpisodeCopyWithImpl<$Res>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._self, this._then);

  final Episode _self;
  final $Res Function(Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? episodeNumber = null,Object? uz = freezed,Object? ru = freezed,Object? slug = null,Object? type = null,Object? video = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EpisodeType,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Episode].
extension EpisodePatterns on Episode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Episode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Episode value)  $default,){
final _that = this;
switch (_that) {
case _Episode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Episode value)?  $default,){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(name: "episode_number")  int episodeNumber, @HiveField(2)  dynamic uz, @HiveField(3)  dynamic ru, @HiveField(4)  String slug, @HiveField(5)  EpisodeType type, @HiveField(6)  String video)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.id,_that.episodeNumber,_that.uz,_that.ru,_that.slug,_that.type,_that.video);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(name: "episode_number")  int episodeNumber, @HiveField(2)  dynamic uz, @HiveField(3)  dynamic ru, @HiveField(4)  String slug, @HiveField(5)  EpisodeType type, @HiveField(6)  String video)  $default,) {final _that = this;
switch (_that) {
case _Episode():
return $default(_that.id,_that.episodeNumber,_that.uz,_that.ru,_that.slug,_that.type,_that.video);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(name: "episode_number")  int episodeNumber, @HiveField(2)  dynamic uz, @HiveField(3)  dynamic ru, @HiveField(4)  String slug, @HiveField(5)  EpisodeType type, @HiveField(6)  String video)?  $default,) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.id,_that.episodeNumber,_that.uz,_that.ru,_that.slug,_that.type,_that.video);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Episode extends Episode {
  const _Episode({@HiveField(0)@JsonKey(name: "_id") this.id = "", @HiveField(1)@JsonKey(name: "episode_number") this.episodeNumber = 0, @HiveField(2) this.uz = const {}, @HiveField(3) this.ru = const {}, @HiveField(4) this.slug = "", @HiveField(5) this.type = EpisodeType.paid, @HiveField(6) this.video = ""}): super._();
  factory _Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String id;
@override@HiveField(1)@JsonKey(name: "episode_number") final  int episodeNumber;
@override@JsonKey()@HiveField(2) final  dynamic uz;
@override@JsonKey()@HiveField(3) final  dynamic ru;
@override@JsonKey()@HiveField(4) final  String slug;
@override@JsonKey()@HiveField(5) final  EpisodeType type;
@override@JsonKey()@HiveField(6) final  String video;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeCopyWith<_Episode> get copyWith => __$EpisodeCopyWithImpl<_Episode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Episode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.type, type) || other.type == type)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,episodeNumber,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug,type,video);

@override
String toString() {
  return 'Episode(id: $id, episodeNumber: $episodeNumber, uz: $uz, ru: $ru, slug: $slug, type: $type, video: $video)';
}


}

/// @nodoc
abstract mixin class _$EpisodeCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$EpisodeCopyWith(_Episode value, $Res Function(_Episode) _then) = __$EpisodeCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String id,@HiveField(1)@JsonKey(name: "episode_number") int episodeNumber,@HiveField(2) dynamic uz,@HiveField(3) dynamic ru,@HiveField(4) String slug,@HiveField(5) EpisodeType type,@HiveField(6) String video
});




}
/// @nodoc
class __$EpisodeCopyWithImpl<$Res>
    implements _$EpisodeCopyWith<$Res> {
  __$EpisodeCopyWithImpl(this._self, this._then);

  final _Episode _self;
  final $Res Function(_Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? episodeNumber = null,Object? uz = freezed,Object? ru = freezed,Object? slug = null,Object? type = null,Object? video = null,}) {
  return _then(_Episode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EpisodeType,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
