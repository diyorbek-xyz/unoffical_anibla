// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoGenre {

@HiveField(0)@JsonKey(name: "genre_id") String get id;@HiveField(1)@JsonKey(name: "name") String get title;
/// Create a copy of ManoGenre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoGenreCopyWith<ManoGenre> get copyWith => _$ManoGenreCopyWithImpl<ManoGenre>(this as ManoGenre, _$identity);

  /// Serializes this ManoGenre to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoGenre&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'ManoGenre(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $ManoGenreCopyWith<$Res>  {
  factory $ManoGenreCopyWith(ManoGenre value, $Res Function(ManoGenre) _then) = _$ManoGenreCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "genre_id") String id,@HiveField(1)@JsonKey(name: "name") String title
});




}
/// @nodoc
class _$ManoGenreCopyWithImpl<$Res>
    implements $ManoGenreCopyWith<$Res> {
  _$ManoGenreCopyWithImpl(this._self, this._then);

  final ManoGenre _self;
  final $Res Function(ManoGenre) _then;

/// Create a copy of ManoGenre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoGenre].
extension ManoGenrePatterns on ManoGenre {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoGenre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoGenre() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoGenre value)  $default,){
final _that = this;
switch (_that) {
case _ManoGenre():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoGenre value)?  $default,){
final _that = this;
switch (_that) {
case _ManoGenre() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "genre_id")  String id, @HiveField(1)@JsonKey(name: "name")  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoGenre() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "genre_id")  String id, @HiveField(1)@JsonKey(name: "name")  String title)  $default,) {final _that = this;
switch (_that) {
case _ManoGenre():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "genre_id")  String id, @HiveField(1)@JsonKey(name: "name")  String title)?  $default,) {final _that = this;
switch (_that) {
case _ManoGenre() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoGenre implements ManoGenre {
  const _ManoGenre({@HiveField(0)@JsonKey(name: "genre_id") this.id = "", @HiveField(1)@JsonKey(name: "name") this.title = ""});
  factory _ManoGenre.fromJson(Map<String, dynamic> json) => _$ManoGenreFromJson(json);

@override@HiveField(0)@JsonKey(name: "genre_id") final  String id;
@override@HiveField(1)@JsonKey(name: "name") final  String title;

/// Create a copy of ManoGenre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoGenreCopyWith<_ManoGenre> get copyWith => __$ManoGenreCopyWithImpl<_ManoGenre>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoGenreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoGenre&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'ManoGenre(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$ManoGenreCopyWith<$Res> implements $ManoGenreCopyWith<$Res> {
  factory _$ManoGenreCopyWith(_ManoGenre value, $Res Function(_ManoGenre) _then) = __$ManoGenreCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "genre_id") String id,@HiveField(1)@JsonKey(name: "name") String title
});




}
/// @nodoc
class __$ManoGenreCopyWithImpl<$Res>
    implements _$ManoGenreCopyWith<$Res> {
  __$ManoGenreCopyWithImpl(this._self, this._then);

  final _ManoGenre _self;
  final $Res Function(_ManoGenre) _then;

/// Create a copy of ManoGenre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_ManoGenre(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
