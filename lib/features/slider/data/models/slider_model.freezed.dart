// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SliderModel {

@HiveField(0)@JsonKey(name: "_id") String? get id;@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) String? get image;@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) String? get mobileImage;@HiveField(3)@JsonKey(name: "media") AnimeModel? get anime;@HiveField(4)@JsonKey(name: "mediaType") AnimeType? get type;
/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SliderModelCopyWith<SliderModel> get copyWith => _$SliderModelCopyWithImpl<SliderModel>(this as SliderModel, _$identity);

  /// Serializes this SliderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.mobileImage, mobileImage) || other.mobileImage == mobileImage)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,mobileImage,anime,type);

@override
String toString() {
  return 'SliderModel(id: $id, image: $image, mobileImage: $mobileImage, anime: $anime, type: $type)';
}


}

/// @nodoc
abstract mixin class $SliderModelCopyWith<$Res>  {
  factory $SliderModelCopyWith(SliderModel value, $Res Function(SliderModel) _then) = _$SliderModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) String? image,@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) String? mobileImage,@HiveField(3)@JsonKey(name: "media") AnimeModel? anime,@HiveField(4)@JsonKey(name: "mediaType") AnimeType? type
});




}
/// @nodoc
class _$SliderModelCopyWithImpl<$Res>
    implements $SliderModelCopyWith<$Res> {
  _$SliderModelCopyWithImpl(this._self, this._then);

  final SliderModel _self;
  final $Res Function(SliderModel) _then;

/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? image = freezed,Object? mobileImage = freezed,Object? anime = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,mobileImage: freezed == mobileImage ? _self.mobileImage : mobileImage // ignore: cast_nullable_to_non_nullable
as String?,anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType?,
  ));
}

}


/// Adds pattern-matching-related methods to [SliderModel].
extension SliderModelPatterns on SliderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SliderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SliderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SliderModel value)  $default,){
final _that = this;
switch (_that) {
case _SliderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SliderModel value)?  $default,){
final _that = this;
switch (_that) {
case _SliderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl)  String? image, @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl)  String? mobileImage, @HiveField(3)@JsonKey(name: "media")  AnimeModel? anime, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SliderModel() when $default != null:
return $default(_that.id,_that.image,_that.mobileImage,_that.anime,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl)  String? image, @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl)  String? mobileImage, @HiveField(3)@JsonKey(name: "media")  AnimeModel? anime, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType? type)  $default,) {final _that = this;
switch (_that) {
case _SliderModel():
return $default(_that.id,_that.image,_that.mobileImage,_that.anime,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl)  String? image, @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl)  String? mobileImage, @HiveField(3)@JsonKey(name: "media")  AnimeModel? anime, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType? type)?  $default,) {final _that = this;
switch (_that) {
case _SliderModel() when $default != null:
return $default(_that.id,_that.image,_that.mobileImage,_that.anime,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SliderModel implements SliderModel {
   _SliderModel({@HiveField(0)@JsonKey(name: "_id") this.id, @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) this.image, @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) this.mobileImage, @HiveField(3)@JsonKey(name: "media") this.anime, @HiveField(4)@JsonKey(name: "mediaType") this.type});
  factory _SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String? id;
@override@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) final  String? image;
@override@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) final  String? mobileImage;
@override@HiveField(3)@JsonKey(name: "media") final  AnimeModel? anime;
@override@HiveField(4)@JsonKey(name: "mediaType") final  AnimeType? type;

/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SliderModelCopyWith<_SliderModel> get copyWith => __$SliderModelCopyWithImpl<_SliderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SliderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SliderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.mobileImage, mobileImage) || other.mobileImage == mobileImage)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,mobileImage,anime,type);

@override
String toString() {
  return 'SliderModel(id: $id, image: $image, mobileImage: $mobileImage, anime: $anime, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SliderModelCopyWith<$Res> implements $SliderModelCopyWith<$Res> {
  factory _$SliderModelCopyWith(_SliderModel value, $Res Function(_SliderModel) _then) = __$SliderModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) String? image,@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) String? mobileImage,@HiveField(3)@JsonKey(name: "media") AnimeModel? anime,@HiveField(4)@JsonKey(name: "mediaType") AnimeType? type
});




}
/// @nodoc
class __$SliderModelCopyWithImpl<$Res>
    implements _$SliderModelCopyWith<$Res> {
  __$SliderModelCopyWithImpl(this._self, this._then);

  final _SliderModel _self;
  final $Res Function(_SliderModel) _then;

/// Create a copy of SliderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? image = freezed,Object? mobileImage = freezed,Object? anime = freezed,Object? type = freezed,}) {
  return _then(_SliderModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,mobileImage: freezed == mobileImage ? _self.mobileImage : mobileImage // ignore: cast_nullable_to_non_nullable
as String?,anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType?,
  ));
}


}

// dart format on
