// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedModel {

@JsonKey(name: "_id") String? get id;@JsonKey(name: "user_id") String? get userId;@JsonKey(name: "media") AnimeModel? get anime;@JsonKey(name: "last_visited") DateTime? get lastVisitedAt;
/// Create a copy of SavedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedModelCopyWith<SavedModel> get copyWith => _$SavedModelCopyWithImpl<SavedModel>(this as SavedModel, _$identity);

  /// Serializes this SavedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.lastVisitedAt, lastVisitedAt) || other.lastVisitedAt == lastVisitedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,anime,lastVisitedAt);

@override
String toString() {
  return 'SavedModel(id: $id, userId: $userId, anime: $anime, lastVisitedAt: $lastVisitedAt)';
}


}

/// @nodoc
abstract mixin class $SavedModelCopyWith<$Res>  {
  factory $SavedModelCopyWith(SavedModel value, $Res Function(SavedModel) _then) = _$SavedModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String? id,@JsonKey(name: "user_id") String? userId,@JsonKey(name: "media") AnimeModel? anime,@JsonKey(name: "last_visited") DateTime? lastVisitedAt
});




}
/// @nodoc
class _$SavedModelCopyWithImpl<$Res>
    implements $SavedModelCopyWith<$Res> {
  _$SavedModelCopyWithImpl(this._self, this._then);

  final SavedModel _self;
  final $Res Function(SavedModel) _then;

/// Create a copy of SavedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? anime = freezed,Object? lastVisitedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,lastVisitedAt: freezed == lastVisitedAt ? _self.lastVisitedAt : lastVisitedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedModel].
extension SavedModelPatterns on SavedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedModel value)  $default,){
final _that = this;
switch (_that) {
case _SavedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedModel value)?  $default,){
final _that = this;
switch (_that) {
case _SavedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String? id, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "media")  AnimeModel? anime, @JsonKey(name: "last_visited")  DateTime? lastVisitedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedModel() when $default != null:
return $default(_that.id,_that.userId,_that.anime,_that.lastVisitedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String? id, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "media")  AnimeModel? anime, @JsonKey(name: "last_visited")  DateTime? lastVisitedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedModel():
return $default(_that.id,_that.userId,_that.anime,_that.lastVisitedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String? id, @JsonKey(name: "user_id")  String? userId, @JsonKey(name: "media")  AnimeModel? anime, @JsonKey(name: "last_visited")  DateTime? lastVisitedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedModel() when $default != null:
return $default(_that.id,_that.userId,_that.anime,_that.lastVisitedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedModel implements SavedModel {
   _SavedModel({@JsonKey(name: "_id") this.id, @JsonKey(name: "user_id") this.userId, @JsonKey(name: "media") this.anime, @JsonKey(name: "last_visited") this.lastVisitedAt});
  factory _SavedModel.fromJson(Map<String, dynamic> json) => _$SavedModelFromJson(json);

@override@JsonKey(name: "_id") final  String? id;
@override@JsonKey(name: "user_id") final  String? userId;
@override@JsonKey(name: "media") final  AnimeModel? anime;
@override@JsonKey(name: "last_visited") final  DateTime? lastVisitedAt;

/// Create a copy of SavedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedModelCopyWith<_SavedModel> get copyWith => __$SavedModelCopyWithImpl<_SavedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.lastVisitedAt, lastVisitedAt) || other.lastVisitedAt == lastVisitedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,anime,lastVisitedAt);

@override
String toString() {
  return 'SavedModel(id: $id, userId: $userId, anime: $anime, lastVisitedAt: $lastVisitedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedModelCopyWith<$Res> implements $SavedModelCopyWith<$Res> {
  factory _$SavedModelCopyWith(_SavedModel value, $Res Function(_SavedModel) _then) = __$SavedModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String? id,@JsonKey(name: "user_id") String? userId,@JsonKey(name: "media") AnimeModel? anime,@JsonKey(name: "last_visited") DateTime? lastVisitedAt
});




}
/// @nodoc
class __$SavedModelCopyWithImpl<$Res>
    implements _$SavedModelCopyWith<$Res> {
  __$SavedModelCopyWithImpl(this._self, this._then);

  final _SavedModel _self;
  final $Res Function(_SavedModel) _then;

/// Create a copy of SavedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? anime = freezed,Object? lastVisitedAt = freezed,}) {
  return _then(_SavedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,lastVisitedAt: freezed == lastVisitedAt ? _self.lastVisitedAt : lastVisitedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
