// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ep_notif_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeNotificationModel {

@HiveField(0) String? get seriesId;@HiveField(1) String? get seasonId;@HiveField(2) String? get episodeId;@HiveField(3) String? get seriesName;@HiveField(4) String? get seasonNumber;@HiveField(5) String? get episodeNumber;@HiveField(6) String? get mediaId;@HiveField(7) String? get mediaType;@HiveField(8) String? get seasonIndex;@HiveField(9) String? get episodeIndex;@HiveField(10) String? get seasonRouteIndex;@HiveField(11) String? get episodeRouteIndex;@HiveField(12) String? get mediaSlug;@HiveField(13) String? get imageUrl;@HiveField(14) String? get image;
/// Create a copy of EpisodeNotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeNotificationModelCopyWith<EpisodeNotificationModel> get copyWith => _$EpisodeNotificationModelCopyWithImpl<EpisodeNotificationModel>(this as EpisodeNotificationModel, _$identity);

  /// Serializes this EpisodeNotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeNotificationModel&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.seasonIndex, seasonIndex) || other.seasonIndex == seasonIndex)&&(identical(other.episodeIndex, episodeIndex) || other.episodeIndex == episodeIndex)&&(identical(other.seasonRouteIndex, seasonRouteIndex) || other.seasonRouteIndex == seasonRouteIndex)&&(identical(other.episodeRouteIndex, episodeRouteIndex) || other.episodeRouteIndex == episodeRouteIndex)&&(identical(other.mediaSlug, mediaSlug) || other.mediaSlug == mediaSlug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seriesId,seasonId,episodeId,seriesName,seasonNumber,episodeNumber,mediaId,mediaType,seasonIndex,episodeIndex,seasonRouteIndex,episodeRouteIndex,mediaSlug,imageUrl,image);

@override
String toString() {
  return 'EpisodeNotificationModel(seriesId: $seriesId, seasonId: $seasonId, episodeId: $episodeId, seriesName: $seriesName, seasonNumber: $seasonNumber, episodeNumber: $episodeNumber, mediaId: $mediaId, mediaType: $mediaType, seasonIndex: $seasonIndex, episodeIndex: $episodeIndex, seasonRouteIndex: $seasonRouteIndex, episodeRouteIndex: $episodeRouteIndex, mediaSlug: $mediaSlug, imageUrl: $imageUrl, image: $image)';
}


}

/// @nodoc
abstract mixin class $EpisodeNotificationModelCopyWith<$Res>  {
  factory $EpisodeNotificationModelCopyWith(EpisodeNotificationModel value, $Res Function(EpisodeNotificationModel) _then) = _$EpisodeNotificationModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String? seriesId,@HiveField(1) String? seasonId,@HiveField(2) String? episodeId,@HiveField(3) String? seriesName,@HiveField(4) String? seasonNumber,@HiveField(5) String? episodeNumber,@HiveField(6) String? mediaId,@HiveField(7) String? mediaType,@HiveField(8) String? seasonIndex,@HiveField(9) String? episodeIndex,@HiveField(10) String? seasonRouteIndex,@HiveField(11) String? episodeRouteIndex,@HiveField(12) String? mediaSlug,@HiveField(13) String? imageUrl,@HiveField(14) String? image
});




}
/// @nodoc
class _$EpisodeNotificationModelCopyWithImpl<$Res>
    implements $EpisodeNotificationModelCopyWith<$Res> {
  _$EpisodeNotificationModelCopyWithImpl(this._self, this._then);

  final EpisodeNotificationModel _self;
  final $Res Function(EpisodeNotificationModel) _then;

/// Create a copy of EpisodeNotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seriesId = freezed,Object? seasonId = freezed,Object? episodeId = freezed,Object? seriesName = freezed,Object? seasonNumber = freezed,Object? episodeNumber = freezed,Object? mediaId = freezed,Object? mediaType = freezed,Object? seasonIndex = freezed,Object? episodeIndex = freezed,Object? seasonRouteIndex = freezed,Object? episodeRouteIndex = freezed,Object? mediaSlug = freezed,Object? imageUrl = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
seriesId: freezed == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as String?,seasonId: freezed == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as String?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as String?,mediaId: freezed == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,seasonIndex: freezed == seasonIndex ? _self.seasonIndex : seasonIndex // ignore: cast_nullable_to_non_nullable
as String?,episodeIndex: freezed == episodeIndex ? _self.episodeIndex : episodeIndex // ignore: cast_nullable_to_non_nullable
as String?,seasonRouteIndex: freezed == seasonRouteIndex ? _self.seasonRouteIndex : seasonRouteIndex // ignore: cast_nullable_to_non_nullable
as String?,episodeRouteIndex: freezed == episodeRouteIndex ? _self.episodeRouteIndex : episodeRouteIndex // ignore: cast_nullable_to_non_nullable
as String?,mediaSlug: freezed == mediaSlug ? _self.mediaSlug : mediaSlug // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeNotificationModel].
extension EpisodeNotificationModelPatterns on EpisodeNotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeNotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeNotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeNotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeNotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeNotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeNotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String? seriesId, @HiveField(1)  String? seasonId, @HiveField(2)  String? episodeId, @HiveField(3)  String? seriesName, @HiveField(4)  String? seasonNumber, @HiveField(5)  String? episodeNumber, @HiveField(6)  String? mediaId, @HiveField(7)  String? mediaType, @HiveField(8)  String? seasonIndex, @HiveField(9)  String? episodeIndex, @HiveField(10)  String? seasonRouteIndex, @HiveField(11)  String? episodeRouteIndex, @HiveField(12)  String? mediaSlug, @HiveField(13)  String? imageUrl, @HiveField(14)  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeNotificationModel() when $default != null:
return $default(_that.seriesId,_that.seasonId,_that.episodeId,_that.seriesName,_that.seasonNumber,_that.episodeNumber,_that.mediaId,_that.mediaType,_that.seasonIndex,_that.episodeIndex,_that.seasonRouteIndex,_that.episodeRouteIndex,_that.mediaSlug,_that.imageUrl,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String? seriesId, @HiveField(1)  String? seasonId, @HiveField(2)  String? episodeId, @HiveField(3)  String? seriesName, @HiveField(4)  String? seasonNumber, @HiveField(5)  String? episodeNumber, @HiveField(6)  String? mediaId, @HiveField(7)  String? mediaType, @HiveField(8)  String? seasonIndex, @HiveField(9)  String? episodeIndex, @HiveField(10)  String? seasonRouteIndex, @HiveField(11)  String? episodeRouteIndex, @HiveField(12)  String? mediaSlug, @HiveField(13)  String? imageUrl, @HiveField(14)  String? image)  $default,) {final _that = this;
switch (_that) {
case _EpisodeNotificationModel():
return $default(_that.seriesId,_that.seasonId,_that.episodeId,_that.seriesName,_that.seasonNumber,_that.episodeNumber,_that.mediaId,_that.mediaType,_that.seasonIndex,_that.episodeIndex,_that.seasonRouteIndex,_that.episodeRouteIndex,_that.mediaSlug,_that.imageUrl,_that.image);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String? seriesId, @HiveField(1)  String? seasonId, @HiveField(2)  String? episodeId, @HiveField(3)  String? seriesName, @HiveField(4)  String? seasonNumber, @HiveField(5)  String? episodeNumber, @HiveField(6)  String? mediaId, @HiveField(7)  String? mediaType, @HiveField(8)  String? seasonIndex, @HiveField(9)  String? episodeIndex, @HiveField(10)  String? seasonRouteIndex, @HiveField(11)  String? episodeRouteIndex, @HiveField(12)  String? mediaSlug, @HiveField(13)  String? imageUrl, @HiveField(14)  String? image)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeNotificationModel() when $default != null:
return $default(_that.seriesId,_that.seasonId,_that.episodeId,_that.seriesName,_that.seasonNumber,_that.episodeNumber,_that.mediaId,_that.mediaType,_that.seasonIndex,_that.episodeIndex,_that.seasonRouteIndex,_that.episodeRouteIndex,_that.mediaSlug,_that.imageUrl,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodeNotificationModel implements EpisodeNotificationModel {
   _EpisodeNotificationModel({@HiveField(0) this.seriesId, @HiveField(1) this.seasonId, @HiveField(2) this.episodeId, @HiveField(3) this.seriesName, @HiveField(4) this.seasonNumber, @HiveField(5) this.episodeNumber, @HiveField(6) this.mediaId, @HiveField(7) this.mediaType, @HiveField(8) this.seasonIndex, @HiveField(9) this.episodeIndex, @HiveField(10) this.seasonRouteIndex, @HiveField(11) this.episodeRouteIndex, @HiveField(12) this.mediaSlug, @HiveField(13) this.imageUrl, @HiveField(14) this.image});
  factory _EpisodeNotificationModel.fromJson(Map<String, dynamic> json) => _$EpisodeNotificationModelFromJson(json);

@override@HiveField(0) final  String? seriesId;
@override@HiveField(1) final  String? seasonId;
@override@HiveField(2) final  String? episodeId;
@override@HiveField(3) final  String? seriesName;
@override@HiveField(4) final  String? seasonNumber;
@override@HiveField(5) final  String? episodeNumber;
@override@HiveField(6) final  String? mediaId;
@override@HiveField(7) final  String? mediaType;
@override@HiveField(8) final  String? seasonIndex;
@override@HiveField(9) final  String? episodeIndex;
@override@HiveField(10) final  String? seasonRouteIndex;
@override@HiveField(11) final  String? episodeRouteIndex;
@override@HiveField(12) final  String? mediaSlug;
@override@HiveField(13) final  String? imageUrl;
@override@HiveField(14) final  String? image;

/// Create a copy of EpisodeNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeNotificationModelCopyWith<_EpisodeNotificationModel> get copyWith => __$EpisodeNotificationModelCopyWithImpl<_EpisodeNotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeNotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeNotificationModel&&(identical(other.seriesId, seriesId) || other.seriesId == seriesId)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.seasonIndex, seasonIndex) || other.seasonIndex == seasonIndex)&&(identical(other.episodeIndex, episodeIndex) || other.episodeIndex == episodeIndex)&&(identical(other.seasonRouteIndex, seasonRouteIndex) || other.seasonRouteIndex == seasonRouteIndex)&&(identical(other.episodeRouteIndex, episodeRouteIndex) || other.episodeRouteIndex == episodeRouteIndex)&&(identical(other.mediaSlug, mediaSlug) || other.mediaSlug == mediaSlug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seriesId,seasonId,episodeId,seriesName,seasonNumber,episodeNumber,mediaId,mediaType,seasonIndex,episodeIndex,seasonRouteIndex,episodeRouteIndex,mediaSlug,imageUrl,image);

@override
String toString() {
  return 'EpisodeNotificationModel(seriesId: $seriesId, seasonId: $seasonId, episodeId: $episodeId, seriesName: $seriesName, seasonNumber: $seasonNumber, episodeNumber: $episodeNumber, mediaId: $mediaId, mediaType: $mediaType, seasonIndex: $seasonIndex, episodeIndex: $episodeIndex, seasonRouteIndex: $seasonRouteIndex, episodeRouteIndex: $episodeRouteIndex, mediaSlug: $mediaSlug, imageUrl: $imageUrl, image: $image)';
}


}

/// @nodoc
abstract mixin class _$EpisodeNotificationModelCopyWith<$Res> implements $EpisodeNotificationModelCopyWith<$Res> {
  factory _$EpisodeNotificationModelCopyWith(_EpisodeNotificationModel value, $Res Function(_EpisodeNotificationModel) _then) = __$EpisodeNotificationModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String? seriesId,@HiveField(1) String? seasonId,@HiveField(2) String? episodeId,@HiveField(3) String? seriesName,@HiveField(4) String? seasonNumber,@HiveField(5) String? episodeNumber,@HiveField(6) String? mediaId,@HiveField(7) String? mediaType,@HiveField(8) String? seasonIndex,@HiveField(9) String? episodeIndex,@HiveField(10) String? seasonRouteIndex,@HiveField(11) String? episodeRouteIndex,@HiveField(12) String? mediaSlug,@HiveField(13) String? imageUrl,@HiveField(14) String? image
});




}
/// @nodoc
class __$EpisodeNotificationModelCopyWithImpl<$Res>
    implements _$EpisodeNotificationModelCopyWith<$Res> {
  __$EpisodeNotificationModelCopyWithImpl(this._self, this._then);

  final _EpisodeNotificationModel _self;
  final $Res Function(_EpisodeNotificationModel) _then;

/// Create a copy of EpisodeNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seriesId = freezed,Object? seasonId = freezed,Object? episodeId = freezed,Object? seriesName = freezed,Object? seasonNumber = freezed,Object? episodeNumber = freezed,Object? mediaId = freezed,Object? mediaType = freezed,Object? seasonIndex = freezed,Object? episodeIndex = freezed,Object? seasonRouteIndex = freezed,Object? episodeRouteIndex = freezed,Object? mediaSlug = freezed,Object? imageUrl = freezed,Object? image = freezed,}) {
  return _then(_EpisodeNotificationModel(
seriesId: freezed == seriesId ? _self.seriesId : seriesId // ignore: cast_nullable_to_non_nullable
as String?,seasonId: freezed == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as String?,episodeNumber: freezed == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as String?,mediaId: freezed == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,seasonIndex: freezed == seasonIndex ? _self.seasonIndex : seasonIndex // ignore: cast_nullable_to_non_nullable
as String?,episodeIndex: freezed == episodeIndex ? _self.episodeIndex : episodeIndex // ignore: cast_nullable_to_non_nullable
as String?,seasonRouteIndex: freezed == seasonRouteIndex ? _self.seasonRouteIndex : seasonRouteIndex // ignore: cast_nullable_to_non_nullable
as String?,episodeRouteIndex: freezed == episodeRouteIndex ? _self.episodeRouteIndex : episodeRouteIndex // ignore: cast_nullable_to_non_nullable
as String?,mediaSlug: freezed == mediaSlug ? _self.mediaSlug : mediaSlug // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
