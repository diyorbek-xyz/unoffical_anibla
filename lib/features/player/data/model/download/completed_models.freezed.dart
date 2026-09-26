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

@HiveField(0) DateTime? get downloadedAt;@HiveField(1) int get size;@HiveField(2) String get downloadUrl;@HiveField(4) Anime get anime;@HiveField(5) Season get season;@HiveField(6) Episode get episode;@HiveField(7) String get localPath;@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? get masterPlaylist;@JsonKey(includeFromJson: false, includeToJson: false) Variant? get variant;
/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadInfosCopyWith<DownloadInfos> get copyWith => _$DownloadInfosCopyWithImpl<DownloadInfos>(this as DownloadInfos, _$identity);

  /// Serializes this DownloadInfos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadInfos&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.variant, variant) || other.variant == variant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,downloadedAt,size,downloadUrl,anime,season,episode,localPath,masterPlaylist,variant);

@override
String toString() {
  return 'DownloadInfos(downloadedAt: $downloadedAt, size: $size, downloadUrl: $downloadUrl, anime: $anime, season: $season, episode: $episode, localPath: $localPath, masterPlaylist: $masterPlaylist, variant: $variant)';
}


}

/// @nodoc
abstract mixin class $DownloadInfosCopyWith<$Res>  {
  factory $DownloadInfosCopyWith(DownloadInfos value, $Res Function(DownloadInfos) _then) = _$DownloadInfosCopyWithImpl;
@useResult
$Res call({
@HiveField(0) DateTime? downloadedAt,@HiveField(1) int size,@HiveField(2) String downloadUrl,@HiveField(4) Anime anime,@HiveField(5) Season season,@HiveField(6) Episode episode,@HiveField(7) String localPath,@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? masterPlaylist,@JsonKey(includeFromJson: false, includeToJson: false) Variant? variant
});


$AnimeCopyWith<$Res> get anime;$SeasonCopyWith<$Res> get season;$EpisodeCopyWith<$Res> get episode;$MasterPlaylistCopyWith<$Res>? get masterPlaylist;$VariantCopyWith<$Res>? get variant;

}
/// @nodoc
class _$DownloadInfosCopyWithImpl<$Res>
    implements $DownloadInfosCopyWith<$Res> {
  _$DownloadInfosCopyWithImpl(this._self, this._then);

  final DownloadInfos _self;
  final $Res Function(DownloadInfos) _then;

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downloadedAt = freezed,Object? size = null,Object? downloadUrl = null,Object? anime = null,Object? season = null,Object? episode = null,Object? localPath = null,Object? masterPlaylist = freezed,Object? variant = freezed,}) {
  return _then(_self.copyWith(
downloadedAt: freezed == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Episode,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,masterPlaylist: freezed == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Variant?,
  ));
}
/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res> get season {
  
  return $SeasonCopyWith<$Res>(_self.season, (value) {
    return _then(_self.copyWith(season: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeCopyWith<$Res> get episode {
  
  return $EpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  DateTime? downloadedAt, @HiveField(1)  int size, @HiveField(2)  String downloadUrl, @HiveField(4)  Anime anime, @HiveField(5)  Season season, @HiveField(6)  Episode episode, @HiveField(7)  String localPath, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
return $default(_that.downloadedAt,_that.size,_that.downloadUrl,_that.anime,_that.season,_that.episode,_that.localPath,_that.masterPlaylist,_that.variant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  DateTime? downloadedAt, @HiveField(1)  int size, @HiveField(2)  String downloadUrl, @HiveField(4)  Anime anime, @HiveField(5)  Season season, @HiveField(6)  Episode episode, @HiveField(7)  String localPath, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)  $default,) {final _that = this;
switch (_that) {
case _DownloadInfos():
return $default(_that.downloadedAt,_that.size,_that.downloadUrl,_that.anime,_that.season,_that.episode,_that.localPath,_that.masterPlaylist,_that.variant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  DateTime? downloadedAt, @HiveField(1)  int size, @HiveField(2)  String downloadUrl, @HiveField(4)  Anime anime, @HiveField(5)  Season season, @HiveField(6)  Episode episode, @HiveField(7)  String localPath, @JsonKey(includeFromJson: false, includeToJson: false)  MasterPlaylist? masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false)  Variant? variant)?  $default,) {final _that = this;
switch (_that) {
case _DownloadInfos() when $default != null:
return $default(_that.downloadedAt,_that.size,_that.downloadUrl,_that.anime,_that.season,_that.episode,_that.localPath,_that.masterPlaylist,_that.variant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadInfos extends DownloadInfos {
   _DownloadInfos({@HiveField(0) this.downloadedAt, @HiveField(1) required this.size, @HiveField(2) required this.downloadUrl, @HiveField(4) required this.anime, @HiveField(5) required this.season, @HiveField(6) required this.episode, @HiveField(7) this.localPath = "", @JsonKey(includeFromJson: false, includeToJson: false) this.masterPlaylist, @JsonKey(includeFromJson: false, includeToJson: false) this.variant}): super._();
  factory _DownloadInfos.fromJson(Map<String, dynamic> json) => _$DownloadInfosFromJson(json);

@override@HiveField(0) final  DateTime? downloadedAt;
@override@HiveField(1) final  int size;
@override@HiveField(2) final  String downloadUrl;
@override@HiveField(4) final  Anime anime;
@override@HiveField(5) final  Season season;
@override@HiveField(6) final  Episode episode;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadInfos&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.variant, variant) || other.variant == variant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,downloadedAt,size,downloadUrl,anime,season,episode,localPath,masterPlaylist,variant);

@override
String toString() {
  return 'DownloadInfos(downloadedAt: $downloadedAt, size: $size, downloadUrl: $downloadUrl, anime: $anime, season: $season, episode: $episode, localPath: $localPath, masterPlaylist: $masterPlaylist, variant: $variant)';
}


}

/// @nodoc
abstract mixin class _$DownloadInfosCopyWith<$Res> implements $DownloadInfosCopyWith<$Res> {
  factory _$DownloadInfosCopyWith(_DownloadInfos value, $Res Function(_DownloadInfos) _then) = __$DownloadInfosCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) DateTime? downloadedAt,@HiveField(1) int size,@HiveField(2) String downloadUrl,@HiveField(4) Anime anime,@HiveField(5) Season season,@HiveField(6) Episode episode,@HiveField(7) String localPath,@JsonKey(includeFromJson: false, includeToJson: false) MasterPlaylist? masterPlaylist,@JsonKey(includeFromJson: false, includeToJson: false) Variant? variant
});


@override $AnimeCopyWith<$Res> get anime;@override $SeasonCopyWith<$Res> get season;@override $EpisodeCopyWith<$Res> get episode;@override $MasterPlaylistCopyWith<$Res>? get masterPlaylist;@override $VariantCopyWith<$Res>? get variant;

}
/// @nodoc
class __$DownloadInfosCopyWithImpl<$Res>
    implements _$DownloadInfosCopyWith<$Res> {
  __$DownloadInfosCopyWithImpl(this._self, this._then);

  final _DownloadInfos _self;
  final $Res Function(_DownloadInfos) _then;

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downloadedAt = freezed,Object? size = null,Object? downloadUrl = null,Object? anime = null,Object? season = null,Object? episode = null,Object? localPath = null,Object? masterPlaylist = freezed,Object? variant = freezed,}) {
  return _then(_DownloadInfos(
downloadedAt: freezed == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Episode,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,masterPlaylist: freezed == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Variant?,
  ));
}

/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res> get season {
  
  return $SeasonCopyWith<$Res>(_self.season, (value) {
    return _then(_self.copyWith(season: value));
  });
}/// Create a copy of DownloadInfos
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeCopyWith<$Res> get episode {
  
  return $EpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
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
