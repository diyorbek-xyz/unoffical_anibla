// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaStream {

 MediaType get type; String get animeTitle; String get episodeTitle; String get cover; String get url; int get episode; int get totalEpisodes; Duration get startTime; String? get forCache; String? get offlineUrl;
/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStreamCopyWith<MediaStream> get copyWith => _$MediaStreamCopyWithImpl<MediaStream>(this as MediaStream, _$identity);

  /// Serializes this MediaStream to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaStream&&(identical(other.type, type) || other.type == type)&&(identical(other.animeTitle, animeTitle) || other.animeTitle == animeTitle)&&(identical(other.episodeTitle, episodeTitle) || other.episodeTitle == episodeTitle)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.url, url) || other.url == url)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.forCache, forCache) || other.forCache == forCache)&&(identical(other.offlineUrl, offlineUrl) || other.offlineUrl == offlineUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,animeTitle,episodeTitle,cover,url,episode,totalEpisodes,startTime,forCache,offlineUrl);

@override
String toString() {
  return 'MediaStream(type: $type, animeTitle: $animeTitle, episodeTitle: $episodeTitle, cover: $cover, url: $url, episode: $episode, totalEpisodes: $totalEpisodes, startTime: $startTime, forCache: $forCache, offlineUrl: $offlineUrl)';
}


}

/// @nodoc
abstract mixin class $MediaStreamCopyWith<$Res>  {
  factory $MediaStreamCopyWith(MediaStream value, $Res Function(MediaStream) _then) = _$MediaStreamCopyWithImpl;
@useResult
$Res call({
 MediaType type, String animeTitle, String episodeTitle, String cover, String url, int episode, int totalEpisodes, Duration startTime, String? forCache, String? offlineUrl
});




}
/// @nodoc
class _$MediaStreamCopyWithImpl<$Res>
    implements $MediaStreamCopyWith<$Res> {
  _$MediaStreamCopyWithImpl(this._self, this._then);

  final MediaStream _self;
  final $Res Function(MediaStream) _then;

/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? animeTitle = null,Object? episodeTitle = null,Object? cover = null,Object? url = null,Object? episode = null,Object? totalEpisodes = null,Object? startTime = null,Object? forCache = freezed,Object? offlineUrl = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,animeTitle: null == animeTitle ? _self.animeTitle : animeTitle // ignore: cast_nullable_to_non_nullable
as String,episodeTitle: null == episodeTitle ? _self.episodeTitle : episodeTitle // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as int,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Duration,forCache: freezed == forCache ? _self.forCache : forCache // ignore: cast_nullable_to_non_nullable
as String?,offlineUrl: freezed == offlineUrl ? _self.offlineUrl : offlineUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaStream].
extension MediaStreamPatterns on MediaStream {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaStream value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaStream() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaStream value)  $default,){
final _that = this;
switch (_that) {
case _MediaStream():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaStream value)?  $default,){
final _that = this;
switch (_that) {
case _MediaStream() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MediaType type,  String animeTitle,  String episodeTitle,  String cover,  String url,  int episode,  int totalEpisodes,  Duration startTime,  String? forCache,  String? offlineUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaStream() when $default != null:
return $default(_that.type,_that.animeTitle,_that.episodeTitle,_that.cover,_that.url,_that.episode,_that.totalEpisodes,_that.startTime,_that.forCache,_that.offlineUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MediaType type,  String animeTitle,  String episodeTitle,  String cover,  String url,  int episode,  int totalEpisodes,  Duration startTime,  String? forCache,  String? offlineUrl)  $default,) {final _that = this;
switch (_that) {
case _MediaStream():
return $default(_that.type,_that.animeTitle,_that.episodeTitle,_that.cover,_that.url,_that.episode,_that.totalEpisodes,_that.startTime,_that.forCache,_that.offlineUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MediaType type,  String animeTitle,  String episodeTitle,  String cover,  String url,  int episode,  int totalEpisodes,  Duration startTime,  String? forCache,  String? offlineUrl)?  $default,) {final _that = this;
switch (_that) {
case _MediaStream() when $default != null:
return $default(_that.type,_that.animeTitle,_that.episodeTitle,_that.cover,_that.url,_that.episode,_that.totalEpisodes,_that.startTime,_that.forCache,_that.offlineUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaStream extends MediaStream {
   _MediaStream({required this.type, required this.animeTitle, required this.episodeTitle, required this.cover, required this.url, this.episode = 0, this.totalEpisodes = 0, this.startTime = Duration.zero, this.forCache, this.offlineUrl}): super._();
  factory _MediaStream.fromJson(Map<String, dynamic> json) => _$MediaStreamFromJson(json);

@override final  MediaType type;
@override final  String animeTitle;
@override final  String episodeTitle;
@override final  String cover;
@override final  String url;
@override@JsonKey() final  int episode;
@override@JsonKey() final  int totalEpisodes;
@override@JsonKey() final  Duration startTime;
@override final  String? forCache;
@override final  String? offlineUrl;

/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaStreamCopyWith<_MediaStream> get copyWith => __$MediaStreamCopyWithImpl<_MediaStream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaStreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaStream&&(identical(other.type, type) || other.type == type)&&(identical(other.animeTitle, animeTitle) || other.animeTitle == animeTitle)&&(identical(other.episodeTitle, episodeTitle) || other.episodeTitle == episodeTitle)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.url, url) || other.url == url)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.forCache, forCache) || other.forCache == forCache)&&(identical(other.offlineUrl, offlineUrl) || other.offlineUrl == offlineUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,animeTitle,episodeTitle,cover,url,episode,totalEpisodes,startTime,forCache,offlineUrl);

@override
String toString() {
  return 'MediaStream(type: $type, animeTitle: $animeTitle, episodeTitle: $episodeTitle, cover: $cover, url: $url, episode: $episode, totalEpisodes: $totalEpisodes, startTime: $startTime, forCache: $forCache, offlineUrl: $offlineUrl)';
}


}

/// @nodoc
abstract mixin class _$MediaStreamCopyWith<$Res> implements $MediaStreamCopyWith<$Res> {
  factory _$MediaStreamCopyWith(_MediaStream value, $Res Function(_MediaStream) _then) = __$MediaStreamCopyWithImpl;
@override @useResult
$Res call({
 MediaType type, String animeTitle, String episodeTitle, String cover, String url, int episode, int totalEpisodes, Duration startTime, String? forCache, String? offlineUrl
});




}
/// @nodoc
class __$MediaStreamCopyWithImpl<$Res>
    implements _$MediaStreamCopyWith<$Res> {
  __$MediaStreamCopyWithImpl(this._self, this._then);

  final _MediaStream _self;
  final $Res Function(_MediaStream) _then;

/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? animeTitle = null,Object? episodeTitle = null,Object? cover = null,Object? url = null,Object? episode = null,Object? totalEpisodes = null,Object? startTime = null,Object? forCache = freezed,Object? offlineUrl = freezed,}) {
  return _then(_MediaStream(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,animeTitle: null == animeTitle ? _self.animeTitle : animeTitle // ignore: cast_nullable_to_non_nullable
as String,episodeTitle: null == episodeTitle ? _self.episodeTitle : episodeTitle // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as int,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Duration,forCache: freezed == forCache ? _self.forCache : forCache // ignore: cast_nullable_to_non_nullable
as String?,offlineUrl: freezed == offlineUrl ? _self.offlineUrl : offlineUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
