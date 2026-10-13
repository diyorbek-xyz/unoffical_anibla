// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ManoBanner _$ManoBannerFromJson(
  Map<String, dynamic> json
) {
    return _ManoCategory.fromJson(
      json
    );
}

/// @nodoc
mixin _$ManoBanner {

@HiveField(0) String get id;@HiveField(1) String get description;@HiveField(2)@JsonKey(name: "image_link") String get imageLink;@HiveField(3)@JsonKey(name: "content_type") MediaType get type;
/// Create a copy of ManoBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoBannerCopyWith<ManoBanner> get copyWith => _$ManoBannerCopyWithImpl<ManoBanner>(this as ManoBanner, _$identity);

  /// Serializes this ManoBanner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageLink, imageLink) || other.imageLink == imageLink)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,imageLink,type);

@override
String toString() {
  return 'ManoBanner(id: $id, description: $description, imageLink: $imageLink, type: $type)';
}


}

/// @nodoc
abstract mixin class $ManoBannerCopyWith<$Res>  {
  factory $ManoBannerCopyWith(ManoBanner value, $Res Function(ManoBanner) _then) = _$ManoBannerCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String description,@HiveField(2)@JsonKey(name: "image_link") String imageLink,@HiveField(3)@JsonKey(name: "content_type") MediaType type
});




}
/// @nodoc
class _$ManoBannerCopyWithImpl<$Res>
    implements $ManoBannerCopyWith<$Res> {
  _$ManoBannerCopyWithImpl(this._self, this._then);

  final ManoBanner _self;
  final $Res Function(ManoBanner) _then;

/// Create a copy of ManoBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? imageLink = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageLink: null == imageLink ? _self.imageLink : imageLink // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoBanner].
extension ManoBannerPatterns on ManoBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoCategory value)  $default,){
final _that = this;
switch (_that) {
case _ManoCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String description, @HiveField(2)@JsonKey(name: "image_link")  String imageLink, @HiveField(3)@JsonKey(name: "content_type")  MediaType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
return $default(_that.id,_that.description,_that.imageLink,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String description, @HiveField(2)@JsonKey(name: "image_link")  String imageLink, @HiveField(3)@JsonKey(name: "content_type")  MediaType type)  $default,) {final _that = this;
switch (_that) {
case _ManoCategory():
return $default(_that.id,_that.description,_that.imageLink,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String description, @HiveField(2)@JsonKey(name: "image_link")  String imageLink, @HiveField(3)@JsonKey(name: "content_type")  MediaType type)?  $default,) {final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
return $default(_that.id,_that.description,_that.imageLink,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoCategory implements ManoBanner {
  const _ManoCategory({@HiveField(0) this.id = "", @HiveField(1) this.description = "", @HiveField(2)@JsonKey(name: "image_link") this.imageLink = "", @HiveField(3)@JsonKey(name: "content_type") this.type = MediaType.manga});
  factory _ManoCategory.fromJson(Map<String, dynamic> json) => _$ManoCategoryFromJson(json);

@override@JsonKey()@HiveField(0) final  String id;
@override@JsonKey()@HiveField(1) final  String description;
@override@HiveField(2)@JsonKey(name: "image_link") final  String imageLink;
@override@HiveField(3)@JsonKey(name: "content_type") final  MediaType type;

/// Create a copy of ManoBanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoCategoryCopyWith<_ManoCategory> get copyWith => __$ManoCategoryCopyWithImpl<_ManoCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageLink, imageLink) || other.imageLink == imageLink)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,imageLink,type);

@override
String toString() {
  return 'ManoBanner(id: $id, description: $description, imageLink: $imageLink, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ManoCategoryCopyWith<$Res> implements $ManoBannerCopyWith<$Res> {
  factory _$ManoCategoryCopyWith(_ManoCategory value, $Res Function(_ManoCategory) _then) = __$ManoCategoryCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String description,@HiveField(2)@JsonKey(name: "image_link") String imageLink,@HiveField(3)@JsonKey(name: "content_type") MediaType type
});




}
/// @nodoc
class __$ManoCategoryCopyWithImpl<$Res>
    implements _$ManoCategoryCopyWith<$Res> {
  __$ManoCategoryCopyWithImpl(this._self, this._then);

  final _ManoCategory _self;
  final $Res Function(_ManoCategory) _then;

/// Create a copy of ManoBanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? imageLink = null,Object? type = null,}) {
  return _then(_ManoCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageLink: null == imageLink ? _self.imageLink : imageLink // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}


}

// dart format on
