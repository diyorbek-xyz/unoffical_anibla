// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_anime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedAnime {

@JsonKey(name: "_id") String get id;@JsonKey(name: "user_id") String get userId;@JsonKey(name: "media") Anime get anime;@JsonKey(name: "last_visited") String get lastVisitedDate;
/// Create a copy of SavedAnime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedAnimeCopyWith<SavedAnime> get copyWith => _$SavedAnimeCopyWithImpl<SavedAnime>(this as SavedAnime, _$identity);

  /// Serializes this SavedAnime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedAnime&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.lastVisitedDate, lastVisitedDate) || other.lastVisitedDate == lastVisitedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,anime,lastVisitedDate);

@override
String toString() {
  return 'SavedAnime(id: $id, userId: $userId, anime: $anime, lastVisitedDate: $lastVisitedDate)';
}


}

/// @nodoc
abstract mixin class $SavedAnimeCopyWith<$Res>  {
  factory $SavedAnimeCopyWith(SavedAnime value, $Res Function(SavedAnime) _then) = _$SavedAnimeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "media") Anime anime,@JsonKey(name: "last_visited") String lastVisitedDate
});


$AnimeCopyWith<$Res> get anime;

}
/// @nodoc
class _$SavedAnimeCopyWithImpl<$Res>
    implements $SavedAnimeCopyWith<$Res> {
  _$SavedAnimeCopyWithImpl(this._self, this._then);

  final SavedAnime _self;
  final $Res Function(SavedAnime) _then;

/// Create a copy of SavedAnime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? anime = null,Object? lastVisitedDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,lastVisitedDate: null == lastVisitedDate ? _self.lastVisitedDate : lastVisitedDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SavedAnime
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedAnime].
extension SavedAnimePatterns on SavedAnime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedAnime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedAnime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedAnime value)  $default,){
final _that = this;
switch (_that) {
case _SavedAnime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedAnime value)?  $default,){
final _that = this;
switch (_that) {
case _SavedAnime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "media")  Anime anime, @JsonKey(name: "last_visited")  String lastVisitedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedAnime() when $default != null:
return $default(_that.id,_that.userId,_that.anime,_that.lastVisitedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "media")  Anime anime, @JsonKey(name: "last_visited")  String lastVisitedDate)  $default,) {final _that = this;
switch (_that) {
case _SavedAnime():
return $default(_that.id,_that.userId,_that.anime,_that.lastVisitedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "media")  Anime anime, @JsonKey(name: "last_visited")  String lastVisitedDate)?  $default,) {final _that = this;
switch (_that) {
case _SavedAnime() when $default != null:
return $default(_that.id,_that.userId,_that.anime,_that.lastVisitedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedAnime extends SavedAnime {
   _SavedAnime({@JsonKey(name: "_id") this.id = "", @JsonKey(name: "user_id") this.userId = "", @JsonKey(name: "media") this.anime = const Anime(), @JsonKey(name: "last_visited") this.lastVisitedDate = ""}): super._();
  factory _SavedAnime.fromJson(Map<String, dynamic> json) => _$SavedAnimeFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override@JsonKey(name: "user_id") final  String userId;
@override@JsonKey(name: "media") final  Anime anime;
@override@JsonKey(name: "last_visited") final  String lastVisitedDate;

/// Create a copy of SavedAnime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedAnimeCopyWith<_SavedAnime> get copyWith => __$SavedAnimeCopyWithImpl<_SavedAnime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedAnimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedAnime&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.lastVisitedDate, lastVisitedDate) || other.lastVisitedDate == lastVisitedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,anime,lastVisitedDate);

@override
String toString() {
  return 'SavedAnime(id: $id, userId: $userId, anime: $anime, lastVisitedDate: $lastVisitedDate)';
}


}

/// @nodoc
abstract mixin class _$SavedAnimeCopyWith<$Res> implements $SavedAnimeCopyWith<$Res> {
  factory _$SavedAnimeCopyWith(_SavedAnime value, $Res Function(_SavedAnime) _then) = __$SavedAnimeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "media") Anime anime,@JsonKey(name: "last_visited") String lastVisitedDate
});


@override $AnimeCopyWith<$Res> get anime;

}
/// @nodoc
class __$SavedAnimeCopyWithImpl<$Res>
    implements _$SavedAnimeCopyWith<$Res> {
  __$SavedAnimeCopyWithImpl(this._self, this._then);

  final _SavedAnime _self;
  final $Res Function(_SavedAnime) _then;

/// Create a copy of SavedAnime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? anime = null,Object? lastVisitedDate = null,}) {
  return _then(_SavedAnime(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,lastVisitedDate: null == lastVisitedDate ? _self.lastVisitedDate : lastVisitedDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SavedAnime
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}

// dart format on
