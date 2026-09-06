// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeasonModel {

@JsonKey(name: "_id") String? get id; dynamic get uz; dynamic get ru; String? get slug;
/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonModelCopyWith<SeasonModel> get copyWith => _$SeasonModelCopyWithImpl<SeasonModel>(this as SeasonModel, _$identity);

  /// Serializes this SeasonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug);

@override
String toString() {
  return 'SeasonModel(id: $id, uz: $uz, ru: $ru, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $SeasonModelCopyWith<$Res>  {
  factory $SeasonModelCopyWith(SeasonModel value, $Res Function(SeasonModel) _then) = _$SeasonModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String? id, dynamic uz, dynamic ru, String? slug
});




}
/// @nodoc
class _$SeasonModelCopyWithImpl<$Res>
    implements $SeasonModelCopyWith<$Res> {
  _$SeasonModelCopyWithImpl(this._self, this._then);

  final SeasonModel _self;
  final $Res Function(SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uz = freezed,Object? ru = freezed,Object? slug = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasonModel].
extension SeasonModelPatterns on SeasonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonModel value)  $default,){
final _that = this;
switch (_that) {
case _SeasonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String? id,  dynamic uz,  dynamic ru,  String? slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.id,_that.uz,_that.ru,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String? id,  dynamic uz,  dynamic ru,  String? slug)  $default,) {final _that = this;
switch (_that) {
case _SeasonModel():
return $default(_that.id,_that.uz,_that.ru,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String? id,  dynamic uz,  dynamic ru,  String? slug)?  $default,) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.id,_that.uz,_that.ru,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeasonModel implements SeasonModel {
   _SeasonModel({@JsonKey(name: "_id") this.id, this.uz, this.ru, this.slug});
  factory _SeasonModel.fromJson(Map<String, dynamic> json) => _$SeasonModelFromJson(json);

@override@JsonKey(name: "_id") final  String? id;
@override final  dynamic uz;
@override final  dynamic ru;
@override final  String? slug;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonModelCopyWith<_SeasonModel> get copyWith => __$SeasonModelCopyWithImpl<_SeasonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug);

@override
String toString() {
  return 'SeasonModel(id: $id, uz: $uz, ru: $ru, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$SeasonModelCopyWith<$Res> implements $SeasonModelCopyWith<$Res> {
  factory _$SeasonModelCopyWith(_SeasonModel value, $Res Function(_SeasonModel) _then) = __$SeasonModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String? id, dynamic uz, dynamic ru, String? slug
});




}
/// @nodoc
class __$SeasonModelCopyWithImpl<$Res>
    implements _$SeasonModelCopyWith<$Res> {
  __$SeasonModelCopyWithImpl(this._self, this._then);

  final _SeasonModel _self;
  final $Res Function(_SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uz = freezed,Object? ru = freezed,Object? slug = freezed,}) {
  return _then(_SeasonModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
