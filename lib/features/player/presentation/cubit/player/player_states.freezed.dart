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

 Duration get progress; Duration get buffer; Duration get duration; Tracks get tracks; VideoTrack get videoTrack; List<int> get skip; double get volume; bool get isBuffering; bool get isFullscreen; bool get isMuted; bool get isPaused; bool get hasIntro; PlayerStatus get status; String get message; BoxFit get fit; AnimeType get type; int get all; CurrentStream get stream;
/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStatesCopyWith<PlayerStates> get copyWith => _$PlayerStatesCopyWithImpl<PlayerStates>(this as PlayerStates, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerStates&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.buffer, buffer) || other.buffer == buffer)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.tracks, tracks) || other.tracks == tracks)&&(identical(other.videoTrack, videoTrack) || other.videoTrack == videoTrack)&&const DeepCollectionEquality().equals(other.skip, skip)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.isFullscreen, isFullscreen) || other.isFullscreen == isFullscreen)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.hasIntro, hasIntro) || other.hasIntro == hasIntro)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.type, type) || other.type == type)&&(identical(other.all, all) || other.all == all)&&(identical(other.stream, stream) || other.stream == stream));
}


@override
int get hashCode => Object.hash(runtimeType,progress,buffer,duration,tracks,videoTrack,const DeepCollectionEquality().hash(skip),volume,isBuffering,isFullscreen,isMuted,isPaused,hasIntro,status,message,fit,type,all,stream);

@override
String toString() {
  return 'PlayerStates(progress: $progress, buffer: $buffer, duration: $duration, tracks: $tracks, videoTrack: $videoTrack, skip: $skip, volume: $volume, isBuffering: $isBuffering, isFullscreen: $isFullscreen, isMuted: $isMuted, isPaused: $isPaused, hasIntro: $hasIntro, status: $status, message: $message, fit: $fit, type: $type, all: $all, stream: $stream)';
}


}

/// @nodoc
abstract mixin class $PlayerStatesCopyWith<$Res>  {
  factory $PlayerStatesCopyWith(PlayerStates value, $Res Function(PlayerStates) _then) = _$PlayerStatesCopyWithImpl;
@useResult
$Res call({
 Duration progress, Duration buffer, Duration duration, Tracks tracks, VideoTrack videoTrack, List<int> skip, double volume, bool isBuffering, bool isFullscreen, bool isMuted, bool isPaused, bool hasIntro, PlayerStatus status, String message, BoxFit fit, AnimeType type, int all, CurrentStream stream
});


$CurrentStreamCopyWith<$Res> get stream;

}
/// @nodoc
class _$PlayerStatesCopyWithImpl<$Res>
    implements $PlayerStatesCopyWith<$Res> {
  _$PlayerStatesCopyWithImpl(this._self, this._then);

  final PlayerStates _self;
  final $Res Function(PlayerStates) _then;

/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progress = null,Object? buffer = null,Object? duration = null,Object? tracks = null,Object? videoTrack = null,Object? skip = null,Object? volume = null,Object? isBuffering = null,Object? isFullscreen = null,Object? isMuted = null,Object? isPaused = null,Object? hasIntro = null,Object? status = null,Object? message = null,Object? fit = null,Object? type = null,Object? all = null,Object? stream = null,}) {
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
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PlayerStatus,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as CurrentStream,
  ));
}
/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentStreamCopyWith<$Res> get stream {
  
  return $CurrentStreamCopyWith<$Res>(_self.stream, (value) {
    return _then(_self.copyWith(stream: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration progress,  Duration buffer,  Duration duration,  Tracks tracks,  VideoTrack videoTrack,  List<int> skip,  double volume,  bool isBuffering,  bool isFullscreen,  bool isMuted,  bool isPaused,  bool hasIntro,  PlayerStatus status,  String message,  BoxFit fit,  AnimeType type,  int all,  CurrentStream stream)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerStates() when $default != null:
return $default(_that.progress,_that.buffer,_that.duration,_that.tracks,_that.videoTrack,_that.skip,_that.volume,_that.isBuffering,_that.isFullscreen,_that.isMuted,_that.isPaused,_that.hasIntro,_that.status,_that.message,_that.fit,_that.type,_that.all,_that.stream);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration progress,  Duration buffer,  Duration duration,  Tracks tracks,  VideoTrack videoTrack,  List<int> skip,  double volume,  bool isBuffering,  bool isFullscreen,  bool isMuted,  bool isPaused,  bool hasIntro,  PlayerStatus status,  String message,  BoxFit fit,  AnimeType type,  int all,  CurrentStream stream)  $default,) {final _that = this;
switch (_that) {
case _PlayerStates():
return $default(_that.progress,_that.buffer,_that.duration,_that.tracks,_that.videoTrack,_that.skip,_that.volume,_that.isBuffering,_that.isFullscreen,_that.isMuted,_that.isPaused,_that.hasIntro,_that.status,_that.message,_that.fit,_that.type,_that.all,_that.stream);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration progress,  Duration buffer,  Duration duration,  Tracks tracks,  VideoTrack videoTrack,  List<int> skip,  double volume,  bool isBuffering,  bool isFullscreen,  bool isMuted,  bool isPaused,  bool hasIntro,  PlayerStatus status,  String message,  BoxFit fit,  AnimeType type,  int all,  CurrentStream stream)?  $default,) {final _that = this;
switch (_that) {
case _PlayerStates() when $default != null:
return $default(_that.progress,_that.buffer,_that.duration,_that.tracks,_that.videoTrack,_that.skip,_that.volume,_that.isBuffering,_that.isFullscreen,_that.isMuted,_that.isPaused,_that.hasIntro,_that.status,_that.message,_that.fit,_that.type,_that.all,_that.stream);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerStates implements PlayerStates {
   _PlayerStates({required this.progress, required this.buffer, required this.duration, required this.tracks, required this.videoTrack, required final  List<int> skip, required this.volume, required this.isBuffering, required this.isFullscreen, required this.isMuted, required this.isPaused, required this.hasIntro, required this.status, required this.message, required this.fit, required this.type, required this.all, required this.stream}): _skip = skip;
  

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
@override final  PlayerStatus status;
@override final  String message;
@override final  BoxFit fit;
@override final  AnimeType type;
@override final  int all;
@override final  CurrentStream stream;

/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStatesCopyWith<_PlayerStates> get copyWith => __$PlayerStatesCopyWithImpl<_PlayerStates>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerStates&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.buffer, buffer) || other.buffer == buffer)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.tracks, tracks) || other.tracks == tracks)&&(identical(other.videoTrack, videoTrack) || other.videoTrack == videoTrack)&&const DeepCollectionEquality().equals(other._skip, _skip)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.isFullscreen, isFullscreen) || other.isFullscreen == isFullscreen)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.hasIntro, hasIntro) || other.hasIntro == hasIntro)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.type, type) || other.type == type)&&(identical(other.all, all) || other.all == all)&&(identical(other.stream, stream) || other.stream == stream));
}


@override
int get hashCode => Object.hash(runtimeType,progress,buffer,duration,tracks,videoTrack,const DeepCollectionEquality().hash(_skip),volume,isBuffering,isFullscreen,isMuted,isPaused,hasIntro,status,message,fit,type,all,stream);

@override
String toString() {
  return 'PlayerStates(progress: $progress, buffer: $buffer, duration: $duration, tracks: $tracks, videoTrack: $videoTrack, skip: $skip, volume: $volume, isBuffering: $isBuffering, isFullscreen: $isFullscreen, isMuted: $isMuted, isPaused: $isPaused, hasIntro: $hasIntro, status: $status, message: $message, fit: $fit, type: $type, all: $all, stream: $stream)';
}


}

/// @nodoc
abstract mixin class _$PlayerStatesCopyWith<$Res> implements $PlayerStatesCopyWith<$Res> {
  factory _$PlayerStatesCopyWith(_PlayerStates value, $Res Function(_PlayerStates) _then) = __$PlayerStatesCopyWithImpl;
@override @useResult
$Res call({
 Duration progress, Duration buffer, Duration duration, Tracks tracks, VideoTrack videoTrack, List<int> skip, double volume, bool isBuffering, bool isFullscreen, bool isMuted, bool isPaused, bool hasIntro, PlayerStatus status, String message, BoxFit fit, AnimeType type, int all, CurrentStream stream
});


@override $CurrentStreamCopyWith<$Res> get stream;

}
/// @nodoc
class __$PlayerStatesCopyWithImpl<$Res>
    implements _$PlayerStatesCopyWith<$Res> {
  __$PlayerStatesCopyWithImpl(this._self, this._then);

  final _PlayerStates _self;
  final $Res Function(_PlayerStates) _then;

/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? buffer = null,Object? duration = null,Object? tracks = null,Object? videoTrack = null,Object? skip = null,Object? volume = null,Object? isBuffering = null,Object? isFullscreen = null,Object? isMuted = null,Object? isPaused = null,Object? hasIntro = null,Object? status = null,Object? message = null,Object? fit = null,Object? type = null,Object? all = null,Object? stream = null,}) {
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
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PlayerStatus,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as CurrentStream,
  ));
}

/// Create a copy of PlayerStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentStreamCopyWith<$Res> get stream {
  
  return $CurrentStreamCopyWith<$Res>(_self.stream, (value) {
    return _then(_self.copyWith(stream: value));
  });
}
}

/// @nodoc
mixin _$PlayerProps {

 String get anime; AnimeType get type; String get cover; String get title; int get offset; int get all; String get stream; bool get hasUrl;
/// Create a copy of PlayerProps
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerPropsCopyWith<PlayerProps> get copyWith => _$PlayerPropsCopyWithImpl<PlayerProps>(this as PlayerProps, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerProps&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.type, type) || other.type == type)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.all, all) || other.all == all)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.hasUrl, hasUrl) || other.hasUrl == hasUrl));
}


@override
int get hashCode => Object.hash(runtimeType,anime,type,cover,title,offset,all,stream,hasUrl);

@override
String toString() {
  return 'PlayerProps(anime: $anime, type: $type, cover: $cover, title: $title, offset: $offset, all: $all, stream: $stream, hasUrl: $hasUrl)';
}


}

/// @nodoc
abstract mixin class $PlayerPropsCopyWith<$Res>  {
  factory $PlayerPropsCopyWith(PlayerProps value, $Res Function(PlayerProps) _then) = _$PlayerPropsCopyWithImpl;
@useResult
$Res call({
 String anime, AnimeType type, String cover, String title, int offset, int all, String stream, bool hasUrl
});




}
/// @nodoc
class _$PlayerPropsCopyWithImpl<$Res>
    implements $PlayerPropsCopyWith<$Res> {
  _$PlayerPropsCopyWithImpl(this._self, this._then);

  final PlayerProps _self;
  final $Res Function(PlayerProps) _then;

/// Create a copy of PlayerProps
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anime = null,Object? type = null,Object? cover = null,Object? title = null,Object? offset = null,Object? all = null,Object? stream = null,Object? hasUrl = null,}) {
  return _then(_self.copyWith(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String,hasUrl: null == hasUrl ? _self.hasUrl : hasUrl // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerProps].
extension PlayerPropsPatterns on PlayerProps {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerProps value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerProps() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerProps value)  $default,){
final _that = this;
switch (_that) {
case _PlayerProps():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerProps value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerProps() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String anime,  AnimeType type,  String cover,  String title,  int offset,  int all,  String stream,  bool hasUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerProps() when $default != null:
return $default(_that.anime,_that.type,_that.cover,_that.title,_that.offset,_that.all,_that.stream,_that.hasUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String anime,  AnimeType type,  String cover,  String title,  int offset,  int all,  String stream,  bool hasUrl)  $default,) {final _that = this;
switch (_that) {
case _PlayerProps():
return $default(_that.anime,_that.type,_that.cover,_that.title,_that.offset,_that.all,_that.stream,_that.hasUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String anime,  AnimeType type,  String cover,  String title,  int offset,  int all,  String stream,  bool hasUrl)?  $default,) {final _that = this;
switch (_that) {
case _PlayerProps() when $default != null:
return $default(_that.anime,_that.type,_that.cover,_that.title,_that.offset,_that.all,_that.stream,_that.hasUrl);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerProps implements PlayerProps {
   _PlayerProps({required this.anime, required this.type, required this.cover, required this.title, required this.offset, required this.all, required this.stream, this.hasUrl = false});
  

@override final  String anime;
@override final  AnimeType type;
@override final  String cover;
@override final  String title;
@override final  int offset;
@override final  int all;
@override final  String stream;
@override@JsonKey() final  bool hasUrl;

/// Create a copy of PlayerProps
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerPropsCopyWith<_PlayerProps> get copyWith => __$PlayerPropsCopyWithImpl<_PlayerProps>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerProps&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.type, type) || other.type == type)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.all, all) || other.all == all)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.hasUrl, hasUrl) || other.hasUrl == hasUrl));
}


@override
int get hashCode => Object.hash(runtimeType,anime,type,cover,title,offset,all,stream,hasUrl);

@override
String toString() {
  return 'PlayerProps(anime: $anime, type: $type, cover: $cover, title: $title, offset: $offset, all: $all, stream: $stream, hasUrl: $hasUrl)';
}


}

/// @nodoc
abstract mixin class _$PlayerPropsCopyWith<$Res> implements $PlayerPropsCopyWith<$Res> {
  factory _$PlayerPropsCopyWith(_PlayerProps value, $Res Function(_PlayerProps) _then) = __$PlayerPropsCopyWithImpl;
@override @useResult
$Res call({
 String anime, AnimeType type, String cover, String title, int offset, int all, String stream, bool hasUrl
});




}
/// @nodoc
class __$PlayerPropsCopyWithImpl<$Res>
    implements _$PlayerPropsCopyWith<$Res> {
  __$PlayerPropsCopyWithImpl(this._self, this._then);

  final _PlayerProps _self;
  final $Res Function(_PlayerProps) _then;

/// Create a copy of PlayerProps
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anime = null,Object? type = null,Object? cover = null,Object? title = null,Object? offset = null,Object? all = null,Object? stream = null,Object? hasUrl = null,}) {
  return _then(_PlayerProps(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as String,hasUrl: null == hasUrl ? _self.hasUrl : hasUrl // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CurrentStream {

 String get id; int get offset; String get title; String get anime; String get cover; String get url;
/// Create a copy of CurrentStream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentStreamCopyWith<CurrentStream> get copyWith => _$CurrentStreamCopyWithImpl<CurrentStream>(this as CurrentStream, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentStream&&(identical(other.id, id) || other.id == id)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.title, title) || other.title == title)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,id,offset,title,anime,cover,url);

@override
String toString() {
  return 'CurrentStream(id: $id, offset: $offset, title: $title, anime: $anime, cover: $cover, url: $url)';
}


}

/// @nodoc
abstract mixin class $CurrentStreamCopyWith<$Res>  {
  factory $CurrentStreamCopyWith(CurrentStream value, $Res Function(CurrentStream) _then) = _$CurrentStreamCopyWithImpl;
@useResult
$Res call({
 String id, int offset, String title, String anime, String cover, String url
});




}
/// @nodoc
class _$CurrentStreamCopyWithImpl<$Res>
    implements $CurrentStreamCopyWith<$Res> {
  _$CurrentStreamCopyWithImpl(this._self, this._then);

  final CurrentStream _self;
  final $Res Function(CurrentStream) _then;

/// Create a copy of CurrentStream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? offset = null,Object? title = null,Object? anime = null,Object? cover = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentStream].
extension CurrentStreamPatterns on CurrentStream {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentStream value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentStream() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentStream value)  $default,){
final _that = this;
switch (_that) {
case _CurrentStream():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentStream value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentStream() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int offset,  String title,  String anime,  String cover,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentStream() when $default != null:
return $default(_that.id,_that.offset,_that.title,_that.anime,_that.cover,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int offset,  String title,  String anime,  String cover,  String url)  $default,) {final _that = this;
switch (_that) {
case _CurrentStream():
return $default(_that.id,_that.offset,_that.title,_that.anime,_that.cover,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int offset,  String title,  String anime,  String cover,  String url)?  $default,) {final _that = this;
switch (_that) {
case _CurrentStream() when $default != null:
return $default(_that.id,_that.offset,_that.title,_that.anime,_that.cover,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _CurrentStream implements CurrentStream {
   _CurrentStream({required this.id, required this.offset, required this.title, required this.anime, required this.cover, required this.url});
  

@override final  String id;
@override final  int offset;
@override final  String title;
@override final  String anime;
@override final  String cover;
@override final  String url;

/// Create a copy of CurrentStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentStreamCopyWith<_CurrentStream> get copyWith => __$CurrentStreamCopyWithImpl<_CurrentStream>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentStream&&(identical(other.id, id) || other.id == id)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.title, title) || other.title == title)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,id,offset,title,anime,cover,url);

@override
String toString() {
  return 'CurrentStream(id: $id, offset: $offset, title: $title, anime: $anime, cover: $cover, url: $url)';
}


}

/// @nodoc
abstract mixin class _$CurrentStreamCopyWith<$Res> implements $CurrentStreamCopyWith<$Res> {
  factory _$CurrentStreamCopyWith(_CurrentStream value, $Res Function(_CurrentStream) _then) = __$CurrentStreamCopyWithImpl;
@override @useResult
$Res call({
 String id, int offset, String title, String anime, String cover, String url
});




}
/// @nodoc
class __$CurrentStreamCopyWithImpl<$Res>
    implements _$CurrentStreamCopyWith<$Res> {
  __$CurrentStreamCopyWithImpl(this._self, this._then);

  final _CurrentStream _self;
  final $Res Function(_CurrentStream) _then;

/// Create a copy of CurrentStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? offset = null,Object? title = null,Object? anime = null,Object? cover = null,Object? url = null,}) {
  return _then(_CurrentStream(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
