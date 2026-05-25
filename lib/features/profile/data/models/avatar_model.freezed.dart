// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvatarModel {

@HiveField(0)@JsonKey(name: "_id") String? get id;@HiveField(1) String? get avatar;@HiveField(2) DateTime? get createdAt;@HiveField(3) DateTime? get updatedAt;
/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvatarModelCopyWith<AvatarModel> get copyWith => _$AvatarModelCopyWithImpl<AvatarModel>(this as AvatarModel, _$identity);

  /// Serializes this AvatarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvatarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,createdAt,updatedAt);

@override
String toString() {
  return 'AvatarModel(id: $id, avatar: $avatar, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AvatarModelCopyWith<$Res>  {
  factory $AvatarModelCopyWith(AvatarModel value, $Res Function(AvatarModel) _then) = _$AvatarModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1) String? avatar,@HiveField(2) DateTime? createdAt,@HiveField(3) DateTime? updatedAt
});




}
/// @nodoc
class _$AvatarModelCopyWithImpl<$Res>
    implements $AvatarModelCopyWith<$Res> {
  _$AvatarModelCopyWithImpl(this._self, this._then);

  final AvatarModel _self;
  final $Res Function(AvatarModel) _then;

/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? avatar = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvatarModel].
extension AvatarModelPatterns on AvatarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvatarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvatarModel value)  $default,){
final _that = this;
switch (_that) {
case _AvatarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvatarModel value)?  $default,){
final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  String? avatar, @HiveField(2)  DateTime? createdAt, @HiveField(3)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
return $default(_that.id,_that.avatar,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  String? avatar, @HiveField(2)  DateTime? createdAt, @HiveField(3)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AvatarModel():
return $default(_that.id,_that.avatar,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  String? avatar, @HiveField(2)  DateTime? createdAt, @HiveField(3)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
return $default(_that.id,_that.avatar,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvatarModel implements AvatarModel {
   _AvatarModel({@HiveField(0)@JsonKey(name: "_id") this.id, @HiveField(1) this.avatar, @HiveField(2) this.createdAt, @HiveField(3) this.updatedAt});
  factory _AvatarModel.fromJson(Map<String, dynamic> json) => _$AvatarModelFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String? id;
@override@HiveField(1) final  String? avatar;
@override@HiveField(2) final  DateTime? createdAt;
@override@HiveField(3) final  DateTime? updatedAt;

/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvatarModelCopyWith<_AvatarModel> get copyWith => __$AvatarModelCopyWithImpl<_AvatarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvatarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvatarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avatar,createdAt,updatedAt);

@override
String toString() {
  return 'AvatarModel(id: $id, avatar: $avatar, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AvatarModelCopyWith<$Res> implements $AvatarModelCopyWith<$Res> {
  factory _$AvatarModelCopyWith(_AvatarModel value, $Res Function(_AvatarModel) _then) = __$AvatarModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1) String? avatar,@HiveField(2) DateTime? createdAt,@HiveField(3) DateTime? updatedAt
});




}
/// @nodoc
class __$AvatarModelCopyWithImpl<$Res>
    implements _$AvatarModelCopyWith<$Res> {
  __$AvatarModelCopyWithImpl(this._self, this._then);

  final _AvatarModel _self;
  final $Res Function(_AvatarModel) _then;

/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? avatar = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AvatarModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
