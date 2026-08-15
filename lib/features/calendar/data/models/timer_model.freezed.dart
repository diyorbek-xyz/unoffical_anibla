// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerModel {

@HiveField(0)@JsonKey(name: "media") AnimeModel? get anime;@HiveField(1)@JsonKey(name: "_id") String? get id;@HiveField(4)@JsonKey(name: "mediaType") AnimeType? get type;@HiveField(5)@JsonKey(name: "episode_id") EpisodeModel? get episode;@HiveField(3) DateTime? get time;
/// Create a copy of TimerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerModelCopyWith<TimerModel> get copyWith => _$TimerModelCopyWithImpl<TimerModel>(this as TimerModel, _$identity);

  /// Serializes this TimerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerModel&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,id,type,episode,time);

@override
String toString() {
  return 'TimerModel(anime: $anime, id: $id, type: $type, episode: $episode, time: $time)';
}


}

/// @nodoc
abstract mixin class $TimerModelCopyWith<$Res>  {
  factory $TimerModelCopyWith(TimerModel value, $Res Function(TimerModel) _then) = _$TimerModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "media") AnimeModel? anime,@HiveField(1)@JsonKey(name: "_id") String? id,@HiveField(4)@JsonKey(name: "mediaType") AnimeType? type,@HiveField(5)@JsonKey(name: "episode_id") EpisodeModel? episode,@HiveField(3) DateTime? time
});


$AnimeModelCopyWith<$Res>? get anime;

}
/// @nodoc
class _$TimerModelCopyWithImpl<$Res>
    implements $TimerModelCopyWith<$Res> {
  _$TimerModelCopyWithImpl(this._self, this._then);

  final TimerModel _self;
  final $Res Function(TimerModel) _then;

/// Create a copy of TimerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anime = freezed,Object? id = freezed,Object? type = freezed,Object? episode = freezed,Object? time = freezed,}) {
  return _then(_self.copyWith(
anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EpisodeModel?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of TimerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeModelCopyWith<$Res>? get anime {
    if (_self.anime == null) {
    return null;
  }

  return $AnimeModelCopyWith<$Res>(_self.anime!, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimerModel].
extension TimerModelPatterns on TimerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerModel value)  $default,){
final _that = this;
switch (_that) {
case _TimerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "media")  AnimeModel? anime, @HiveField(1)@JsonKey(name: "_id")  String? id, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType? type, @HiveField(5)@JsonKey(name: "episode_id")  EpisodeModel? episode, @HiveField(3)  DateTime? time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerModel() when $default != null:
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "media")  AnimeModel? anime, @HiveField(1)@JsonKey(name: "_id")  String? id, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType? type, @HiveField(5)@JsonKey(name: "episode_id")  EpisodeModel? episode, @HiveField(3)  DateTime? time)  $default,) {final _that = this;
switch (_that) {
case _TimerModel():
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.time);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "media")  AnimeModel? anime, @HiveField(1)@JsonKey(name: "_id")  String? id, @HiveField(4)@JsonKey(name: "mediaType")  AnimeType? type, @HiveField(5)@JsonKey(name: "episode_id")  EpisodeModel? episode, @HiveField(3)  DateTime? time)?  $default,) {final _that = this;
switch (_that) {
case _TimerModel() when $default != null:
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerModel implements TimerModel {
   _TimerModel({@HiveField(0)@JsonKey(name: "media") this.anime, @HiveField(1)@JsonKey(name: "_id") this.id, @HiveField(4)@JsonKey(name: "mediaType") this.type, @HiveField(5)@JsonKey(name: "episode_id") this.episode, @HiveField(3) this.time});
  factory _TimerModel.fromJson(Map<String, dynamic> json) => _$TimerModelFromJson(json);

@override@HiveField(0)@JsonKey(name: "media") final  AnimeModel? anime;
@override@HiveField(1)@JsonKey(name: "_id") final  String? id;
@override@HiveField(4)@JsonKey(name: "mediaType") final  AnimeType? type;
@override@HiveField(5)@JsonKey(name: "episode_id") final  EpisodeModel? episode;
@override@HiveField(3) final  DateTime? time;

/// Create a copy of TimerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerModelCopyWith<_TimerModel> get copyWith => __$TimerModelCopyWithImpl<_TimerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerModel&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,id,type,episode,time);

@override
String toString() {
  return 'TimerModel(anime: $anime, id: $id, type: $type, episode: $episode, time: $time)';
}


}

/// @nodoc
abstract mixin class _$TimerModelCopyWith<$Res> implements $TimerModelCopyWith<$Res> {
  factory _$TimerModelCopyWith(_TimerModel value, $Res Function(_TimerModel) _then) = __$TimerModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "media") AnimeModel? anime,@HiveField(1)@JsonKey(name: "_id") String? id,@HiveField(4)@JsonKey(name: "mediaType") AnimeType? type,@HiveField(5)@JsonKey(name: "episode_id") EpisodeModel? episode,@HiveField(3) DateTime? time
});


@override $AnimeModelCopyWith<$Res>? get anime;

}
/// @nodoc
class __$TimerModelCopyWithImpl<$Res>
    implements _$TimerModelCopyWith<$Res> {
  __$TimerModelCopyWithImpl(this._self, this._then);

  final _TimerModel _self;
  final $Res Function(_TimerModel) _then;

/// Create a copy of TimerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anime = freezed,Object? id = freezed,Object? type = freezed,Object? episode = freezed,Object? time = freezed,}) {
  return _then(_TimerModel(
anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EpisodeModel?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of TimerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeModelCopyWith<$Res>? get anime {
    if (_self.anime == null) {
    return null;
  }

  return $AnimeModelCopyWith<$Res>(_self.anime!, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}

// dart format on
