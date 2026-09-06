// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completed_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadInfos {

@HiveField(0) DateTime? get downloadedAt;@HiveField(1) int get size;@HiveField(2) String get downloadUrl;@HiveField(4) AnimeModel get animeModel;@HiveField(5) SeasonModel get seasonModel;@HiveField(6) EpisodeModel get episodeModel;@HiveField(7) String get localPath;@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? get masterPlaylist;@JsonKey(includeFromJson: false, includeToJson: false) Variant? get variant;
/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadInfosCopyWith<DownloadInfos> get copyWith => _$DownloadInfosCopyWithImpl<DownloadInfos>(this as DownloadInfos, _$identity);

  /// Serializes this DownloadInfos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadInfos&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.animeModel, animeModel) || other.animeModel == animeModel)&&(identical(other.seasonModel, seasonModel) || other.seasonModel == seasonModel)&&(identical(other.episodeModel, episodeModel) || other.episodeModel == episodeModel)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.variant, variant) || other.variant == variant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,downloadedAt,size,downloadUrl,animeModel,seasonModel,episodeModel,localPath,masterPlaylist,variant);

@override
String toString() {
  return 'DownloadInfos(downloadedAt: $downloadedAt, size: $size, downloadUrl: $downloadUrl, animeModel: $animeModel, seasonModel: $seasonModel, episodeModel: $episodeModel, localPath: $localPath, masterPlaylist: $masterPlaylist, variant: $variant)';
}


}

/// @nodoc
abstract mixin class $DownloadInfosCopyWith<$Res>  {
  factory $DownloadInfosCopyWith(DownloadInfos value, $Res Function(DownloadInfos) _then) = _$DownloadInfosCopyWithImpl;
@useResult
$Res call({
@HiveField(0) DateTime? downloadedAt,@HiveField(1) int size,@HiveField(2) String downloadUrl,@HiveField(4) AnimeModel animeModel,@HiveField(5) SeasonModel seasonModel,@HiveField(6) EpisodeModel episodeModel,@HiveField(7) String localPath,@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? masterPlaylist,@JsonKey(includeFromJson: false, includeToJson: false) Variant? variant
});


$AnimeModelCopyWith<$Res> get animeModel;$SeasonModelCopyWith<$Res> get seasonModel;$EpisodeModelCopyWith<$Res> get episodeModel;$MasterPlaylistCopyWith<$Res>? get masterPlaylist;$VariantCopyWith<$Res>? get variant;

}
/// @nodoc
class _$DownloadInfosCopyWithImpl<$Res>
    implements $DownloadInfosCopyWith<$Res> {
  _$DownloadInfosCopyWithImpl(this._self, this._then);

  final DownloadInfos _self;
  final $Res Function(DownloadInfos) _then;

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downloadedAt = freezed,Object? size = null,Object? downloadUrl = null,Object? animeModel = null,Object? seasonModel = null,Object? episodeModel = null,Object? localPath = null,Object? masterPlaylist = freezed,Object? variant = freezed,}) {
  return _then(_self.copyWith(
downloadedAt: freezed == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,animeModel: null == animeModel ? _self.animeModel : animeModel // ignore: cast_nullable_to_non_nullable
as AnimeModel,seasonModel: null == seasonModel ? _self.seasonModel : seasonModel // ignore: cast_nullable_to_non_nullable
as SeasonModel,episodeModel: null == episodeModel ? _self.episodeModel : episodeModel // ignore: cast_nullable_to_non_nullable
as EpisodeModel,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,masterPlaylist: freezed == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Variant?,
  ));
}
/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeModelCopyWith<$Res> get animeModel {
  
  return $AnimeModelCopyWith<$Res>(_self.animeModel, (value) {
    return _then(_self.copyWith(animeModel: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonModelCopyWith<$Res> get seasonModel {
  
  return $SeasonModelCopyWith<$Res>(_self.seasonModel, (value) {
    return _then(_self.copyWith(seasonModel: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeModelCopyWith<$Res> get episodeModel {
  
  return $EpisodeModelCopyWith<$Res>(_self.episodeModel, (value) {
    return _then(_self.copyWith(episodeModel: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterPlaylistCopyWith<$Res>? get masterPlaylist {
    if (_self.masterPlaylist == null) {
    return null;
  }

  return $MasterPlaylistCopyWith<$Res>(_self.masterPlaylist!, (value) {
    return _then(_self.copyWith(masterPlaylist: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantCopyWith<$Res>? get variant {
    if (_self.variant == null) {
    return null;
  }

  return $VariantCopyWith<$Res>(_self.variant!, (value) {
    return _then(_self.copyWith(variant: value));
  });
}
}


/// Adds pattern-matching-related methods to [DownloadInfos].
extension DownloadInfosPatterns on DownloadInfos {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadInfos value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadInfos value)  $default,){
final _that = this;
switch (_that) {
case _DownloadInfos():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadInfos value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  DateTime? downloadedAt, @HiveField(1)  int size, @HiveField(2)  String downloadUrl, @HiveField(4)  AnimeModel animeModel, @HiveField(5)  SeasonModel seasonModel, @HiveField(6)  EpisodeModel episodeModel, @HiveField(7)  String localPath, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
return $default(_that.downloadedAt,_that.size,_that.downloadUrl,_that.animeModel,_that.seasonModel,_that.episodeModel,_that.localPath,_that.masterPlaylist,_that.variant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  DateTime? downloadedAt, @HiveField(1)  int size, @HiveField(2)  String downloadUrl, @HiveField(4)  AnimeModel animeModel, @HiveField(5)  SeasonModel seasonModel, @HiveField(6)  EpisodeModel episodeModel, @HiveField(7)  String localPath, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)  $default,) {final _that = this;
switch (_that) {
case _DownloadInfos():
return $default(_that.downloadedAt,_that.size,_that.downloadUrl,_that.animeModel,_that.seasonModel,_that.episodeModel,_that.localPath,_that.masterPlaylist,_that.variant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  DateTime? downloadedAt, @HiveField(1)  int size, @HiveField(2)  String downloadUrl, @HiveField(4)  AnimeModel animeModel, @HiveField(5)  SeasonModel seasonModel, @HiveField(6)  EpisodeModel episodeModel, @HiveField(7)  String localPath, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)?  $default,) {final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
return $default(_that.downloadedAt,_that.size,_that.downloadUrl,_that.animeModel,_that.seasonModel,_that.episodeModel,_that.localPath,_that.masterPlaylist,_that.variant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadInfos extends DownloadInfos {
   _DownloadInfos({@HiveField(0) this.downloadedAt, @HiveField(1) required this.size, @HiveField(2) required this.downloadUrl, @HiveField(4) required this.animeModel, @HiveField(5) required this.seasonModel, @HiveField(6) required this.episodeModel, @HiveField(7) this.localPath = "", @JsonKey(includeFromJson: false, includeToJson: false) this.masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false) this.variant}): super._();
  factory _DownloadInfos.fromJson(Map<String, dynamic> json) => _$DownloadInfosFromJson(json);

@override@HiveField(0) final  DateTime? downloadedAt;
@override@HiveField(1) final  int size;
@override@HiveField(2) final  String downloadUrl;
@override@HiveField(4) final  AnimeModel animeModel;
@override@HiveField(5) final  SeasonModel seasonModel;
@override@HiveField(6) final  EpisodeModel episodeModel;
@override@JsonKey()@HiveField(7) final  String localPath;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  MasterPlaylist? masterPlaylist;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  Variant? variant;

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadInfosCopyWith<_DownloadInfos> get copyWith => __$DownloadInfosCopyWithImpl<_DownloadInfos>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadInfosToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadInfos&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.animeModel, animeModel) || other.animeModel == animeModel)&&(identical(other.seasonModel, seasonModel) || other.seasonModel == seasonModel)&&(identical(other.episodeModel, episodeModel) || other.episodeModel == episodeModel)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.variant, variant) || other.variant == variant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,downloadedAt,size,downloadUrl,animeModel,seasonModel,episodeModel,localPath,masterPlaylist,variant);

@override
String toString() {
  return 'DownloadInfos(downloadedAt: $downloadedAt, size: $size, downloadUrl: $downloadUrl, animeModel: $animeModel, seasonModel: $seasonModel, episodeModel: $episodeModel, localPath: $localPath, masterPlaylist: $masterPlaylist, variant: $variant)';
}


}

/// @nodoc
abstract mixin class _$DownloadInfosCopyWith<$Res> implements $DownloadInfosCopyWith<$Res> {
  factory _$DownloadInfosCopyWith(_DownloadInfos value, $Res Function(_DownloadInfos) _then) = __$DownloadInfosCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) DateTime? downloadedAt,@HiveField(1) int size,@HiveField(2) String downloadUrl,@HiveField(4) AnimeModel animeModel,@HiveField(5) SeasonModel seasonModel,@HiveField(6) EpisodeModel episodeModel,@HiveField(7) String localPath,@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? masterPlaylist,@JsonKey(includeFromJson: false, includeToJson: false) Variant? variant
});


@override $AnimeModelCopyWith<$Res> get animeModel;@override $SeasonModelCopyWith<$Res> get seasonModel;@override $EpisodeModelCopyWith<$Res> get episodeModel;@override $MasterPlaylistCopyWith<$Res>? get masterPlaylist;@override $VariantCopyWith<$Res>? get variant;

}
/// @nodoc
class __$DownloadInfosCopyWithImpl<$Res>
    implements _$DownloadInfosCopyWith<$Res> {
  __$DownloadInfosCopyWithImpl(this._self, this._then);

  final _DownloadInfos _self;
  final $Res Function(_DownloadInfos) _then;

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downloadedAt = freezed,Object? size = null,Object? downloadUrl = null,Object? animeModel = null,Object? seasonModel = null,Object? episodeModel = null,Object? localPath = null,Object? masterPlaylist = freezed,Object? variant = freezed,}) {
  return _then(_DownloadInfos(
downloadedAt: freezed == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,animeModel: null == animeModel ? _self.animeModel : animeModel // ignore: cast_nullable_to_non_nullable
as AnimeModel,seasonModel: null == seasonModel ? _self.seasonModel : seasonModel // ignore: cast_nullable_to_non_nullable
as SeasonModel,episodeModel: null == episodeModel ? _self.episodeModel : episodeModel // ignore: cast_nullable_to_non_nullable
as EpisodeModel,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,masterPlaylist: freezed == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Variant?,
  ));
}

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeModelCopyWith<$Res> get animeModel {
  
  return $AnimeModelCopyWith<$Res>(_self.animeModel, (value) {
    return _then(_self.copyWith(animeModel: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonModelCopyWith<$Res> get seasonModel {
  
  return $SeasonModelCopyWith<$Res>(_self.seasonModel, (value) {
    return _then(_self.copyWith(seasonModel: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeModelCopyWith<$Res> get episodeModel {
  
  return $EpisodeModelCopyWith<$Res>(_self.episodeModel, (value) {
    return _then(_self.copyWith(episodeModel: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterPlaylistCopyWith<$Res>? get masterPlaylist {
    if (_self.masterPlaylist == null) {
    return null;
  }

  return $MasterPlaylistCopyWith<$Res>(_self.masterPlaylist!, (value) {
    return _then(_self.copyWith(masterPlaylist: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantCopyWith<$Res>? get variant {
    if (_self.variant == null) {
    return null;
  }

  return $VariantCopyWith<$Res>(_self.variant!, (value) {
    return _then(_self.copyWith(variant: value));
  });
}
}

// dart format on
