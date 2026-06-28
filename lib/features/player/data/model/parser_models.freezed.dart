// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parser_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MasterPlaylist {

@HiveField(0) List<Variant> get variants;@HiveField(1) int get version;@HiveField(2) String get downloadUrl;@HiveField(3) String get localUrl;
/// Create a copy of MasterPlaylist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterPlaylistCopyWith<MasterPlaylist> get copyWith => _$MasterPlaylistCopyWithImpl<MasterPlaylist>(this as MasterPlaylist, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterPlaylist&&const DeepCollectionEquality().equals(other.variants, variants)&&(identical(other.version, version) || other.version == version)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(variants),version,downloadUrl,localUrl);

@override
String toString() {
  return 'MasterPlaylist(variants: $variants, version: $version, downloadUrl: $downloadUrl, localUrl: $localUrl)';
}


}

/// @nodoc
abstract mixin class $MasterPlaylistCopyWith<$Res>  {
  factory $MasterPlaylistCopyWith(MasterPlaylist value, $Res Function(MasterPlaylist) _then) = _$MasterPlaylistCopyWithImpl;
@useResult
$Res call({
@HiveField(0) List<Variant> variants,@HiveField(1) int version,@HiveField(2) String downloadUrl,@HiveField(3) String localUrl
});




}
/// @nodoc
class _$MasterPlaylistCopyWithImpl<$Res>
    implements $MasterPlaylistCopyWith<$Res> {
  _$MasterPlaylistCopyWithImpl(this._self, this._then);

  final MasterPlaylist _self;
  final $Res Function(MasterPlaylist) _then;

/// Create a copy of MasterPlaylist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variants = null,Object? version = null,Object? downloadUrl = null,Object? localUrl = null,}) {
  return _then(_self.copyWith(
variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variant>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MasterPlaylist].
extension MasterPlaylistPatterns on MasterPlaylist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasterPlaylist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasterPlaylist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasterPlaylist value)  $default,){
final _that = this;
switch (_that) {
case _MasterPlaylist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasterPlaylist value)?  $default,){
final _that = this;
switch (_that) {
case _MasterPlaylist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  List<Variant> variants, @HiveField(1)  int version, @HiveField(2)  String downloadUrl, @HiveField(3)  String localUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasterPlaylist() when $default != null:
return $default(_that.variants,_that.version,_that.downloadUrl,_that.localUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  List<Variant> variants, @HiveField(1)  int version, @HiveField(2)  String downloadUrl, @HiveField(3)  String localUrl)  $default,) {final _that = this;
switch (_that) {
case _MasterPlaylist():
return $default(_that.variants,_that.version,_that.downloadUrl,_that.localUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  List<Variant> variants, @HiveField(1)  int version, @HiveField(2)  String downloadUrl, @HiveField(3)  String localUrl)?  $default,) {final _that = this;
switch (_that) {
case _MasterPlaylist() when $default != null:
return $default(_that.variants,_that.version,_that.downloadUrl,_that.localUrl);case _:
  return null;

}
}

}

/// @nodoc


class _MasterPlaylist extends MasterPlaylist {
   _MasterPlaylist({@HiveField(0) required final  List<Variant> variants, @HiveField(1) required this.version, @HiveField(2) required this.downloadUrl, @HiveField(3) required this.localUrl}): _variants = variants,super._();
  

 final  List<Variant> _variants;
@override@HiveField(0) List<Variant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override@HiveField(1) final  int version;
@override@HiveField(2) final  String downloadUrl;
@override@HiveField(3) final  String localUrl;

/// Create a copy of MasterPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasterPlaylistCopyWith<_MasterPlaylist> get copyWith => __$MasterPlaylistCopyWithImpl<_MasterPlaylist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MasterPlaylist&&const DeepCollectionEquality().equals(other._variants, _variants)&&(identical(other.version, version) || other.version == version)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_variants),version,downloadUrl,localUrl);

@override
String toString() {
  return 'MasterPlaylist(variants: $variants, version: $version, downloadUrl: $downloadUrl, localUrl: $localUrl)';
}


}

/// @nodoc
abstract mixin class _$MasterPlaylistCopyWith<$Res> implements $MasterPlaylistCopyWith<$Res> {
  factory _$MasterPlaylistCopyWith(_MasterPlaylist value, $Res Function(_MasterPlaylist) _then) = __$MasterPlaylistCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) List<Variant> variants,@HiveField(1) int version,@HiveField(2) String downloadUrl,@HiveField(3) String localUrl
});




}
/// @nodoc
class __$MasterPlaylistCopyWithImpl<$Res>
    implements _$MasterPlaylistCopyWith<$Res> {
  __$MasterPlaylistCopyWithImpl(this._self, this._then);

  final _MasterPlaylist _self;
  final $Res Function(_MasterPlaylist) _then;

/// Create a copy of MasterPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variants = null,Object? version = null,Object? downloadUrl = null,Object? localUrl = null,}) {
  return _then(_MasterPlaylist(
variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variant>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MediaPlaylist {

@HiveField(0) List<Chunk> get chunks;@HiveField(1) String get downloadUrl;@HiveField(2) String get localUrl;@HiveField(3) double get targetDuration;@HiveField(4) String get type;@HiveField(5) int get version;@HiveField(6) int get startIndex;@HiveField(7) int get bandwidth;@HiveField(8) int get height;@HiveField(9) int get width;@HiveField(10) dynamic get codecs;
/// Create a copy of MediaPlaylist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaPlaylistCopyWith<MediaPlaylist> get copyWith => _$MediaPlaylistCopyWithImpl<MediaPlaylist>(this as MediaPlaylist, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaPlaylist&&const DeepCollectionEquality().equals(other.chunks, chunks)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl)&&(identical(other.targetDuration, targetDuration) || other.targetDuration == targetDuration)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&const DeepCollectionEquality().equals(other.codecs, codecs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chunks),downloadUrl,localUrl,targetDuration,type,version,startIndex,bandwidth,height,width,const DeepCollectionEquality().hash(codecs));

@override
String toString() {
  return 'MediaPlaylist(chunks: $chunks, downloadUrl: $downloadUrl, localUrl: $localUrl, targetDuration: $targetDuration, type: $type, version: $version, startIndex: $startIndex, bandwidth: $bandwidth, height: $height, width: $width, codecs: $codecs)';
}


}

/// @nodoc
abstract mixin class $MediaPlaylistCopyWith<$Res>  {
  factory $MediaPlaylistCopyWith(MediaPlaylist value, $Res Function(MediaPlaylist) _then) = _$MediaPlaylistCopyWithImpl;
@useResult
$Res call({
@HiveField(0) List<Chunk> chunks,@HiveField(1) String downloadUrl,@HiveField(2) String localUrl,@HiveField(3) double targetDuration,@HiveField(4) String type,@HiveField(5) int version,@HiveField(6) int startIndex,@HiveField(7) int bandwidth,@HiveField(8) int height,@HiveField(9) int width,@HiveField(10) dynamic codecs
});




}
/// @nodoc
class _$MediaPlaylistCopyWithImpl<$Res>
    implements $MediaPlaylistCopyWith<$Res> {
  _$MediaPlaylistCopyWithImpl(this._self, this._then);

  final MediaPlaylist _self;
  final $Res Function(MediaPlaylist) _then;

/// Create a copy of MediaPlaylist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chunks = null,Object? downloadUrl = null,Object? localUrl = null,Object? targetDuration = null,Object? type = null,Object? version = null,Object? startIndex = null,Object? bandwidth = null,Object? height = null,Object? width = null,Object? codecs = freezed,}) {
  return _then(_self.copyWith(
chunks: null == chunks ? _self.chunks : chunks // ignore: cast_nullable_to_non_nullable
as List<Chunk>,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,targetDuration: null == targetDuration ? _self.targetDuration : targetDuration // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,codecs: freezed == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaPlaylist].
extension MediaPlaylistPatterns on MediaPlaylist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaPlaylist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaPlaylist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaPlaylist value)  $default,){
final _that = this;
switch (_that) {
case _MediaPlaylist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaPlaylist value)?  $default,){
final _that = this;
switch (_that) {
case _MediaPlaylist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  List<Chunk> chunks, @HiveField(1)  String downloadUrl, @HiveField(2)  String localUrl, @HiveField(3)  double targetDuration, @HiveField(4)  String type, @HiveField(5)  int version, @HiveField(6)  int startIndex, @HiveField(7)  int bandwidth, @HiveField(8)  int height, @HiveField(9)  int width, @HiveField(10)  dynamic codecs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaPlaylist() when $default != null:
return $default(_that.chunks,_that.downloadUrl,_that.localUrl,_that.targetDuration,_that.type,_that.version,_that.startIndex,_that.bandwidth,_that.height,_that.width,_that.codecs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  List<Chunk> chunks, @HiveField(1)  String downloadUrl, @HiveField(2)  String localUrl, @HiveField(3)  double targetDuration, @HiveField(4)  String type, @HiveField(5)  int version, @HiveField(6)  int startIndex, @HiveField(7)  int bandwidth, @HiveField(8)  int height, @HiveField(9)  int width, @HiveField(10)  dynamic codecs)  $default,) {final _that = this;
switch (_that) {
case _MediaPlaylist():
return $default(_that.chunks,_that.downloadUrl,_that.localUrl,_that.targetDuration,_that.type,_that.version,_that.startIndex,_that.bandwidth,_that.height,_that.width,_that.codecs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  List<Chunk> chunks, @HiveField(1)  String downloadUrl, @HiveField(2)  String localUrl, @HiveField(3)  double targetDuration, @HiveField(4)  String type, @HiveField(5)  int version, @HiveField(6)  int startIndex, @HiveField(7)  int bandwidth, @HiveField(8)  int height, @HiveField(9)  int width, @HiveField(10)  dynamic codecs)?  $default,) {final _that = this;
switch (_that) {
case _MediaPlaylist() when $default != null:
return $default(_that.chunks,_that.downloadUrl,_that.localUrl,_that.targetDuration,_that.type,_that.version,_that.startIndex,_that.bandwidth,_that.height,_that.width,_that.codecs);case _:
  return null;

}
}

}

/// @nodoc


class _MediaPlaylist extends MediaPlaylist {
   _MediaPlaylist({@HiveField(0) required final  List<Chunk> chunks, @HiveField(1) required this.downloadUrl, @HiveField(2) required this.localUrl, @HiveField(3) required this.targetDuration, @HiveField(4) required this.type, @HiveField(5) required this.version, @HiveField(6) required this.startIndex, @HiveField(7) required this.bandwidth, @HiveField(8) required this.height, @HiveField(9) required this.width, @HiveField(10) required this.codecs}): _chunks = chunks,super._();
  

 final  List<Chunk> _chunks;
@override@HiveField(0) List<Chunk> get chunks {
  if (_chunks is EqualUnmodifiableListView) return _chunks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chunks);
}

@override@HiveField(1) final  String downloadUrl;
@override@HiveField(2) final  String localUrl;
@override@HiveField(3) final  double targetDuration;
@override@HiveField(4) final  String type;
@override@HiveField(5) final  int version;
@override@HiveField(6) final  int startIndex;
@override@HiveField(7) final  int bandwidth;
@override@HiveField(8) final  int height;
@override@HiveField(9) final  int width;
@override@HiveField(10) final  dynamic codecs;

/// Create a copy of MediaPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaPlaylistCopyWith<_MediaPlaylist> get copyWith => __$MediaPlaylistCopyWithImpl<_MediaPlaylist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaPlaylist&&const DeepCollectionEquality().equals(other._chunks, _chunks)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl)&&(identical(other.targetDuration, targetDuration) || other.targetDuration == targetDuration)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&const DeepCollectionEquality().equals(other.codecs, codecs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chunks),downloadUrl,localUrl,targetDuration,type,version,startIndex,bandwidth,height,width,const DeepCollectionEquality().hash(codecs));

@override
String toString() {
  return 'MediaPlaylist(chunks: $chunks, downloadUrl: $downloadUrl, localUrl: $localUrl, targetDuration: $targetDuration, type: $type, version: $version, startIndex: $startIndex, bandwidth: $bandwidth, height: $height, width: $width, codecs: $codecs)';
}


}

/// @nodoc
abstract mixin class _$MediaPlaylistCopyWith<$Res> implements $MediaPlaylistCopyWith<$Res> {
  factory _$MediaPlaylistCopyWith(_MediaPlaylist value, $Res Function(_MediaPlaylist) _then) = __$MediaPlaylistCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) List<Chunk> chunks,@HiveField(1) String downloadUrl,@HiveField(2) String localUrl,@HiveField(3) double targetDuration,@HiveField(4) String type,@HiveField(5) int version,@HiveField(6) int startIndex,@HiveField(7) int bandwidth,@HiveField(8) int height,@HiveField(9) int width,@HiveField(10) dynamic codecs
});




}
/// @nodoc
class __$MediaPlaylistCopyWithImpl<$Res>
    implements _$MediaPlaylistCopyWith<$Res> {
  __$MediaPlaylistCopyWithImpl(this._self, this._then);

  final _MediaPlaylist _self;
  final $Res Function(_MediaPlaylist) _then;

/// Create a copy of MediaPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chunks = null,Object? downloadUrl = null,Object? localUrl = null,Object? targetDuration = null,Object? type = null,Object? version = null,Object? startIndex = null,Object? bandwidth = null,Object? height = null,Object? width = null,Object? codecs = freezed,}) {
  return _then(_MediaPlaylist(
chunks: null == chunks ? _self._chunks : chunks // ignore: cast_nullable_to_non_nullable
as List<Chunk>,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,targetDuration: null == targetDuration ? _self.targetDuration : targetDuration // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,codecs: freezed == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$Chunk {

@HiveField(0) String get downloadUrl;@HiveField(1) double get duration;@HiveField(2) String get localUrl;@HiveField(3) String get relativeUrl;
/// Create a copy of Chunk
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChunkCopyWith<Chunk> get copyWith => _$ChunkCopyWithImpl<Chunk>(this as Chunk, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chunk&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl)&&(identical(other.relativeUrl, relativeUrl) || other.relativeUrl == relativeUrl));
}


@override
int get hashCode => Object.hash(runtimeType,downloadUrl,duration,localUrl,relativeUrl);

@override
String toString() {
  return 'Chunk(downloadUrl: $downloadUrl, duration: $duration, localUrl: $localUrl, relativeUrl: $relativeUrl)';
}


}

/// @nodoc
abstract mixin class $ChunkCopyWith<$Res>  {
  factory $ChunkCopyWith(Chunk value, $Res Function(Chunk) _then) = _$ChunkCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String downloadUrl,@HiveField(1) double duration,@HiveField(2) String localUrl,@HiveField(3) String relativeUrl
});




}
/// @nodoc
class _$ChunkCopyWithImpl<$Res>
    implements $ChunkCopyWith<$Res> {
  _$ChunkCopyWithImpl(this._self, this._then);

  final Chunk _self;
  final $Res Function(Chunk) _then;

/// Create a copy of Chunk
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downloadUrl = null,Object? duration = null,Object? localUrl = null,Object? relativeUrl = null,}) {
  return _then(_self.copyWith(
downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,relativeUrl: null == relativeUrl ? _self.relativeUrl : relativeUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Chunk].
extension ChunkPatterns on Chunk {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chunk value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chunk() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chunk value)  $default,){
final _that = this;
switch (_that) {
case _Chunk():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chunk value)?  $default,){
final _that = this;
switch (_that) {
case _Chunk() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String downloadUrl, @HiveField(1)  double duration, @HiveField(2)  String localUrl, @HiveField(3)  String relativeUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chunk() when $default != null:
return $default(_that.downloadUrl,_that.duration,_that.localUrl,_that.relativeUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String downloadUrl, @HiveField(1)  double duration, @HiveField(2)  String localUrl, @HiveField(3)  String relativeUrl)  $default,) {final _that = this;
switch (_that) {
case _Chunk():
return $default(_that.downloadUrl,_that.duration,_that.localUrl,_that.relativeUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String downloadUrl, @HiveField(1)  double duration, @HiveField(2)  String localUrl, @HiveField(3)  String relativeUrl)?  $default,) {final _that = this;
switch (_that) {
case _Chunk() when $default != null:
return $default(_that.downloadUrl,_that.duration,_that.localUrl,_that.relativeUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Chunk extends Chunk {
   _Chunk({@HiveField(0) required this.downloadUrl, @HiveField(1) required this.duration, @HiveField(2) required this.localUrl, @HiveField(3) required this.relativeUrl}): super._();
  

@override@HiveField(0) final  String downloadUrl;
@override@HiveField(1) final  double duration;
@override@HiveField(2) final  String localUrl;
@override@HiveField(3) final  String relativeUrl;

/// Create a copy of Chunk
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChunkCopyWith<_Chunk> get copyWith => __$ChunkCopyWithImpl<_Chunk>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chunk&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl)&&(identical(other.relativeUrl, relativeUrl) || other.relativeUrl == relativeUrl));
}


@override
int get hashCode => Object.hash(runtimeType,downloadUrl,duration,localUrl,relativeUrl);

@override
String toString() {
  return 'Chunk(downloadUrl: $downloadUrl, duration: $duration, localUrl: $localUrl, relativeUrl: $relativeUrl)';
}


}

/// @nodoc
abstract mixin class _$ChunkCopyWith<$Res> implements $ChunkCopyWith<$Res> {
  factory _$ChunkCopyWith(_Chunk value, $Res Function(_Chunk) _then) = __$ChunkCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String downloadUrl,@HiveField(1) double duration,@HiveField(2) String localUrl,@HiveField(3) String relativeUrl
});




}
/// @nodoc
class __$ChunkCopyWithImpl<$Res>
    implements _$ChunkCopyWith<$Res> {
  __$ChunkCopyWithImpl(this._self, this._then);

  final _Chunk _self;
  final $Res Function(_Chunk) _then;

/// Create a copy of Chunk
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downloadUrl = null,Object? duration = null,Object? localUrl = null,Object? relativeUrl = null,}) {
  return _then(_Chunk(
downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,relativeUrl: null == relativeUrl ? _self.relativeUrl : relativeUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Variant {

@HiveField(0) int get bandwidth;@HiveField(1) String get codecs;@HiveField(2) int get height;@HiveField(3) int get width;@HiveField(4) String get localUrl;@HiveField(5) String get downloadUrl;@HiveField(6) String get relativeUrl;
/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantCopyWith<Variant> get copyWith => _$VariantCopyWithImpl<Variant>(this as Variant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Variant&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.codecs, codecs) || other.codecs == codecs)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.relativeUrl, relativeUrl) || other.relativeUrl == relativeUrl));
}


@override
int get hashCode => Object.hash(runtimeType,bandwidth,codecs,height,width,localUrl,downloadUrl,relativeUrl);

@override
String toString() {
  return 'Variant(bandwidth: $bandwidth, codecs: $codecs, height: $height, width: $width, localUrl: $localUrl, downloadUrl: $downloadUrl, relativeUrl: $relativeUrl)';
}


}

/// @nodoc
abstract mixin class $VariantCopyWith<$Res>  {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) _then) = _$VariantCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int bandwidth,@HiveField(1) String codecs,@HiveField(2) int height,@HiveField(3) int width,@HiveField(4) String localUrl,@HiveField(5) String downloadUrl,@HiveField(6) String relativeUrl
});




}
/// @nodoc
class _$VariantCopyWithImpl<$Res>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._self, this._then);

  final Variant _self;
  final $Res Function(Variant) _then;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bandwidth = null,Object? codecs = null,Object? height = null,Object? width = null,Object? localUrl = null,Object? downloadUrl = null,Object? relativeUrl = null,}) {
  return _then(_self.copyWith(
bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,codecs: null == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,relativeUrl: null == relativeUrl ? _self.relativeUrl : relativeUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Variant].
extension VariantPatterns on Variant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Variant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Variant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Variant value)  $default,){
final _that = this;
switch (_that) {
case _Variant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Variant value)?  $default,){
final _that = this;
switch (_that) {
case _Variant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int bandwidth, @HiveField(1)  String codecs, @HiveField(2)  int height, @HiveField(3)  int width, @HiveField(4)  String localUrl, @HiveField(5)  String downloadUrl, @HiveField(6)  String relativeUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that.bandwidth,_that.codecs,_that.height,_that.width,_that.localUrl,_that.downloadUrl,_that.relativeUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int bandwidth, @HiveField(1)  String codecs, @HiveField(2)  int height, @HiveField(3)  int width, @HiveField(4)  String localUrl, @HiveField(5)  String downloadUrl, @HiveField(6)  String relativeUrl)  $default,) {final _that = this;
switch (_that) {
case _Variant():
return $default(_that.bandwidth,_that.codecs,_that.height,_that.width,_that.localUrl,_that.downloadUrl,_that.relativeUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int bandwidth, @HiveField(1)  String codecs, @HiveField(2)  int height, @HiveField(3)  int width, @HiveField(4)  String localUrl, @HiveField(5)  String downloadUrl, @HiveField(6)  String relativeUrl)?  $default,) {final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that.bandwidth,_that.codecs,_that.height,_that.width,_that.localUrl,_that.downloadUrl,_that.relativeUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Variant extends Variant {
   _Variant({@HiveField(0) required this.bandwidth, @HiveField(1) required this.codecs, @HiveField(2) required this.height, @HiveField(3) required this.width, @HiveField(4) required this.localUrl, @HiveField(5) required this.downloadUrl, @HiveField(6) required this.relativeUrl}): super._();
  

@override@HiveField(0) final  int bandwidth;
@override@HiveField(1) final  String codecs;
@override@HiveField(2) final  int height;
@override@HiveField(3) final  int width;
@override@HiveField(4) final  String localUrl;
@override@HiveField(5) final  String downloadUrl;
@override@HiveField(6) final  String relativeUrl;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantCopyWith<_Variant> get copyWith => __$VariantCopyWithImpl<_Variant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Variant&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.codecs, codecs) || other.codecs == codecs)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.localUrl, localUrl) || other.localUrl == localUrl)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.relativeUrl, relativeUrl) || other.relativeUrl == relativeUrl));
}


@override
int get hashCode => Object.hash(runtimeType,bandwidth,codecs,height,width,localUrl,downloadUrl,relativeUrl);

@override
String toString() {
  return 'Variant(bandwidth: $bandwidth, codecs: $codecs, height: $height, width: $width, localUrl: $localUrl, downloadUrl: $downloadUrl, relativeUrl: $relativeUrl)';
}


}

/// @nodoc
abstract mixin class _$VariantCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$VariantCopyWith(_Variant value, $Res Function(_Variant) _then) = __$VariantCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int bandwidth,@HiveField(1) String codecs,@HiveField(2) int height,@HiveField(3) int width,@HiveField(4) String localUrl,@HiveField(5) String downloadUrl,@HiveField(6) String relativeUrl
});




}
/// @nodoc
class __$VariantCopyWithImpl<$Res>
    implements _$VariantCopyWith<$Res> {
  __$VariantCopyWithImpl(this._self, this._then);

  final _Variant _self;
  final $Res Function(_Variant) _then;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bandwidth = null,Object? codecs = null,Object? height = null,Object? width = null,Object? localUrl = null,Object? downloadUrl = null,Object? relativeUrl = null,}) {
  return _then(_Variant(
bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,codecs: null == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,localUrl: null == localUrl ? _self.localUrl : localUrl // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,relativeUrl: null == relativeUrl ? _self.relativeUrl : relativeUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ExtraInfos {

@HiveField(0) double get totalDuration;@HiveField(1) double get totalSize;@HiveField(2) int get bandwidth;
/// Create a copy of ExtraInfos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtraInfosCopyWith<ExtraInfos> get copyWith => _$ExtraInfosCopyWithImpl<ExtraInfos>(this as ExtraInfos, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtraInfos&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth));
}


@override
int get hashCode => Object.hash(runtimeType,totalDuration,totalSize,bandwidth);

@override
String toString() {
  return 'ExtraInfos(totalDuration: $totalDuration, totalSize: $totalSize, bandwidth: $bandwidth)';
}


}

/// @nodoc
abstract mixin class $ExtraInfosCopyWith<$Res>  {
  factory $ExtraInfosCopyWith(ExtraInfos value, $Res Function(ExtraInfos) _then) = _$ExtraInfosCopyWithImpl;
@useResult
$Res call({
@HiveField(0) double totalDuration,@HiveField(1) double totalSize,@HiveField(2) int bandwidth
});




}
/// @nodoc
class _$ExtraInfosCopyWithImpl<$Res>
    implements $ExtraInfosCopyWith<$Res> {
  _$ExtraInfosCopyWithImpl(this._self, this._then);

  final ExtraInfos _self;
  final $Res Function(ExtraInfos) _then;

/// Create a copy of ExtraInfos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDuration = null,Object? totalSize = null,Object? bandwidth = null,}) {
  return _then(_self.copyWith(
totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as double,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as double,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtraInfos].
extension ExtraInfosPatterns on ExtraInfos {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtraInfos value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtraInfos() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtraInfos value)  $default,){
final _that = this;
switch (_that) {
case _ExtraInfos():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtraInfos value)?  $default,){
final _that = this;
switch (_that) {
case _ExtraInfos() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  double totalDuration, @HiveField(1)  double totalSize, @HiveField(2)  int bandwidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtraInfos() when $default != null:
return $default(_that.totalDuration,_that.totalSize,_that.bandwidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  double totalDuration, @HiveField(1)  double totalSize, @HiveField(2)  int bandwidth)  $default,) {final _that = this;
switch (_that) {
case _ExtraInfos():
return $default(_that.totalDuration,_that.totalSize,_that.bandwidth);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  double totalDuration, @HiveField(1)  double totalSize, @HiveField(2)  int bandwidth)?  $default,) {final _that = this;
switch (_that) {
case _ExtraInfos() when $default != null:
return $default(_that.totalDuration,_that.totalSize,_that.bandwidth);case _:
  return null;

}
}

}

/// @nodoc


class _ExtraInfos implements ExtraInfos {
   _ExtraInfos({@HiveField(0) required this.totalDuration, @HiveField(1) required this.totalSize, @HiveField(2) required this.bandwidth});
  

@override@HiveField(0) final  double totalDuration;
@override@HiveField(1) final  double totalSize;
@override@HiveField(2) final  int bandwidth;

/// Create a copy of ExtraInfos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtraInfosCopyWith<_ExtraInfos> get copyWith => __$ExtraInfosCopyWithImpl<_ExtraInfos>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtraInfos&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth));
}


@override
int get hashCode => Object.hash(runtimeType,totalDuration,totalSize,bandwidth);

@override
String toString() {
  return 'ExtraInfos(totalDuration: $totalDuration, totalSize: $totalSize, bandwidth: $bandwidth)';
}


}

/// @nodoc
abstract mixin class _$ExtraInfosCopyWith<$Res> implements $ExtraInfosCopyWith<$Res> {
  factory _$ExtraInfosCopyWith(_ExtraInfos value, $Res Function(_ExtraInfos) _then) = __$ExtraInfosCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) double totalDuration,@HiveField(1) double totalSize,@HiveField(2) int bandwidth
});




}
/// @nodoc
class __$ExtraInfosCopyWithImpl<$Res>
    implements _$ExtraInfosCopyWith<$Res> {
  __$ExtraInfosCopyWithImpl(this._self, this._then);

  final _ExtraInfos _self;
  final $Res Function(_ExtraInfos) _then;

/// Create a copy of ExtraInfos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDuration = null,Object? totalSize = null,Object? bandwidth = null,}) {
  return _then(_ExtraInfos(
totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as double,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as double,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
