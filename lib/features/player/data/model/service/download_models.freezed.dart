// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DownloadState {

@HiveField(0) String get id;@HiveField(1) int get downloaded;@HiveField(2) int get total;@HiveField(3) double get speed;@HiveField(4) DownloadStatus get status;@HiveField(5) int get bandwidth;@HiveField(6) double get duration;
/// Create a copy of DownloadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadStateCopyWith<DownloadState> get copyWith => _$DownloadStateCopyWithImpl<DownloadState>(this as DownloadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadState&&(identical(other.id, id) || other.id == id)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded)&&(identical(other.total, total) || other.total == total)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.status, status) || other.status == status)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,downloaded,total,speed,status,bandwidth,duration);

@override
String toString() {
  return 'DownloadState(id: $id, downloaded: $downloaded, total: $total, speed: $speed, status: $status, bandwidth: $bandwidth, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $DownloadStateCopyWith<$Res>  {
  factory $DownloadStateCopyWith(DownloadState value, $Res Function(DownloadState) _then) = _$DownloadStateCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) int downloaded,@HiveField(2) int total,@HiveField(3) double speed,@HiveField(4) DownloadStatus status,@HiveField(5) int bandwidth,@HiveField(6) double duration
});




}
/// @nodoc
class _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadStateCopyWith<$Res> {
  _$DownloadStateCopyWithImpl(this._self, this._then);

  final DownloadState _self;
  final $Res Function(DownloadState) _then;

/// Create a copy of DownloadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? downloaded = null,Object? total = null,Object? speed = null,Object? status = null,Object? bandwidth = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DownloadStatus,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadState].
extension DownloadStatePatterns on DownloadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadState value)  $default,){
final _that = this;
switch (_that) {
case _DownloadState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadState value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  int downloaded, @HiveField(2)  int total, @HiveField(3)  double speed, @HiveField(4)  DownloadStatus status, @HiveField(5)  int bandwidth, @HiveField(6)  double duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadState() when $default != null:
return $default(_that.id,_that.downloaded,_that.total,_that.speed,_that.status,_that.bandwidth,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  int downloaded, @HiveField(2)  int total, @HiveField(3)  double speed, @HiveField(4)  DownloadStatus status, @HiveField(5)  int bandwidth, @HiveField(6)  double duration)  $default,) {final _that = this;
switch (_that) {
case _DownloadState():
return $default(_that.id,_that.downloaded,_that.total,_that.speed,_that.status,_that.bandwidth,_that.duration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  int downloaded, @HiveField(2)  int total, @HiveField(3)  double speed, @HiveField(4)  DownloadStatus status, @HiveField(5)  int bandwidth, @HiveField(6)  double duration)?  $default,) {final _that = this;
switch (_that) {
case _DownloadState() when $default != null:
return $default(_that.id,_that.downloaded,_that.total,_that.speed,_that.status,_that.bandwidth,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _DownloadState extends DownloadState {
   _DownloadState({@HiveField(0) required this.id, @HiveField(1) required this.downloaded, @HiveField(2) required this.total, @HiveField(3) required this.speed, @HiveField(4) required this.status, @HiveField(5) required this.bandwidth, @HiveField(6) required this.duration}): super._();
  

@override@HiveField(0) final  String id;
@override@HiveField(1) final  int downloaded;
@override@HiveField(2) final  int total;
@override@HiveField(3) final  double speed;
@override@HiveField(4) final  DownloadStatus status;
@override@HiveField(5) final  int bandwidth;
@override@HiveField(6) final  double duration;

/// Create a copy of DownloadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadStateCopyWith<_DownloadState> get copyWith => __$DownloadStateCopyWithImpl<_DownloadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadState&&(identical(other.id, id) || other.id == id)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded)&&(identical(other.total, total) || other.total == total)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.status, status) || other.status == status)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,downloaded,total,speed,status,bandwidth,duration);

@override
String toString() {
  return 'DownloadState(id: $id, downloaded: $downloaded, total: $total, speed: $speed, status: $status, bandwidth: $bandwidth, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$DownloadStateCopyWith<$Res> implements $DownloadStateCopyWith<$Res> {
  factory _$DownloadStateCopyWith(_DownloadState value, $Res Function(_DownloadState) _then) = __$DownloadStateCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) int downloaded,@HiveField(2) int total,@HiveField(3) double speed,@HiveField(4) DownloadStatus status,@HiveField(5) int bandwidth,@HiveField(6) double duration
});




}
/// @nodoc
class __$DownloadStateCopyWithImpl<$Res>
    implements _$DownloadStateCopyWith<$Res> {
  __$DownloadStateCopyWithImpl(this._self, this._then);

  final _DownloadState _self;
  final $Res Function(_DownloadState) _then;

/// Create a copy of DownloadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? downloaded = null,Object? total = null,Object? speed = null,Object? status = null,Object? bandwidth = null,Object? duration = null,}) {
  return _then(_DownloadState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DownloadStatus,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$DownloadTask {

@HiveField(0) MasterPlaylist get masterPlaylist;@HiveField(1) MediaPlaylist get mediaPlaylist;@HiveField(2) DownloadInfos get infos;@HiveField(4) bool get isCompleted; BehaviorSubject<DownloadState>? get streamController;
/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadTaskCopyWith<DownloadTask> get copyWith => _$DownloadTaskCopyWithImpl<DownloadTask>(this as DownloadTask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadTask&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.mediaPlaylist, mediaPlaylist) || other.mediaPlaylist == mediaPlaylist)&&(identical(other.infos, infos) || other.infos == infos)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.streamController, streamController) || other.streamController == streamController));
}


@override
int get hashCode => Object.hash(runtimeType,masterPlaylist,mediaPlaylist,infos,isCompleted,streamController);

@override
String toString() {
  return 'DownloadTask(masterPlaylist: $masterPlaylist, mediaPlaylist: $mediaPlaylist, infos: $infos, isCompleted: $isCompleted, streamController: $streamController)';
}


}

/// @nodoc
abstract mixin class $DownloadTaskCopyWith<$Res>  {
  factory $DownloadTaskCopyWith(DownloadTask value, $Res Function(DownloadTask) _then) = _$DownloadTaskCopyWithImpl;
@useResult
$Res call({
@HiveField(0) MasterPlaylist masterPlaylist,@HiveField(1) MediaPlaylist mediaPlaylist,@HiveField(2) DownloadInfos infos,@HiveField(4) bool isCompleted, BehaviorSubject<DownloadState>? streamController
});


$MasterPlaylistCopyWith<$Res> get masterPlaylist;$MediaPlaylistCopyWith<$Res> get mediaPlaylist;$DownloadInfosCopyWith<$Res> get infos;

}
/// @nodoc
class _$DownloadTaskCopyWithImpl<$Res>
    implements $DownloadTaskCopyWith<$Res> {
  _$DownloadTaskCopyWithImpl(this._self, this._then);

  final DownloadTask _self;
  final $Res Function(DownloadTask) _then;

/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? masterPlaylist = null,Object? mediaPlaylist = null,Object? infos = null,Object? isCompleted = null,Object? streamController = freezed,}) {
  return _then(_self.copyWith(
masterPlaylist: null == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist,mediaPlaylist: null == mediaPlaylist ? _self.mediaPlaylist : mediaPlaylist // ignore: cast_nullable_to_non_nullable
as MediaPlaylist,infos: null == infos ? _self.infos : infos // ignore: cast_nullable_to_non_nullable
as DownloadInfos,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,streamController: freezed == streamController ? _self.streamController : streamController // ignore: cast_nullable_to_non_nullable
as BehaviorSubject<DownloadState>?,
  ));
}
/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterPlaylistCopyWith<$Res> get masterPlaylist {
  
  return $MasterPlaylistCopyWith<$Res>(_self.masterPlaylist, (value) {
    return _then(_self.copyWith(masterPlaylist: value));
  });
}/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaPlaylistCopyWith<$Res> get mediaPlaylist {
  
  return $MediaPlaylistCopyWith<$Res>(_self.mediaPlaylist, (value) {
    return _then(_self.copyWith(mediaPlaylist: value));
  });
}/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadInfosCopyWith<$Res> get infos {
  
  return $DownloadInfosCopyWith<$Res>(_self.infos, (value) {
    return _then(_self.copyWith(infos: value));
  });
}
}


/// Adds pattern-matching-related methods to [DownloadTask].
extension DownloadTaskPatterns on DownloadTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadTask value)  $default,){
final _that = this;
switch (_that) {
case _DownloadTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadTask value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  MasterPlaylist masterPlaylist, @HiveField(1)  MediaPlaylist mediaPlaylist, @HiveField(2)  DownloadInfos infos, @HiveField(4)  bool isCompleted,  BehaviorSubject<DownloadState>? streamController)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadTask() when $default != null:
return $default(_that.masterPlaylist,_that.mediaPlaylist,_that.infos,_that.isCompleted,_that.streamController);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  MasterPlaylist masterPlaylist, @HiveField(1)  MediaPlaylist mediaPlaylist, @HiveField(2)  DownloadInfos infos, @HiveField(4)  bool isCompleted,  BehaviorSubject<DownloadState>? streamController)  $default,) {final _that = this;
switch (_that) {
case _DownloadTask():
return $default(_that.masterPlaylist,_that.mediaPlaylist,_that.infos,_that.isCompleted,_that.streamController);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  MasterPlaylist masterPlaylist, @HiveField(1)  MediaPlaylist mediaPlaylist, @HiveField(2)  DownloadInfos infos, @HiveField(4)  bool isCompleted,  BehaviorSubject<DownloadState>? streamController)?  $default,) {final _that = this;
switch (_that) {
case _DownloadTask() when $default != null:
return $default(_that.masterPlaylist,_that.mediaPlaylist,_that.infos,_that.isCompleted,_that.streamController);case _:
  return null;

}
}

}

/// @nodoc


class _DownloadTask extends DownloadTask {
   _DownloadTask({@HiveField(0) required this.masterPlaylist, @HiveField(1) required this.mediaPlaylist, @HiveField(2) required this.infos, @HiveField(4) this.isCompleted = false, this.streamController}): super._();
  

@override@HiveField(0) final  MasterPlaylist masterPlaylist;
@override@HiveField(1) final  MediaPlaylist mediaPlaylist;
@override@HiveField(2) final  DownloadInfos infos;
@override@JsonKey()@HiveField(4) final  bool isCompleted;
@override final  BehaviorSubject<DownloadState>? streamController;

/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadTaskCopyWith<_DownloadTask> get copyWith => __$DownloadTaskCopyWithImpl<_DownloadTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadTask&&(identical(other.masterPlaylist, masterPlaylist) || other.masterPlaylist == masterPlaylist)&&(identical(other.mediaPlaylist, mediaPlaylist) || other.mediaPlaylist == mediaPlaylist)&&(identical(other.infos, infos) || other.infos == infos)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.streamController, streamController) || other.streamController == streamController));
}


@override
int get hashCode => Object.hash(runtimeType,masterPlaylist,mediaPlaylist,infos,isCompleted,streamController);

@override
String toString() {
  return 'DownloadTask(masterPlaylist: $masterPlaylist, mediaPlaylist: $mediaPlaylist, infos: $infos, isCompleted: $isCompleted, streamController: $streamController)';
}


}

/// @nodoc
abstract mixin class _$DownloadTaskCopyWith<$Res> implements $DownloadTaskCopyWith<$Res> {
  factory _$DownloadTaskCopyWith(_DownloadTask value, $Res Function(_DownloadTask) _then) = __$DownloadTaskCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) MasterPlaylist masterPlaylist,@HiveField(1) MediaPlaylist mediaPlaylist,@HiveField(2) DownloadInfos infos,@HiveField(4) bool isCompleted, BehaviorSubject<DownloadState>? streamController
});


@override $MasterPlaylistCopyWith<$Res> get masterPlaylist;@override $MediaPlaylistCopyWith<$Res> get mediaPlaylist;@override $DownloadInfosCopyWith<$Res> get infos;

}
/// @nodoc
class __$DownloadTaskCopyWithImpl<$Res>
    implements _$DownloadTaskCopyWith<$Res> {
  __$DownloadTaskCopyWithImpl(this._self, this._then);

  final _DownloadTask _self;
  final $Res Function(_DownloadTask) _then;

/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? masterPlaylist = null,Object? mediaPlaylist = null,Object? infos = null,Object? isCompleted = null,Object? streamController = freezed,}) {
  return _then(_DownloadTask(
masterPlaylist: null == masterPlaylist ? _self.masterPlaylist : masterPlaylist // ignore: cast_nullable_to_non_nullable
as MasterPlaylist,mediaPlaylist: null == mediaPlaylist ? _self.mediaPlaylist : mediaPlaylist // ignore: cast_nullable_to_non_nullable
as MediaPlaylist,infos: null == infos ? _self.infos : infos // ignore: cast_nullable_to_non_nullable
as DownloadInfos,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,streamController: freezed == streamController ? _self.streamController : streamController // ignore: cast_nullable_to_non_nullable
as BehaviorSubject<DownloadState>?,
  ));
}

/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterPlaylistCopyWith<$Res> get masterPlaylist {
  
  return $MasterPlaylistCopyWith<$Res>(_self.masterPlaylist, (value) {
    return _then(_self.copyWith(masterPlaylist: value));
  });
}/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaPlaylistCopyWith<$Res> get mediaPlaylist {
  
  return $MediaPlaylistCopyWith<$Res>(_self.mediaPlaylist, (value) {
    return _then(_self.copyWith(mediaPlaylist: value));
  });
}/// Create a copy of DownloadTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadInfosCopyWith<$Res> get infos {
  
  return $DownloadInfosCopyWith<$Res>(_self.infos, (value) {
    return _then(_self.copyWith(infos: value));
  });
}
}

// dart format on
