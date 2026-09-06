// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeModel {

@HiveField(0)@JsonKey(name: "_id") String? get id;@HiveField(1) dynamic get uz;@HiveField(2) dynamic get ru;@HiveField(3) String? get slug;@HiveField(4)@JsonKey(name: "episode_number") int? get episodeNumber;@HiveField(5) String? get type;@HiveField(6) String? get video;
/// Create a copy of EpisodeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeModelCopyWith<EpisodeModel> get copyWith => _$EpisodeModelCopyWithImpl<EpisodeModel>(this as EpisodeModel, _$identity);

  /// Serializes this EpisodeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug,episodeNumber,type,video);

@override
String toString() {
  return 'EpisodeModel(id: $id, uz: $uz, ru: $ru, slug: $slug, episodeNumber: $episodeNumber, type: $type, video: $video)';
}


}

/// @nodoc
abstract mixin class $EpisodeModelCopyWith<$Res>  {
  factory $EpisodeModelCopyWith(EpisodeModel value, $Res Function(EpisodeModel) _then) = _$EpisodeModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1) dynamic uz,@HiveField(2) dynamic ru,@HiveField(3) String? slug,@HiveField(4)@JsonKey(name: "episode_number") int? episodeNumber,@HiveField(5) String? type,@HiveField(6) String? video
});




}
/// @nodoc
class _$EpisodeModelCopyWithImpl<$Res>
    implements $EpisodeModelCopyWith<$Res> {
  _$EpisodeModelCopyWithImpl(this._self, this._then);

  final EpisodeModel _self;
  final $Res Function(EpisodeModel) _then;

/// Create a copy of EpisodeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uz = freezed,Object? ru = freezed,Object? slug = freezed,Object? episodeNumber = freezed,Object? type = freezed,Object? video = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeModel].
extension EpisodeModelPatterns on EpisodeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeModel value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  dynamic uz, @HiveField(2)  dynamic ru, @HiveField(3)  String? slug, @HiveField(4)@JsonKey(name: "episode_number")  int? episodeNumber, @HiveField(5)  String? type, @HiveField(6)  String? video)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeModel() when $default != null:
return $default(_that.id,_that.uz,_that.ru,_that.slug,_that.episodeNumber,_that.type,_that.video);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  dynamic uz, @HiveField(2)  dynamic ru, @HiveField(3)  String? slug, @HiveField(4)@JsonKey(name: "episode_number")  int? episodeNumber, @HiveField(5)  String? type, @HiveField(6)  String? video)  $default,) {final _that = this;
switch (_that) {
case _EpisodeModel():
return $default(_that.id,_that.uz,_that.ru,_that.slug,_that.episodeNumber,_that.type,_that.video);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  dynamic uz, @HiveField(2)  dynamic ru, @HiveField(3)  String? slug, @HiveField(4)@JsonKey(name: "episode_number")  int? episodeNumber, @HiveField(5)  String? type, @HiveField(6)  String? video)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeModel() when $default != null:
return $default(_that.id,_that.uz,_that.ru,_that.slug,_that.episodeNumber,_that.type,_that.video);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodeModel extends EpisodeModel {
   _EpisodeModel({@HiveField(0)@JsonKey(name: "_id") this.id, @HiveField(1) this.uz, @HiveField(2) this.ru, @HiveField(3) this.slug, @HiveField(4)@JsonKey(name: "episode_number") this.episodeNumber, @HiveField(5) this.type, @HiveField(6) this.video}): super._();
  factory _EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String? id;
@override@HiveField(1) final  dynamic uz;
@override@HiveField(2) final  dynamic ru;
@override@HiveField(3) final  String? slug;
@override@HiveField(4)@JsonKey(name: "episode_number") final  int? episodeNumber;
@override@HiveField(5) final  String? type;
@override@HiveField(6) final  String? video;

/// Create a copy of EpisodeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeModelCopyWith<_EpisodeModel> get copyWith => __$EpisodeModelCopyWithImpl<_EpisodeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug,episodeNumber,type,video);

@override
String toString() {
  return 'EpisodeModel(id: $id, uz: $uz, ru: $ru, slug: $slug, episodeNumber: $episodeNumber, type: $type, video: $video)';
}


}

/// @nodoc
abstract mixin class _$EpisodeModelCopyWith<$Res> implements $EpisodeModelCopyWith<$Res> {
  factory _$EpisodeModelCopyWith(_EpisodeModel value, $Res Function(_EpisodeModel) _then) = __$EpisodeModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1) dynamic uz,@HiveField(2) dynamic ru,@HiveField(3) String? slug,@HiveField(4)@JsonKey(name: "episode_number") int? episodeNumber,@HiveField(5) String? type,@HiveField(6) String? video
});




}
/// @nodoc
class __$EpisodeModelCopyWithImpl<$Res>
    implements _$EpisodeModelCopyWith<$Res> {
  __$EpisodeModelCopyWithImpl(this._self, this._then);

  final _EpisodeModel _self;
  final $Res Function(_EpisodeModel) _then;

/// Create a copy of EpisodeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uz = freezed,Object? ru = freezed,Object? slug = freezed,Object? episodeNumber = freezed,Object? type = freezed,Object? video = freezed,}) {
  return _then(_EpisodeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
