// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premiere.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Premiere {

@HiveField(0)@JsonKey(name: "media") Anime get anime;@HiveField(1)@JsonKey(name: "_id") String get id;@HiveField(4)@JsonKey(name: "mediaType") MediaType get type;@HiveField(5)@JsonKey(name: "episode_id") Episode get episode;@HiveField(3)@JsonKey(name: "time") String get date;@HiveField(6)@JsonKey(name: "total_episodes") int get totalEpisodes;
/// Create a copy of Premiere
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiereCopyWith<Premiere> get copyWith => _$PremiereCopyWithImpl<Premiere>(this as Premiere, _$identity);

  /// Serializes this Premiere to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Premiere&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,id,type,episode,date,totalEpisodes);

@override
String toString() {
  return 'Premiere(anime: $anime, id: $id, type: $type, episode: $episode, date: $date, totalEpisodes: $totalEpisodes)';
}


}

/// @nodoc
abstract mixin class $PremiereCopyWith<$Res>  {
  factory $PremiereCopyWith(Premiere value, $Res Function(Premiere) _then) = _$PremiereCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "media") Anime anime,@HiveField(1)@JsonKey(name: "_id") String id,@HiveField(4)@JsonKey(name: "mediaType") MediaType type,@HiveField(5)@JsonKey(name: "episode_id") Episode episode,@HiveField(3)@JsonKey(name: "time") String date,@HiveField(6)@JsonKey(name: "total_episodes") int totalEpisodes
});


$AnimeCopyWith<$Res> get anime;$EpisodeCopyWith<$Res> get episode;

}
/// @nodoc
class _$PremiereCopyWithImpl<$Res>
    implements $PremiereCopyWith<$Res> {
  _$PremiereCopyWithImpl(this._self, this._then);

  final Premiere _self;
  final $Res Function(Premiere) _then;

/// Create a copy of Premiere
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anime = null,Object? id = null,Object? type = null,Object? episode = null,Object? date = null,Object? totalEpisodes = null,}) {
  return _then(_self.copyWith(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Episode,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Premiere
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}/// Create a copy of Premiere
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeCopyWith<$Res> get episode {
  
  return $EpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}
}


/// Adds pattern-matching-related methods to [Premiere].
extension PremierePatterns on Premiere {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Premiere value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Premiere() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Premiere value)  $default,){
final _that = this;
switch (_that) {
case _Premiere():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Premiere value)?  $default,){
final _that = this;
switch (_that) {
case _Premiere() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "media")  Anime anime, @HiveField(1)@JsonKey(name: "_id")  String id, @HiveField(4)@JsonKey(name: "mediaType")  MediaType type, @HiveField(5)@JsonKey(name: "episode_id")  Episode episode, @HiveField(3)@JsonKey(name: "time")  String date, @HiveField(6)@JsonKey(name: "total_episodes")  int totalEpisodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Premiere() when $default != null:
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.date,_that.totalEpisodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "media")  Anime anime, @HiveField(1)@JsonKey(name: "_id")  String id, @HiveField(4)@JsonKey(name: "mediaType")  MediaType type, @HiveField(5)@JsonKey(name: "episode_id")  Episode episode, @HiveField(3)@JsonKey(name: "time")  String date, @HiveField(6)@JsonKey(name: "total_episodes")  int totalEpisodes)  $default,) {final _that = this;
switch (_that) {
case _Premiere():
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.date,_that.totalEpisodes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "media")  Anime anime, @HiveField(1)@JsonKey(name: "_id")  String id, @HiveField(4)@JsonKey(name: "mediaType")  MediaType type, @HiveField(5)@JsonKey(name: "episode_id")  Episode episode, @HiveField(3)@JsonKey(name: "time")  String date, @HiveField(6)@JsonKey(name: "total_episodes")  int totalEpisodes)?  $default,) {final _that = this;
switch (_that) {
case _Premiere() when $default != null:
return $default(_that.anime,_that.id,_that.type,_that.episode,_that.date,_that.totalEpisodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Premiere extends Premiere {
  const _Premiere({@HiveField(0)@JsonKey(name: "media") this.anime = const Anime(), @HiveField(1)@JsonKey(name: "_id") this.id = "", @HiveField(4)@JsonKey(name: "mediaType") this.type = MediaType.serie, @HiveField(5)@JsonKey(name: "episode_id") this.episode = const Episode(), @HiveField(3)@JsonKey(name: "time") this.date = "", @HiveField(6)@JsonKey(name: "total_episodes") this.totalEpisodes = -1}): super._();
  factory _Premiere.fromJson(Map<String, dynamic> json) => _$PremiereFromJson(json);

@override@HiveField(0)@JsonKey(name: "media") final  Anime anime;
@override@HiveField(1)@JsonKey(name: "_id") final  String id;
@override@HiveField(4)@JsonKey(name: "mediaType") final  MediaType type;
@override@HiveField(5)@JsonKey(name: "episode_id") final  Episode episode;
@override@HiveField(3)@JsonKey(name: "time") final  String date;
@override@HiveField(6)@JsonKey(name: "total_episodes") final  int totalEpisodes;

/// Create a copy of Premiere
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiereCopyWith<_Premiere> get copyWith => __$PremiereCopyWithImpl<_Premiere>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PremiereToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Premiere&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.date, date) || other.date == date)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,id,type,episode,date,totalEpisodes);

@override
String toString() {
  return 'Premiere(anime: $anime, id: $id, type: $type, episode: $episode, date: $date, totalEpisodes: $totalEpisodes)';
}


}

/// @nodoc
abstract mixin class _$PremiereCopyWith<$Res> implements $PremiereCopyWith<$Res> {
  factory _$PremiereCopyWith(_Premiere value, $Res Function(_Premiere) _then) = __$PremiereCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "media") Anime anime,@HiveField(1)@JsonKey(name: "_id") String id,@HiveField(4)@JsonKey(name: "mediaType") MediaType type,@HiveField(5)@JsonKey(name: "episode_id") Episode episode,@HiveField(3)@JsonKey(name: "time") String date,@HiveField(6)@JsonKey(name: "total_episodes") int totalEpisodes
});


@override $AnimeCopyWith<$Res> get anime;@override $EpisodeCopyWith<$Res> get episode;

}
/// @nodoc
class __$PremiereCopyWithImpl<$Res>
    implements _$PremiereCopyWith<$Res> {
  __$PremiereCopyWithImpl(this._self, this._then);

  final _Premiere _self;
  final $Res Function(_Premiere) _then;

/// Create a copy of Premiere
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anime = null,Object? id = null,Object? type = null,Object? episode = null,Object? date = null,Object? totalEpisodes = null,}) {
  return _then(_Premiere(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as Anime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as Episode,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Premiere
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get anime {
  
  return $AnimeCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}/// Create a copy of Premiere
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
