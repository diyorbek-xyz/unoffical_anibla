// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryItem {

 String get key; String get age; String get thumbnail; String get updatedAt; String get createdAt; int get duration; int get revision; bool get deleted; bool get completed;@JsonKey(name: "_id") String get id;@JsonKey(name: "user_id") String get userId;@JsonKey(name: "event_at") String get eventAt;@JsonKey(name: "event_id") String get eventId;@JsonKey(name: "purge_at") String get purgeAt;@JsonKey(name: "title_ru") String get titleRu;@JsonKey(name: "title_uz") String get titleUz;@JsonKey(name: "episode_id") String get episodeId;@JsonKey(name: "deleted_at") String get deletedAt;@JsonKey(name: "media_slug") String get mediaSlug;@JsonKey(name: "current_time") int get currentTime;@JsonKey(name: "season_number") int get seasonNumber;@JsonKey(name: "episode_index") int get episodeIndex;@JsonKey(name: "total_episodes") int get totalEpisodes;@JsonKey(name: "episode_number") int get episodeNumber;@JsonKey(name: "available_episodes") int get availableEpisodes;@JsonKey(name: "media_type") MediaType get mediaType;
/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryItemCopyWith<HistoryItem> get copyWith => _$HistoryItemCopyWithImpl<HistoryItem>(this as HistoryItem, _$identity);

  /// Serializes this HistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryItem&&(identical(other.key, key) || other.key == key)&&(identical(other.age, age) || other.age == age)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.eventAt, eventAt) || other.eventAt == eventAt)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.purgeAt, purgeAt) || other.purgeAt == purgeAt)&&(identical(other.titleRu, titleRu) || other.titleRu == titleRu)&&(identical(other.titleUz, titleUz) || other.titleUz == titleUz)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.mediaSlug, mediaSlug) || other.mediaSlug == mediaSlug)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.episodeIndex, episodeIndex) || other.episodeIndex == episodeIndex)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.availableEpisodes, availableEpisodes) || other.availableEpisodes == availableEpisodes)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,key,age,thumbnail,updatedAt,createdAt,duration,revision,deleted,completed,id,userId,eventAt,eventId,purgeAt,titleRu,titleUz,episodeId,deletedAt,mediaSlug,currentTime,seasonNumber,episodeIndex,totalEpisodes,episodeNumber,availableEpisodes,mediaType]);

@override
String toString() {
  return 'HistoryItem(key: $key, age: $age, thumbnail: $thumbnail, updatedAt: $updatedAt, createdAt: $createdAt, duration: $duration, revision: $revision, deleted: $deleted, completed: $completed, id: $id, userId: $userId, eventAt: $eventAt, eventId: $eventId, purgeAt: $purgeAt, titleRu: $titleRu, titleUz: $titleUz, episodeId: $episodeId, deletedAt: $deletedAt, mediaSlug: $mediaSlug, currentTime: $currentTime, seasonNumber: $seasonNumber, episodeIndex: $episodeIndex, totalEpisodes: $totalEpisodes, episodeNumber: $episodeNumber, availableEpisodes: $availableEpisodes, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class $HistoryItemCopyWith<$Res>  {
  factory $HistoryItemCopyWith(HistoryItem value, $Res Function(HistoryItem) _then) = _$HistoryItemCopyWithImpl;
@useResult
$Res call({
 String key, String age, String thumbnail, String updatedAt, String createdAt, int duration, int revision, bool deleted, bool completed,@JsonKey(name: "_id") String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "event_at") String eventAt,@JsonKey(name: "event_id") String eventId,@JsonKey(name: "purge_at") String purgeAt,@JsonKey(name: "title_ru") String titleRu,@JsonKey(name: "title_uz") String titleUz,@JsonKey(name: "episode_id") String episodeId,@JsonKey(name: "deleted_at") String deletedAt,@JsonKey(name: "media_slug") String mediaSlug,@JsonKey(name: "current_time") int currentTime,@JsonKey(name: "season_number") int seasonNumber,@JsonKey(name: "episode_index") int episodeIndex,@JsonKey(name: "total_episodes") int totalEpisodes,@JsonKey(name: "episode_number") int episodeNumber,@JsonKey(name: "available_episodes") int availableEpisodes,@JsonKey(name: "media_type") MediaType mediaType
});




}
/// @nodoc
class _$HistoryItemCopyWithImpl<$Res>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._self, this._then);

  final HistoryItem _self;
  final $Res Function(HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? age = null,Object? thumbnail = null,Object? updatedAt = null,Object? createdAt = null,Object? duration = null,Object? revision = null,Object? deleted = null,Object? completed = null,Object? id = null,Object? userId = null,Object? eventAt = null,Object? eventId = null,Object? purgeAt = null,Object? titleRu = null,Object? titleUz = null,Object? episodeId = null,Object? deletedAt = null,Object? mediaSlug = null,Object? currentTime = null,Object? seasonNumber = null,Object? episodeIndex = null,Object? totalEpisodes = null,Object? episodeNumber = null,Object? availableEpisodes = null,Object? mediaType = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventAt: null == eventAt ? _self.eventAt : eventAt // ignore: cast_nullable_to_non_nullable
as String,eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,purgeAt: null == purgeAt ? _self.purgeAt : purgeAt // ignore: cast_nullable_to_non_nullable
as String,titleRu: null == titleRu ? _self.titleRu : titleRu // ignore: cast_nullable_to_non_nullable
as String,titleUz: null == titleUz ? _self.titleUz : titleUz // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,deletedAt: null == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String,mediaSlug: null == mediaSlug ? _self.mediaSlug : mediaSlug // ignore: cast_nullable_to_non_nullable
as String,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as int,seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,episodeIndex: null == episodeIndex ? _self.episodeIndex : episodeIndex // ignore: cast_nullable_to_non_nullable
as int,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,availableEpisodes: null == availableEpisodes ? _self.availableEpisodes : availableEpisodes // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryItem].
extension HistoryItemPatterns on HistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _HistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String age,  String thumbnail,  String updatedAt,  String createdAt,  int duration,  int revision,  bool deleted,  bool completed, @JsonKey(name: "_id")  String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "event_at")  String eventAt, @JsonKey(name: "event_id")  String eventId, @JsonKey(name: "purge_at")  String purgeAt, @JsonKey(name: "title_ru")  String titleRu, @JsonKey(name: "title_uz")  String titleUz, @JsonKey(name: "episode_id")  String episodeId, @JsonKey(name: "deleted_at")  String deletedAt, @JsonKey(name: "media_slug")  String mediaSlug, @JsonKey(name: "current_time")  int currentTime, @JsonKey(name: "season_number")  int seasonNumber, @JsonKey(name: "episode_index")  int episodeIndex, @JsonKey(name: "total_episodes")  int totalEpisodes, @JsonKey(name: "episode_number")  int episodeNumber, @JsonKey(name: "available_episodes")  int availableEpisodes, @JsonKey(name: "media_type")  MediaType mediaType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.key,_that.age,_that.thumbnail,_that.updatedAt,_that.createdAt,_that.duration,_that.revision,_that.deleted,_that.completed,_that.id,_that.userId,_that.eventAt,_that.eventId,_that.purgeAt,_that.titleRu,_that.titleUz,_that.episodeId,_that.deletedAt,_that.mediaSlug,_that.currentTime,_that.seasonNumber,_that.episodeIndex,_that.totalEpisodes,_that.episodeNumber,_that.availableEpisodes,_that.mediaType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String age,  String thumbnail,  String updatedAt,  String createdAt,  int duration,  int revision,  bool deleted,  bool completed, @JsonKey(name: "_id")  String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "event_at")  String eventAt, @JsonKey(name: "event_id")  String eventId, @JsonKey(name: "purge_at")  String purgeAt, @JsonKey(name: "title_ru")  String titleRu, @JsonKey(name: "title_uz")  String titleUz, @JsonKey(name: "episode_id")  String episodeId, @JsonKey(name: "deleted_at")  String deletedAt, @JsonKey(name: "media_slug")  String mediaSlug, @JsonKey(name: "current_time")  int currentTime, @JsonKey(name: "season_number")  int seasonNumber, @JsonKey(name: "episode_index")  int episodeIndex, @JsonKey(name: "total_episodes")  int totalEpisodes, @JsonKey(name: "episode_number")  int episodeNumber, @JsonKey(name: "available_episodes")  int availableEpisodes, @JsonKey(name: "media_type")  MediaType mediaType)  $default,) {final _that = this;
switch (_that) {
case _HistoryItem():
return $default(_that.key,_that.age,_that.thumbnail,_that.updatedAt,_that.createdAt,_that.duration,_that.revision,_that.deleted,_that.completed,_that.id,_that.userId,_that.eventAt,_that.eventId,_that.purgeAt,_that.titleRu,_that.titleUz,_that.episodeId,_that.deletedAt,_that.mediaSlug,_that.currentTime,_that.seasonNumber,_that.episodeIndex,_that.totalEpisodes,_that.episodeNumber,_that.availableEpisodes,_that.mediaType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String age,  String thumbnail,  String updatedAt,  String createdAt,  int duration,  int revision,  bool deleted,  bool completed, @JsonKey(name: "_id")  String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "event_at")  String eventAt, @JsonKey(name: "event_id")  String eventId, @JsonKey(name: "purge_at")  String purgeAt, @JsonKey(name: "title_ru")  String titleRu, @JsonKey(name: "title_uz")  String titleUz, @JsonKey(name: "episode_id")  String episodeId, @JsonKey(name: "deleted_at")  String deletedAt, @JsonKey(name: "media_slug")  String mediaSlug, @JsonKey(name: "current_time")  int currentTime, @JsonKey(name: "season_number")  int seasonNumber, @JsonKey(name: "episode_index")  int episodeIndex, @JsonKey(name: "total_episodes")  int totalEpisodes, @JsonKey(name: "episode_number")  int episodeNumber, @JsonKey(name: "available_episodes")  int availableEpisodes, @JsonKey(name: "media_type")  MediaType mediaType)?  $default,) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.key,_that.age,_that.thumbnail,_that.updatedAt,_that.createdAt,_that.duration,_that.revision,_that.deleted,_that.completed,_that.id,_that.userId,_that.eventAt,_that.eventId,_that.purgeAt,_that.titleRu,_that.titleUz,_that.episodeId,_that.deletedAt,_that.mediaSlug,_that.currentTime,_that.seasonNumber,_that.episodeIndex,_that.totalEpisodes,_that.episodeNumber,_that.availableEpisodes,_that.mediaType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryItem implements HistoryItem {
  const _HistoryItem({this.key = "", this.age = "", this.thumbnail = "", this.updatedAt = "", this.createdAt = "", this.duration = 0, this.revision = 0, this.deleted = false, this.completed = false, @JsonKey(name: "_id") this.id = "", @JsonKey(name: "user_id") this.userId = "", @JsonKey(name: "event_at") this.eventAt = "", @JsonKey(name: "event_id") this.eventId = "", @JsonKey(name: "purge_at") this.purgeAt = "", @JsonKey(name: "title_ru") this.titleRu = "", @JsonKey(name: "title_uz") this.titleUz = "", @JsonKey(name: "episode_id") this.episodeId = "", @JsonKey(name: "deleted_at") this.deletedAt = "", @JsonKey(name: "media_slug") this.mediaSlug = "", @JsonKey(name: "current_time") this.currentTime = 0, @JsonKey(name: "season_number") this.seasonNumber = 0, @JsonKey(name: "episode_index") this.episodeIndex = 0, @JsonKey(name: "total_episodes") this.totalEpisodes = 0, @JsonKey(name: "episode_number") this.episodeNumber = 0, @JsonKey(name: "available_episodes") this.availableEpisodes = 0, @JsonKey(name: "media_type") this.mediaType = MediaType.serie});
  factory _HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);

@override@JsonKey() final  String key;
@override@JsonKey() final  String age;
@override@JsonKey() final  String thumbnail;
@override@JsonKey() final  String updatedAt;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  int duration;
@override@JsonKey() final  int revision;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool completed;
@override@JsonKey(name: "_id") final  String id;
@override@JsonKey(name: "user_id") final  String userId;
@override@JsonKey(name: "event_at") final  String eventAt;
@override@JsonKey(name: "event_id") final  String eventId;
@override@JsonKey(name: "purge_at") final  String purgeAt;
@override@JsonKey(name: "title_ru") final  String titleRu;
@override@JsonKey(name: "title_uz") final  String titleUz;
@override@JsonKey(name: "episode_id") final  String episodeId;
@override@JsonKey(name: "deleted_at") final  String deletedAt;
@override@JsonKey(name: "media_slug") final  String mediaSlug;
@override@JsonKey(name: "current_time") final  int currentTime;
@override@JsonKey(name: "season_number") final  int seasonNumber;
@override@JsonKey(name: "episode_index") final  int episodeIndex;
@override@JsonKey(name: "total_episodes") final  int totalEpisodes;
@override@JsonKey(name: "episode_number") final  int episodeNumber;
@override@JsonKey(name: "available_episodes") final  int availableEpisodes;
@override@JsonKey(name: "media_type") final  MediaType mediaType;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryItemCopyWith<_HistoryItem> get copyWith => __$HistoryItemCopyWithImpl<_HistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryItem&&(identical(other.key, key) || other.key == key)&&(identical(other.age, age) || other.age == age)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.eventAt, eventAt) || other.eventAt == eventAt)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.purgeAt, purgeAt) || other.purgeAt == purgeAt)&&(identical(other.titleRu, titleRu) || other.titleRu == titleRu)&&(identical(other.titleUz, titleUz) || other.titleUz == titleUz)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.mediaSlug, mediaSlug) || other.mediaSlug == mediaSlug)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.episodeIndex, episodeIndex) || other.episodeIndex == episodeIndex)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.availableEpisodes, availableEpisodes) || other.availableEpisodes == availableEpisodes)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,key,age,thumbnail,updatedAt,createdAt,duration,revision,deleted,completed,id,userId,eventAt,eventId,purgeAt,titleRu,titleUz,episodeId,deletedAt,mediaSlug,currentTime,seasonNumber,episodeIndex,totalEpisodes,episodeNumber,availableEpisodes,mediaType]);

@override
String toString() {
  return 'HistoryItem(key: $key, age: $age, thumbnail: $thumbnail, updatedAt: $updatedAt, createdAt: $createdAt, duration: $duration, revision: $revision, deleted: $deleted, completed: $completed, id: $id, userId: $userId, eventAt: $eventAt, eventId: $eventId, purgeAt: $purgeAt, titleRu: $titleRu, titleUz: $titleUz, episodeId: $episodeId, deletedAt: $deletedAt, mediaSlug: $mediaSlug, currentTime: $currentTime, seasonNumber: $seasonNumber, episodeIndex: $episodeIndex, totalEpisodes: $totalEpisodes, episodeNumber: $episodeNumber, availableEpisodes: $availableEpisodes, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class _$HistoryItemCopyWith<$Res> implements $HistoryItemCopyWith<$Res> {
  factory _$HistoryItemCopyWith(_HistoryItem value, $Res Function(_HistoryItem) _then) = __$HistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String key, String age, String thumbnail, String updatedAt, String createdAt, int duration, int revision, bool deleted, bool completed,@JsonKey(name: "_id") String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "event_at") String eventAt,@JsonKey(name: "event_id") String eventId,@JsonKey(name: "purge_at") String purgeAt,@JsonKey(name: "title_ru") String titleRu,@JsonKey(name: "title_uz") String titleUz,@JsonKey(name: "episode_id") String episodeId,@JsonKey(name: "deleted_at") String deletedAt,@JsonKey(name: "media_slug") String mediaSlug,@JsonKey(name: "current_time") int currentTime,@JsonKey(name: "season_number") int seasonNumber,@JsonKey(name: "episode_index") int episodeIndex,@JsonKey(name: "total_episodes") int totalEpisodes,@JsonKey(name: "episode_number") int episodeNumber,@JsonKey(name: "available_episodes") int availableEpisodes,@JsonKey(name: "media_type") MediaType mediaType
});




}
/// @nodoc
class __$HistoryItemCopyWithImpl<$Res>
    implements _$HistoryItemCopyWith<$Res> {
  __$HistoryItemCopyWithImpl(this._self, this._then);

  final _HistoryItem _self;
  final $Res Function(_HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? age = null,Object? thumbnail = null,Object? updatedAt = null,Object? createdAt = null,Object? duration = null,Object? revision = null,Object? deleted = null,Object? completed = null,Object? id = null,Object? userId = null,Object? eventAt = null,Object? eventId = null,Object? purgeAt = null,Object? titleRu = null,Object? titleUz = null,Object? episodeId = null,Object? deletedAt = null,Object? mediaSlug = null,Object? currentTime = null,Object? seasonNumber = null,Object? episodeIndex = null,Object? totalEpisodes = null,Object? episodeNumber = null,Object? availableEpisodes = null,Object? mediaType = null,}) {
  return _then(_HistoryItem(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventAt: null == eventAt ? _self.eventAt : eventAt // ignore: cast_nullable_to_non_nullable
as String,eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,purgeAt: null == purgeAt ? _self.purgeAt : purgeAt // ignore: cast_nullable_to_non_nullable
as String,titleRu: null == titleRu ? _self.titleRu : titleRu // ignore: cast_nullable_to_non_nullable
as String,titleUz: null == titleUz ? _self.titleUz : titleUz // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,deletedAt: null == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String,mediaSlug: null == mediaSlug ? _self.mediaSlug : mediaSlug // ignore: cast_nullable_to_non_nullable
as String,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as int,seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,episodeIndex: null == episodeIndex ? _self.episodeIndex : episodeIndex // ignore: cast_nullable_to_non_nullable
as int,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,availableEpisodes: null == availableEpisodes ? _self.availableEpisodes : availableEpisodes // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}


}

// dart format on
