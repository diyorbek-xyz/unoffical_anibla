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

@HiveField(0) String get streamUrl;@HiveField(1) String get downloadUrl;@HiveField(2) String get localFolderUrl;@HiveField(3) DateTime? get downloadedAt;@HiveField(4) int get size;@HiveField(5) String get animeId;@HiveField(6) TranslatedModel get animeTitle;@HiveField(7) String get seasonId;@HiveField(8) TranslatedModel get seasonTitle;@HiveField(9) String get episodeId;@HiveField(10) TranslatedModel get episodeTitle;@HiveField(11) int get episodeNumber;@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? get masterPlaylist;@JsonKey(includeFromJson: false, includeToJson: false) Variant? get variant;
/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadInfosCopyWith<DownloadInfos> get copyWith => _$DownloadInfosCopyWithImpl<DownloadInfos>(this as DownloadInfos, _$identity);

  /// Serializes this DownloadInfos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadInfos&&(identical(other.streamUrl, streamUrl) || other.streamUrl == streamUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.localFolderUrl, localFolderUrl) || other.localFolderUrl == localFolderUrl)&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.animeId, animeId) || other.animeId == animeId)&&(identical(other.animeTitle, animeTitle) || other.animeTitle == animeTitle)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.seasonTitle, seasonTitle) || other.seasonTitle == seasonTitle)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.episodeTitle, episodeTitle) || other.episodeTitle == episodeTitle)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.variant, variant) || other.variant == variant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamUrl,downloadUrl,localFolderUrl,downloadedAt,size,animeId,animeTitle,seasonId,seasonTitle,episodeId,episodeTitle,episodeNumber,masterPlaylist,variant);

@override
String toString() {
  return 'DownloadInfos(streamUrl: $streamUrl, downloadUrl: $downloadUrl, localFolderUrl: $localFolderUrl, downloadedAt: $downloadedAt, size: $size, animeId: $animeId, animeTitle: $animeTitle, seasonId: $seasonId, seasonTitle: $seasonTitle, episodeId: $episodeId, episodeTitle: $episodeTitle, episodeNumber: $episodeNumber, masterPlaylist: $masterPlaylist, variant: $variant)';
}


}

/// @nodoc
abstract mixin class $DownloadInfosCopyWith<$Res>  {
  factory $DownloadInfosCopyWith(DownloadInfos value, $Res Function(DownloadInfos) _then) = _$DownloadInfosCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String streamUrl,@HiveField(1) String downloadUrl,@HiveField(2) String localFolderUrl,@HiveField(3) DateTime? downloadedAt,@HiveField(4) int size,@HiveField(5) String animeId,@HiveField(6) TranslatedModel animeTitle,@HiveField(7) String seasonId,@HiveField(8) TranslatedModel seasonTitle,@HiveField(9) String episodeId,@HiveField(10) TranslatedModel episodeTitle,@HiveField(11) int episodeNumber,@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? masterPlaylist,@JsonKey(includeFromJson: false, includeToJson: false) Variant? variant
});


$TranslatedModelCopyWith<$Res> get animeTitle;$TranslatedModelCopyWith<$Res> get seasonTitle;$TranslatedModelCopyWith<$Res> get episodeTitle;$MasterPlaylistCopyWith<$Res>? get masterPlaylist;$VariantCopyWith<$Res>? get variant;

}
/// @nodoc
class _$DownloadInfosCopyWithImpl<$Res>
    implements $DownloadInfosCopyWith<$Res> {
  _$DownloadInfosCopyWithImpl(this._self, this._then);

  final DownloadInfos _self;
  final $Res Function(DownloadInfos) _then;

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streamUrl = null,Object? downloadUrl = null,Object? localFolderUrl = null,Object? downloadedAt = freezed,Object? size = null,Object? animeId = null,Object? animeTitle = null,Object? seasonId = null,Object? seasonTitle = null,Object? episodeId = null,Object? episodeTitle = null,Object? episodeNumber = null,Object? masterPlaylist = freezed,Object? variant = freezed,}) {
  return _then(_self.copyWith(
streamUrl: null == streamUrl ? _self.streamUrl : streamUrl // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,localFolderUrl: null == localFolderUrl ? _self.localFolderUrl : localFolderUrl // ignore: cast_nullable_to_non_nullable
as String,downloadedAt: freezed == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,animeId: null == animeId ? _self.animeId : animeId // ignore: cast_nullable_to_non_nullable
as String,animeTitle: null == animeTitle ? _self.animeTitle : animeTitle // ignore: cast_nullable_to_non_nullable
as TranslatedModel,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,seasonTitle: null == seasonTitle ? _self.seasonTitle : seasonTitle // ignore: cast_nullable_to_non_nullable
as TranslatedModel,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,episodeTitle: null == episodeTitle ? _self.episodeTitle : episodeTitle // ignore: cast_nullable_to_non_nullable
as TranslatedModel,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,masterPlaylist: freezed == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Variant?,
  ));
}
/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslatedModelCopyWith<$Res> get animeTitle {
  
  return $TranslatedModelCopyWith<$Res>(_self.animeTitle, (value) {
    return _then(_self.copyWith(animeTitle: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslatedModelCopyWith<$Res> get seasonTitle {
  
  return $TranslatedModelCopyWith<$Res>(_self.seasonTitle, (value) {
    return _then(_self.copyWith(seasonTitle: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslatedModelCopyWith<$Res> get episodeTitle {
  
  return $TranslatedModelCopyWith<$Res>(_self.episodeTitle, (value) {
    return _then(_self.copyWith(episodeTitle: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String streamUrl, @HiveField(1)  String downloadUrl, @HiveField(2)  String localFolderUrl, @HiveField(3)  DateTime? downloadedAt, @HiveField(4)  int size, @HiveField(5)  String animeId, @HiveField(6)  TranslatedModel animeTitle, @HiveField(7)  String seasonId, @HiveField(8)  TranslatedModel seasonTitle, @HiveField(9)  String episodeId, @HiveField(10)  TranslatedModel episodeTitle, @HiveField(11)  int episodeNumber, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
return $default(_that.streamUrl,_that.downloadUrl,_that.localFolderUrl,_that.downloadedAt,_that.size,_that.animeId,_that.animeTitle,_that.seasonId,_that.seasonTitle,_that.episodeId,_that.episodeTitle,_that.episodeNumber,_that.masterPlaylist,_that.variant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String streamUrl, @HiveField(1)  String downloadUrl, @HiveField(2)  String localFolderUrl, @HiveField(3)  DateTime? downloadedAt, @HiveField(4)  int size, @HiveField(5)  String animeId, @HiveField(6)  TranslatedModel animeTitle, @HiveField(7)  String seasonId, @HiveField(8)  TranslatedModel seasonTitle, @HiveField(9)  String episodeId, @HiveField(10)  TranslatedModel episodeTitle, @HiveField(11)  int episodeNumber, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)  $default,) {final _that = this;
switch (_that) {
case _DownloadInfos():
return $default(_that.streamUrl,_that.downloadUrl,_that.localFolderUrl,_that.downloadedAt,_that.size,_that.animeId,_that.animeTitle,_that.seasonId,_that.seasonTitle,_that.episodeId,_that.episodeTitle,_that.episodeNumber,_that.masterPlaylist,_that.variant);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String streamUrl, @HiveField(1)  String downloadUrl, @HiveField(2)  String localFolderUrl, @HiveField(3)  DateTime? downloadedAt, @HiveField(4)  int size, @HiveField(5)  String animeId, @HiveField(6)  TranslatedModel animeTitle, @HiveField(7)  String seasonId, @HiveField(8)  TranslatedModel seasonTitle, @HiveField(9)  String episodeId, @HiveField(10)  TranslatedModel episodeTitle, @HiveField(11)  int episodeNumber, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)?  $default,) {final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
return $default(_that.streamUrl,_that.downloadUrl,_that.localFolderUrl,_that.downloadedAt,_that.size,_that.animeId,_that.animeTitle,_that.seasonId,_that.seasonTitle,_that.episodeId,_that.episodeTitle,_that.episodeNumber,_that.masterPlaylist,_that.variant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadInfos implements DownloadInfos {
   _DownloadInfos({@HiveField(0) required this.streamUrl, @HiveField(1) required this.downloadUrl, @HiveField(2) required this.localFolderUrl, @HiveField(3) this.downloadedAt, @HiveField(4) required this.size, @HiveField(5) required this.animeId, @HiveField(6) required this.animeTitle, @HiveField(7) required this.seasonId, @HiveField(8) required this.seasonTitle, @HiveField(9) required this.episodeId, @HiveField(10) required this.episodeTitle, @HiveField(11) required this.episodeNumber, @JsonKey(includeFromJson: false, includeToJson: false) this.masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false) this.variant});
  factory _DownloadInfos.fromJson(Map<String, dynamic> json) => _$DownloadInfosFromJson(json);

@override@HiveField(0) final  String streamUrl;
@override@HiveField(1) final  String downloadUrl;
@override@HiveField(2) final  String localFolderUrl;
@override@HiveField(3) final  DateTime? downloadedAt;
@override@HiveField(4) final  int size;
@override@HiveField(5) final  String animeId;
@override@HiveField(6) final  TranslatedModel animeTitle;
@override@HiveField(7) final  String seasonId;
@override@HiveField(8) final  TranslatedModel seasonTitle;
@override@HiveField(9) final  String episodeId;
@override@HiveField(10) final  TranslatedModel episodeTitle;
@override@HiveField(11) final  int episodeNumber;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadInfos&&(identical(other.streamUrl, streamUrl) || other.streamUrl == streamUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.localFolderUrl, localFolderUrl) || other.localFolderUrl == localFolderUrl)&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.animeId, animeId) || other.animeId == animeId)&&(identical(other.animeTitle, animeTitle) || other.animeTitle == animeTitle)&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.seasonTitle, seasonTitle) || other.seasonTitle == seasonTitle)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.episodeTitle, episodeTitle) || other.episodeTitle == episodeTitle)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.variant, variant) || other.variant == variant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamUrl,downloadUrl,localFolderUrl,downloadedAt,size,animeId,animeTitle,seasonId,seasonTitle,episodeId,episodeTitle,episodeNumber,masterPlaylist,variant);

@override
String toString() {
  return 'DownloadInfos(streamUrl: $streamUrl, downloadUrl: $downloadUrl, localFolderUrl: $localFolderUrl, downloadedAt: $downloadedAt, size: $size, animeId: $animeId, animeTitle: $animeTitle, seasonId: $seasonId, seasonTitle: $seasonTitle, episodeId: $episodeId, episodeTitle: $episodeTitle, episodeNumber: $episodeNumber, masterPlaylist: $masterPlaylist, variant: $variant)';
}


}

/// @nodoc
abstract mixin class _$DownloadInfosCopyWith<$Res> implements $DownloadInfosCopyWith<$Res> {
  factory _$DownloadInfosCopyWith(_DownloadInfos value, $Res Function(_DownloadInfos) _then) = __$DownloadInfosCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String streamUrl,@HiveField(1) String downloadUrl,@HiveField(2) String localFolderUrl,@HiveField(3) DateTime? downloadedAt,@HiveField(4) int size,@HiveField(5) String animeId,@HiveField(6) TranslatedModel animeTitle,@HiveField(7) String seasonId,@HiveField(8) TranslatedModel seasonTitle,@HiveField(9) String episodeId,@HiveField(10) TranslatedModel episodeTitle,@HiveField(11) int episodeNumber,@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? masterPlaylist,@JsonKey(includeFromJson: false, includeToJson: false) Variant? variant
});


@override $TranslatedModelCopyWith<$Res> get animeTitle;@override $TranslatedModelCopyWith<$Res> get seasonTitle;@override $TranslatedModelCopyWith<$Res> get episodeTitle;@override $MasterPlaylistCopyWith<$Res>? get masterPlaylist;@override $VariantCopyWith<$Res>? get variant;

}
/// @nodoc
class __$DownloadInfosCopyWithImpl<$Res>
    implements _$DownloadInfosCopyWith<$Res> {
  __$DownloadInfosCopyWithImpl(this._self, this._then);

  final _DownloadInfos _self;
  final $Res Function(_DownloadInfos) _then;

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streamUrl = null,Object? downloadUrl = null,Object? localFolderUrl = null,Object? downloadedAt = freezed,Object? size = null,Object? animeId = null,Object? animeTitle = null,Object? seasonId = null,Object? seasonTitle = null,Object? episodeId = null,Object? episodeTitle = null,Object? episodeNumber = null,Object? masterPlaylist = freezed,Object? variant = freezed,}) {
  return _then(_DownloadInfos(
streamUrl: null == streamUrl ? _self.streamUrl : streamUrl // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,localFolderUrl: null == localFolderUrl ? _self.localFolderUrl : localFolderUrl // ignore: cast_nullable_to_non_nullable
as String,downloadedAt: freezed == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,animeId: null == animeId ? _self.animeId : animeId // ignore: cast_nullable_to_non_nullable
as String,animeTitle: null == animeTitle ? _self.animeTitle : animeTitle // ignore: cast_nullable_to_non_nullable
as TranslatedModel,seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as String,seasonTitle: null == seasonTitle ? _self.seasonTitle : seasonTitle // ignore: cast_nullable_to_non_nullable
as TranslatedModel,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,episodeTitle: null == episodeTitle ? _self.episodeTitle : episodeTitle // ignore: cast_nullable_to_non_nullable
as TranslatedModel,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,masterPlaylist: freezed == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Variant?,
  ));
}

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslatedModelCopyWith<$Res> get animeTitle {
  
  return $TranslatedModelCopyWith<$Res>(_self.animeTitle, (value) {
    return _then(_self.copyWith(animeTitle: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslatedModelCopyWith<$Res> get seasonTitle {
  
  return $TranslatedModelCopyWith<$Res>(_self.seasonTitle, (value) {
    return _then(_self.copyWith(seasonTitle: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslatedModelCopyWith<$Res> get episodeTitle {
  
  return $TranslatedModelCopyWith<$Res>(_self.episodeTitle, (value) {
    return _then(_self.copyWith(episodeTitle: value));
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
