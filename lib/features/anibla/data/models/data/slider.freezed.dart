// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Slider {

@HiveField(0)@JsonKey(name: "_id") String get id;@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) String get image;@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) String get mobileImage;@HiveField(3)@JsonKey(name: "media") Anime get anime;@HiveField(4)@JsonKey(name: "mediaType") AnimeType get type;
/// Create a copy of Slider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SliderCopyWith<Slider> get copyWith => _$SliderCopyWithImpl<Slider>(this as Slider, _$identity);

  /// Serializes this Slider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Slider&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.mobileImage, mobileImage) || other.mobileImage == mobileImage)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,mobileImage,anime,type);

@override
String toString() {
  return 'Slider(id: $id, image: $image, mobileImage: $mobileImage, anime: $anime, type: $type)';
}


}

/// @nodoc
abstract mixin class $SliderCopyWith<$Res>  {
  factory $SliderCopyWith(Slider value, $Res Function(Slider) _then) = _$SliderCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String id,@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) String image,@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) String mobileImage,@HiveField(3)@JsonKey(name: "media") Anime anime,@HiveField(4)@JsonKey(name: "mediaType") AnimeType type
});


$AnimeCopyWith<$Res> get anime;

}
/// @nodoc
class _$SliderCopyWithImpl<$Res>
    implements $SliderCopyWith<$Res> {
  _$SliderCopyWithImpl(this._self, this._then);

  final Slider _self;
  final $Res Function(Slider) _then;

/// Create a copy of Slider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? image = null,Object? mobileImage = null,Object? anime = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,mobileImage: null == mobileImage ? _self.mobileImage : mobileImage // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,
  ));
}
/// Create a copy of Slider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}


/// Adds pattern-matching-related methods to [Slider].
extension SliderPatterns on Slider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Slider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Slider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Slider value)  $default,){
final _that = this;
switch (_that) {
case _Slider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Slider value)?  $default,){
final _that = this;
switch (_that) {
case _Slider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl)  String image, @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl)  String mobileImage, @HiveField(3)@JsonKey(name: "media")  Anime anime, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Slider() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl)  String image, @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl)  String mobileImage, @HiveField(3)@JsonKey(name: "media")  Anime anime, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType type)  $default,) {final _that = this;
switch (_that) {
case _Slider():
return $default(_that.id,_that.image,_that.mobileImage,_that.anime,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl)  String image, @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl)  String mobileImage, @HiveField(3)@JsonKey(name: "media")  Anime anime, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType type)?  $default,) {final _that = this;
switch (_that) {
case _Slider() when $default != null:
return $default(_that.id,_that.image,_that.mobileImage,_that.anime,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Slider implements Slider {
  const _Slider({@HiveField(0)@JsonKey(name: "_id") this.id = "", @HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) this.image = "", @HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) this.mobileImage = "", @HiveField(3)@JsonKey(name: "media") this.anime = const Anime(), @HiveField(4)@JsonKey(name: "mediaType") this.type = AnimeType.movie});
  factory _Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String id;
@override@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) final  String image;
@override@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) final  String mobileImage;
@override@HiveField(3)@JsonKey(name: "media") final  Anime anime;
@override@HiveField(4)@JsonKey(name: "mediaType") final  AnimeType type;

/// Create a copy of Slider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SliderCopyWith<_Slider> get copyWith => __$SliderCopyWithImpl<_Slider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SliderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Slider&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.mobileImage, mobileImage) || other.mobileImage == mobileImage)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,mobileImage,anime,type);

@override
String toString() {
  return 'Slider(id: $id, image: $image, mobileImage: $mobileImage, anime: $anime, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SliderCopyWith<$Res> implements $SliderCopyWith<$Res> {
  factory _$SliderCopyWith(_Slider value, $Res Function(_Slider) _then) = __$SliderCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String id,@HiveField(1)@JsonKey(includeFromJson: true, fromJson: addBaseUrl) String image,@HiveField(2)@JsonKey(name: "mobile_image", includeFromJson: true, fromJson: addBaseUrl) String mobileImage,@HiveField(3)@JsonKey(name: "media") Anime anime,@HiveField(4)@JsonKey(name: "mediaType") AnimeType type
});


@override $AnimeCopyWith<$Res> get anime;

}
/// @nodoc
class __$SliderCopyWithImpl<$Res>
    implements _$SliderCopyWith<$Res> {
  __$SliderCopyWithImpl(this._self, this._then);

  final _Slider _self;
  final $Res Function(_Slider) _then;

/// Create a copy of Slider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? image = null,Object? mobileImage = null,Object? anime = null,Object? type = null,}) {
  return _then(_Slider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,mobileImage: null == mobileImage ? _self.mobileImage : mobileImage // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,
  ));
}

/// Create a copy of Slider
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
