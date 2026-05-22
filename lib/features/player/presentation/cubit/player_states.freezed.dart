// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerStates {

 Duration get progress; Duration get buffer; Duration get duration; Tracks get tracks; VideoTrack get videoTrack; List<int> get skip; double get volume; bool get isBuffering; bool get isFullscreen; bool get isMuted; bool get isPaused; bool get hasIntro; bool get hasError; BoxFit get fit; String get title; String get streamId; String get type; PlaylistPosition get position; String? get error;
/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStatesCopyWith<PlayerStates> get copyWith => _$PlayerStatesCopyWithImpl<PlayerStates>(this as PlayerStates, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerStates&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.buffer, buffer) || other.buffer == buffer)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.tracks, tracks) || other.tracks == tracks)&&(identical(other.videoTrack, videoTrack) || other.videoTrack == videoTrack)&&const DeepCollectionEquality().equals(other.skip, skip)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.isFullscreen, isFullscreen) || other.isFullscreen == isFullscreen)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.hasIntro, hasIntro) || other.hasIntro == hasIntro)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.title, title) || other.title == title)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.type, type) || other.type == type)&&(identical(other.position, position) || other.position == position)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hashAll([runtimeType,progress,buffer,duration,tracks,videoTrack,const DeepCollectionEquality().hash(skip),volume,isBuffering,isFullscreen,isMuted,isPaused,hasIntro,hasError,fit,title,streamId,type,position,error]);

@override
String toString() {
  return 'PlayerStates(progress: $progress, buffer: $buffer, duration: $duration, tracks: $tracks, videoTrack: $videoTrack, skip: $skip, volume: $volume, isBuffering: $isBuffering, isFullscreen: $isFullscreen, isMuted: $isMuted, isPaused: $isPaused, hasIntro: $hasIntro, hasError: $hasError, fit: $fit, title: $title, streamId: $streamId, type: $type, position: $position, error: $error)';
}


}

/// @nodoc
abstract mixin class $PlayerStatesCopyWith<$Res>  {
  factory $PlayerStatesCopyWith(PlayerStates value, $Res Function(PlayerStates) _then) = _$PlayerStatesCopyWithImpl;
@useResult
$Res call({
 Duration progress, Duration buffer, Duration duration, Tracks tracks, VideoTrack videoTrack, List<int> skip, double volume, bool isBuffering, bool isFullscreen, bool isMuted, bool isPaused, bool hasIntro, bool hasError, BoxFit fit, String title, String streamId, String type, PlaylistPosition position, String? error
});




}
/// @nodoc
class _$PlayerStatesCopyWithImpl<$Res>
    implements $PlayerStatesCopyWith<$Res> {
  _$PlayerStatesCopyWithImpl(this._self, this._then);

  final PlayerStates _self;
  final $Res Function(PlayerStates) _then;

/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progress = null,Object? buffer = null,Object? duration = null,Object? tracks = null,Object? videoTrack = null,Object? skip = null,Object? volume = null,Object? isBuffering = null,Object? isFullscreen = null,Object? isMuted = null,Object? isPaused = null,Object? hasIntro = null,Object? hasError = null,Object? fit = null,Object? title = null,Object? streamId = null,Object? type = null,Object? position = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Duration,buffer: null == buffer ? _self.buffer : buffer // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as Tracks,videoTrack: null == videoTrack ? _self.videoTrack : videoTrack // ignore: cast_nullable_to_non_nullable
as VideoTrack,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as List<int>,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,isFullscreen: null == isFullscreen ? _self.isFullscreen : isFullscreen // ignore: cast_nullable_to_non_nullable
as bool,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,hasIntro: null == hasIntro ? _self.hasIntro : hasIntro // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as PlaylistPosition,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerStates].
extension PlayerStatesPatterns on PlayerStates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerStates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerStates() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerStates value)  $default,){
final _that = this;
switch (_that) {
case _PlayerStates():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerStates value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerStates() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration progress,  Duration buffer,  Duration duration,  Tracks tracks,  VideoTrack videoTrack,  List<int> skip,  double volume,  bool isBuffering,  bool isFullscreen,  bool isMuted,  bool isPaused,  bool hasIntro,  bool hasError,  BoxFit fit,  String title,  String streamId,  String type,  PlaylistPosition position,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerStates() when $default != null:
return $default(_that.progress,_that.buffer,_that.duration,_that.tracks,_that.videoTrack,_that.skip,_that.volume,_that.isBuffering,_that.isFullscreen,_that.isMuted,_that.isPaused,_that.hasIntro,_that.hasError,_that.fit,_that.title,_that.streamId,_that.type,_that.position,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration progress,  Duration buffer,  Duration duration,  Tracks tracks,  VideoTrack videoTrack,  List<int> skip,  double volume,  bool isBuffering,  bool isFullscreen,  bool isMuted,  bool isPaused,  bool hasIntro,  bool hasError,  BoxFit fit,  String title,  String streamId,  String type,  PlaylistPosition position,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PlayerStates():
return $default(_that.progress,_that.buffer,_that.duration,_that.tracks,_that.videoTrack,_that.skip,_that.volume,_that.isBuffering,_that.isFullscreen,_that.isMuted,_that.isPaused,_that.hasIntro,_that.hasError,_that.fit,_that.title,_that.streamId,_that.type,_that.position,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration progress,  Duration buffer,  Duration duration,  Tracks tracks,  VideoTrack videoTrack,  List<int> skip,  double volume,  bool isBuffering,  bool isFullscreen,  bool isMuted,  bool isPaused,  bool hasIntro,  bool hasError,  BoxFit fit,  String title,  String streamId,  String type,  PlaylistPosition position,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PlayerStates() when $default != null:
return $default(_that.progress,_that.buffer,_that.duration,_that.tracks,_that.videoTrack,_that.skip,_that.volume,_that.isBuffering,_that.isFullscreen,_that.isMuted,_that.isPaused,_that.hasIntro,_that.hasError,_that.fit,_that.title,_that.streamId,_that.type,_that.position,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerStates implements PlayerStates {
   _PlayerStates({required this.progress, required this.buffer, required this.duration, required this.tracks, required this.videoTrack, required final  List<int> skip, required this.volume, required this.isBuffering, required this.isFullscreen, required this.isMuted, required this.isPaused, required this.hasIntro, required this.hasError, required this.fit, required this.title, required this.streamId, required this.type, required this.position, this.error}): _skip = skip;
  

@override final  Duration progress;
@override final  Duration buffer;
@override final  Duration duration;
@override final  Tracks tracks;
@override final  VideoTrack videoTrack;
 final  List<int> _skip;
@override List<int> get skip {
  if (_skip is EqualUnmodifiableListView) return _skip;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skip);
}

@override final  double volume;
@override final  bool isBuffering;
@override final  bool isFullscreen;
@override final  bool isMuted;
@override final  bool isPaused;
@override final  bool hasIntro;
@override final  bool hasError;
@override final  BoxFit fit;
@override final  String title;
@override final  String streamId;
@override final  String type;
@override final  PlaylistPosition position;
@override final  String? error;

/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStatesCopyWith<_PlayerStates> get copyWith => __$PlayerStatesCopyWithImpl<_PlayerStates>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerStates&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.buffer, buffer) || other.buffer == buffer)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.tracks, tracks) || other.tracks == tracks)&&(identical(other.videoTrack, videoTrack) || other.videoTrack == videoTrack)&&const DeepCollectionEquality().equals(other._skip, _skip)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.isFullscreen, isFullscreen) || other.isFullscreen == isFullscreen)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.hasIntro, hasIntro) || other.hasIntro == hasIntro)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.title, title) || other.title == title)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.type, type) || other.type == type)&&(identical(other.position, position) || other.position == position)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hashAll([runtimeType,progress,buffer,duration,tracks,videoTrack,const DeepCollectionEquality().hash(_skip),volume,isBuffering,isFullscreen,isMuted,isPaused,hasIntro,hasError,fit,title,streamId,type,position,error]);

@override
String toString() {
  return 'PlayerStates(progress: $progress, buffer: $buffer, duration: $duration, tracks: $tracks, videoTrack: $videoTrack, skip: $skip, volume: $volume, isBuffering: $isBuffering, isFullscreen: $isFullscreen, isMuted: $isMuted, isPaused: $isPaused, hasIntro: $hasIntro, hasError: $hasError, fit: $fit, title: $title, streamId: $streamId, type: $type, position: $position, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PlayerStatesCopyWith<$Res> implements $PlayerStatesCopyWith<$Res> {
  factory _$PlayerStatesCopyWith(_PlayerStates value, $Res Function(_PlayerStates) _then) = __$PlayerStatesCopyWithImpl;
@override @useResult
$Res call({
 Duration progress, Duration buffer, Duration duration, Tracks tracks, VideoTrack videoTrack, List<int> skip, double volume, bool isBuffering, bool isFullscreen, bool isMuted, bool isPaused, bool hasIntro, bool hasError, BoxFit fit, String title, String streamId, String type, PlaylistPosition position, String? error
});




}
/// @nodoc
class __$PlayerStatesCopyWithImpl<$Res>
    implements _$PlayerStatesCopyWith<$Res> {
  __$PlayerStatesCopyWithImpl(this._self, this._then);

  final _PlayerStates _self;
  final $Res Function(_PlayerStates) _then;

/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? buffer = null,Object? duration = null,Object? tracks = null,Object? videoTrack = null,Object? skip = null,Object? volume = null,Object? isBuffering = null,Object? isFullscreen = null,Object? isMuted = null,Object? isPaused = null,Object? hasIntro = null,Object? hasError = null,Object? fit = null,Object? title = null,Object? streamId = null,Object? type = null,Object? position = null,Object? error = freezed,}) {
  return _then(_PlayerStates(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Duration,buffer: null == buffer ? _self.buffer : buffer // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as Tracks,videoTrack: null == videoTrack ? _self.videoTrack : videoTrack // ignore: cast_nullable_to_non_nullable
as VideoTrack,skip: null == skip ? _self._skip : skip // ignore: cast_nullable_to_non_nullable
as List<int>,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,isFullscreen: null == isFullscreen ? _self.isFullscreen : isFullscreen // ignore: cast_nullable_to_non_nullable
as bool,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,hasIntro: null == hasIntro ? _self.hasIntro : hasIntro // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as PlaylistPosition,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
