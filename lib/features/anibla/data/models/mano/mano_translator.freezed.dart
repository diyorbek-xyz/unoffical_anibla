// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_translator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoTranslator {

@JsonKey(name: "translator_id") String get id;@JsonKey(name: "manga_id") String get mangaId;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "picture_link") String get picture;
/// Create a copy of ManoTranslator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoTranslatorCopyWith<ManoTranslator> get copyWith => _$ManoTranslatorCopyWithImpl<ManoTranslator>(this as ManoTranslator, _$identity);

  /// Serializes this ManoTranslator to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoTranslator&&(identical(other.id, id) || other.id == id)&&(identical(other.mangaId, mangaId) || other.mangaId == mangaId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mangaId,firstName,picture);

@override
String toString() {
  return 'ManoTranslator(id: $id, mangaId: $mangaId, firstName: $firstName, picture: $picture)';
}


}

/// @nodoc
abstract mixin class $ManoTranslatorCopyWith<$Res>  {
  factory $ManoTranslatorCopyWith(ManoTranslator value, $Res Function(ManoTranslator) _then) = _$ManoTranslatorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "translator_id") String id,@JsonKey(name: "manga_id") String mangaId,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "picture_link") String picture
});




}
/// @nodoc
class _$ManoTranslatorCopyWithImpl<$Res>
    implements $ManoTranslatorCopyWith<$Res> {
  _$ManoTranslatorCopyWithImpl(this._self, this._then);

  final ManoTranslator _self;
  final $Res Function(ManoTranslator) _then;

/// Create a copy of ManoTranslator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mangaId = null,Object? firstName = null,Object? picture = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mangaId: null == mangaId ? _self.mangaId : mangaId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoTranslator].
extension ManoTranslatorPatterns on ManoTranslator {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoTranslator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoTranslator() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoTranslator value)  $default,){
final _that = this;
switch (_that) {
case _ManoTranslator():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoTranslator value)?  $default,){
final _that = this;
switch (_that) {
case _ManoTranslator() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "translator_id")  String id, @JsonKey(name: "manga_id")  String mangaId, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "picture_link")  String picture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoTranslator() when $default != null:
return $default(_that.id,_that.mangaId,_that.firstName,_that.picture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "translator_id")  String id, @JsonKey(name: "manga_id")  String mangaId, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "picture_link")  String picture)  $default,) {final _that = this;
switch (_that) {
case _ManoTranslator():
return $default(_that.id,_that.mangaId,_that.firstName,_that.picture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "translator_id")  String id, @JsonKey(name: "manga_id")  String mangaId, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "picture_link")  String picture)?  $default,) {final _that = this;
switch (_that) {
case _ManoTranslator() when $default != null:
return $default(_that.id,_that.mangaId,_that.firstName,_that.picture);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoTranslator implements ManoTranslator {
  const _ManoTranslator({@JsonKey(name: "translator_id") this.id = "", @JsonKey(name: "manga_id") this.mangaId = "", @JsonKey(name: "first_name") this.firstName = "", @JsonKey(name: "picture_link") this.picture = ""});
  factory _ManoTranslator.fromJson(Map<String, dynamic> json) => _$ManoTranslatorFromJson(json);

@override@JsonKey(name: "translator_id") final  String id;
@override@JsonKey(name: "manga_id") final  String mangaId;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "picture_link") final  String picture;

/// Create a copy of ManoTranslator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoTranslatorCopyWith<_ManoTranslator> get copyWith => __$ManoTranslatorCopyWithImpl<_ManoTranslator>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoTranslatorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoTranslator&&(identical(other.id, id) || other.id == id)&&(identical(other.mangaId, mangaId) || other.mangaId == mangaId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mangaId,firstName,picture);

@override
String toString() {
  return 'ManoTranslator(id: $id, mangaId: $mangaId, firstName: $firstName, picture: $picture)';
}


}

/// @nodoc
abstract mixin class _$ManoTranslatorCopyWith<$Res> implements $ManoTranslatorCopyWith<$Res> {
  factory _$ManoTranslatorCopyWith(_ManoTranslator value, $Res Function(_ManoTranslator) _then) = __$ManoTranslatorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "translator_id") String id,@JsonKey(name: "manga_id") String mangaId,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "picture_link") String picture
});




}
/// @nodoc
class __$ManoTranslatorCopyWithImpl<$Res>
    implements _$ManoTranslatorCopyWith<$Res> {
  __$ManoTranslatorCopyWithImpl(this._self, this._then);

  final _ManoTranslator _self;
  final $Res Function(_ManoTranslator) _then;

/// Create a copy of ManoTranslator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mangaId = null,Object? firstName = null,Object? picture = null,}) {
  return _then(_ManoTranslator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mangaId: null == mangaId ? _self.mangaId : mangaId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
