// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Timer {

@HiveField(0)@JsonKey(name: "media") Anime get anime;@HiveField(1)@JsonKey(name: "_id") String get id;@HiveField(4)@JsonKey(name: "mediaType") AnimeType get type;@HiveField(5)@JsonKey(name: "episode_id") Episode get episode;@HiveField(3) String get date;
/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerCopyWith<Timer> get copyWith => _$TimerCopyWithImpl<Timer>(this as Timer, _$identity);

  /// Serializes this Timer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timer&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,id,type,episode,date);

@override
String toString() {
  return 'Timer(anime: $anime, id: $id, type: $type, episode: $episode, date: $date)';
}


}

/// @nodoc
abstract mixin class $TimerCopyWith<$Res>  {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) _then) = _$TimerCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "media") Anime anime,@HiveField(1)@JsonKey(name: "_id") String id,@HiveField(4)@JsonKey(name: "mediaType") AnimeType type,@HiveField(5)@JsonKey(name: "episode_id") Episode episode,@HiveField(3) String date
});


$AnimeCopyWith<$Res> get anime;$EpisodeCopyWith<$Res> get episode;

}
/// @nodoc
class _$TimerCopyWithImpl<$Res>
    implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._self, this._then);

  final Timer _self;
  final $Res Function(Timer) _then;

/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anime = null,Object? id = null,Object? type = null,Object? episode = null,Object? date = null,}) {
  return _then(_self.copyWith(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Episode,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeCopyWith<$Res> get episode {
  
  return $EpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}
}


/// Adds pattern-matching-related methods to [Timer].
extension TimerPatterns on Timer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Timer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Timer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Timer value)  $default,){
final _that = this;
switch (_that) {
case _Timer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Timer value)?  $default,){
final _that = this;
switch (_that) {
case _Timer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "media")  Anime anime, @HiveField(1)@JsonKey(name: "_id")  String id, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType type, @HiveField(5)@JsonKey(name: "episode_id")  Episode episode, @HiveField(3)  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timer() when $default != null:
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "media")  Anime anime, @HiveField(1)@JsonKey(name: "_id")  String id, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType type, @HiveField(5)@JsonKey(name: "episode_id")  Episode episode, @HiveField(3)  String date)  $default,) {final _that = this;
switch (_that) {
case _Timer():
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "media")  Anime anime, @HiveField(1)@JsonKey(name: "_id")  String id, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType type, @HiveField(5)@JsonKey(name: "episode_id")  Episode episode, @HiveField(3)  String date)?  $default,) {final _that = this;
switch (_that) {
case _Timer() when $default != null:
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Timer extends Timer {
  const _Timer({@HiveField(0)@JsonKey(name: "media") this.anime = const Anime(), @HiveField(1)@JsonKey(name: "_id") this.id = "", @HiveField(4)@JsonKey(name: "mediaType") this.type = AnimeType.serie, @HiveField(5)@JsonKey(name: "episode_id") this.episode = const Episode(), @HiveField(3) this.date = ""}): super._();
  factory _Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

@override@HiveField(0)@JsonKey(name: "media") final  Anime anime;
@override@HiveField(1)@JsonKey(name: "_id") final  String id;
@override@HiveField(4)@JsonKey(name: "mediaType") final  AnimeType type;
@override@HiveField(5)@JsonKey(name: "episode_id") final  Episode episode;
@override@JsonKey()@HiveField(3) final  String date;

/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerCopyWith<_Timer> get copyWith => __$TimerCopyWithImpl<_Timer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timer&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,id,type,episode,date);

@override
String toString() {
  return 'Timer(anime: $anime, id: $id, type: $type, episode: $episode, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TimerCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$TimerCopyWith(_Timer value, $Res Function(_Timer) _then) = __$TimerCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "media") Anime anime,@HiveField(1)@JsonKey(name: "_id") String id,@HiveField(4)@JsonKey(name: "mediaType") AnimeType type,@HiveField(5)@JsonKey(name: "episode_id") Episode episode,@HiveField(3) String date
});


@override $AnimeCopyWith<$Res> get anime;@override $EpisodeCopyWith<$Res> get episode;

}
/// @nodoc
class __$TimerCopyWithImpl<$Res>
    implements _$TimerCopyWith<$Res> {
  __$TimerCopyWithImpl(this._self, this._then);

  final _Timer _self;
  final $Res Function(_Timer) _then;

/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anime = null,Object? id = null,Object? type = null,Object? episode = null,Object? date = null,}) {
  return _then(_Timer(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Episode,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeCopyWith<$Res> get episode {
  
  return $EpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}
}

// dart format on
