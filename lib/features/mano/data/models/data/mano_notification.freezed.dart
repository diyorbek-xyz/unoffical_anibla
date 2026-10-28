// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoNotification {

@JsonKey(name: "id") String get id;@JsonKey(name: "title") String get title;@JsonKey(name: "content") String get content;@JsonKey(name: "manga_id") String get mangaId;@JsonKey(name: "photo_url") String get photoUrl;@JsonKey(name: "read_date") String get readDate;@JsonKey(name: "button_url") String get buttonUrl;@JsonKey(name: "chapter_id") String get chapterId;@JsonKey(name: "related_id") String get relatedId;@JsonKey(name: "button_text") String get buttonText;@JsonKey(name: "created_at") String get createdDate;@JsonKey(name: "is_bookmarked") bool get isBookmarked;@JsonKey(name: "webapp_button_url") String get webappButtonUrl;@JsonKey(name: "webapp_button_text") String get webappButtonText;@JsonKey(name: "type") NotificationType get type;@JsonKey(name: "status") NotificationStatus get status;@JsonKey(name: "platform") NotificationPlatform get platform;
/// Create a copy of ManoNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoNotificationCopyWith<ManoNotification> get copyWith => _$ManoNotificationCopyWithImpl<ManoNotification>(this as ManoNotification, _$identity);

  /// Serializes this ManoNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.mangaId, mangaId) || other.mangaId == mangaId)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.readDate, readDate) || other.readDate == readDate)&&(identical(other.buttonUrl, buttonUrl) || other.buttonUrl == buttonUrl)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.relatedId, relatedId) || other.relatedId == relatedId)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.webappButtonUrl, webappButtonUrl) || other.webappButtonUrl == webappButtonUrl)&&(identical(other.webappButtonText, webappButtonText) || other.webappButtonText == webappButtonText)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,mangaId,photoUrl,readDate,buttonUrl,chapterId,relatedId,buttonText,createdDate,isBookmarked,webappButtonUrl,webappButtonText,type,status,platform);

@override
String toString() {
  return 'ManoNotification(id: $id, title: $title, content: $content, mangaId: $mangaId, photoUrl: $photoUrl, readDate: $readDate, buttonUrl: $buttonUrl, chapterId: $chapterId, relatedId: $relatedId, buttonText: $buttonText, createdDate: $createdDate, isBookmarked: $isBookmarked, webappButtonUrl: $webappButtonUrl, webappButtonText: $webappButtonText, type: $type, status: $status, platform: $platform)';
}


}

/// @nodoc
abstract mixin class $ManoNotificationCopyWith<$Res>  {
  factory $ManoNotificationCopyWith(ManoNotification value, $Res Function(ManoNotification) _then) = _$ManoNotificationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "title") String title,@JsonKey(name: "content") String content,@JsonKey(name: "manga_id") String mangaId,@JsonKey(name: "photo_url") String photoUrl,@JsonKey(name: "read_date") String readDate,@JsonKey(name: "button_url") String buttonUrl,@JsonKey(name: "chapter_id") String chapterId,@JsonKey(name: "related_id") String relatedId,@JsonKey(name: "button_text") String buttonText,@JsonKey(name: "created_at") String createdDate,@JsonKey(name: "is_bookmarked") bool isBookmarked,@JsonKey(name: "webapp_button_url") String webappButtonUrl,@JsonKey(name: "webapp_button_text") String webappButtonText,@JsonKey(name: "type") NotificationType type,@JsonKey(name: "status") NotificationStatus status,@JsonKey(name: "platform") NotificationPlatform platform
});




}
/// @nodoc
class _$ManoNotificationCopyWithImpl<$Res>
    implements $ManoNotificationCopyWith<$Res> {
  _$ManoNotificationCopyWithImpl(this._self, this._then);

  final ManoNotification _self;
  final $Res Function(ManoNotification) _then;

/// Create a copy of ManoNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? mangaId = null,Object? photoUrl = null,Object? readDate = null,Object? buttonUrl = null,Object? chapterId = null,Object? relatedId = null,Object? buttonText = null,Object? createdDate = null,Object? isBookmarked = null,Object? webappButtonUrl = null,Object? webappButtonText = null,Object? type = null,Object? status = null,Object? platform = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,mangaId: null == mangaId ? _self.mangaId : mangaId // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,readDate: null == readDate ? _self.readDate : readDate // ignore: cast_nullable_to_non_nullable
as String,buttonUrl: null == buttonUrl ? _self.buttonUrl : buttonUrl // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,relatedId: null == relatedId ? _self.relatedId : relatedId // ignore: cast_nullable_to_non_nullable
as String,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,webappButtonUrl: null == webappButtonUrl ? _self.webappButtonUrl : webappButtonUrl // ignore: cast_nullable_to_non_nullable
as String,webappButtonText: null == webappButtonText ? _self.webappButtonText : webappButtonText // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as NotificationPlatform,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoNotification].
extension ManoNotificationPatterns on ManoNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoNotification value)  $default,){
final _that = this;
switch (_that) {
case _ManoNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoNotification value)?  $default,){
final _that = this;
switch (_that) {
case _ManoNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "title")  String title, @JsonKey(name: "content")  String content, @JsonKey(name: "manga_id")  String mangaId, @JsonKey(name: "photo_url")  String photoUrl, @JsonKey(name: "read_date")  String readDate, @JsonKey(name: "button_url")  String buttonUrl, @JsonKey(name: "chapter_id")  String chapterId, @JsonKey(name: "related_id")  String relatedId, @JsonKey(name: "button_text")  String buttonText, @JsonKey(name: "created_at")  String createdDate, @JsonKey(name: "is_bookmarked")  bool isBookmarked, @JsonKey(name: "webapp_button_url")  String webappButtonUrl, @JsonKey(name: "webapp_button_text")  String webappButtonText, @JsonKey(name: "type")  NotificationType type, @JsonKey(name: "status")  NotificationStatus status, @JsonKey(name: "platform")  NotificationPlatform platform)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoNotification() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.mangaId,_that.photoUrl,_that.readDate,_that.buttonUrl,_that.chapterId,_that.relatedId,_that.buttonText,_that.createdDate,_that.isBookmarked,_that.webappButtonUrl,_that.webappButtonText,_that.type,_that.status,_that.platform);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "title")  String title, @JsonKey(name: "content")  String content, @JsonKey(name: "manga_id")  String mangaId, @JsonKey(name: "photo_url")  String photoUrl, @JsonKey(name: "read_date")  String readDate, @JsonKey(name: "button_url")  String buttonUrl, @JsonKey(name: "chapter_id")  String chapterId, @JsonKey(name: "related_id")  String relatedId, @JsonKey(name: "button_text")  String buttonText, @JsonKey(name: "created_at")  String createdDate, @JsonKey(name: "is_bookmarked")  bool isBookmarked, @JsonKey(name: "webapp_button_url")  String webappButtonUrl, @JsonKey(name: "webapp_button_text")  String webappButtonText, @JsonKey(name: "type")  NotificationType type, @JsonKey(name: "status")  NotificationStatus status, @JsonKey(name: "platform")  NotificationPlatform platform)  $default,) {final _that = this;
switch (_that) {
case _ManoNotification():
return $default(_that.id,_that.title,_that.content,_that.mangaId,_that.photoUrl,_that.readDate,_that.buttonUrl,_that.chapterId,_that.relatedId,_that.buttonText,_that.createdDate,_that.isBookmarked,_that.webappButtonUrl,_that.webappButtonText,_that.type,_that.status,_that.platform);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "title")  String title, @JsonKey(name: "content")  String content, @JsonKey(name: "manga_id")  String mangaId, @JsonKey(name: "photo_url")  String photoUrl, @JsonKey(name: "read_date")  String readDate, @JsonKey(name: "button_url")  String buttonUrl, @JsonKey(name: "chapter_id")  String chapterId, @JsonKey(name: "related_id")  String relatedId, @JsonKey(name: "button_text")  String buttonText, @JsonKey(name: "created_at")  String createdDate, @JsonKey(name: "is_bookmarked")  bool isBookmarked, @JsonKey(name: "webapp_button_url")  String webappButtonUrl, @JsonKey(name: "webapp_button_text")  String webappButtonText, @JsonKey(name: "type")  NotificationType type, @JsonKey(name: "status")  NotificationStatus status, @JsonKey(name: "platform")  NotificationPlatform platform)?  $default,) {final _that = this;
switch (_that) {
case _ManoNotification() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.mangaId,_that.photoUrl,_that.readDate,_that.buttonUrl,_that.chapterId,_that.relatedId,_that.buttonText,_that.createdDate,_that.isBookmarked,_that.webappButtonUrl,_that.webappButtonText,_that.type,_that.status,_that.platform);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoNotification implements ManoNotification {
  const _ManoNotification({@JsonKey(name: "id") this.id = "", @JsonKey(name: "title") this.title = "", @JsonKey(name: "content") this.content = "", @JsonKey(name: "manga_id") this.mangaId = "", @JsonKey(name: "photo_url") this.photoUrl = "", @JsonKey(name: "read_date") this.readDate = "", @JsonKey(name: "button_url") this.buttonUrl = "", @JsonKey(name: "chapter_id") this.chapterId = "", @JsonKey(name: "related_id") this.relatedId = "", @JsonKey(name: "button_text") this.buttonText = "", @JsonKey(name: "created_at") this.createdDate = "", @JsonKey(name: "is_bookmarked") this.isBookmarked = false, @JsonKey(name: "webapp_button_url") this.webappButtonUrl = "", @JsonKey(name: "webapp_button_text") this.webappButtonText = "", @JsonKey(name: "type") this.type = NotificationType.newChapter, @JsonKey(name: "status") this.status = NotificationStatus.read, @JsonKey(name: "platform") this.platform = NotificationPlatform.telegram});
  factory _ManoNotification.fromJson(Map<String, dynamic> json) => _$ManoNotificationFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "title") final  String title;
@override@JsonKey(name: "content") final  String content;
@override@JsonKey(name: "manga_id") final  String mangaId;
@override@JsonKey(name: "photo_url") final  String photoUrl;
@override@JsonKey(name: "read_date") final  String readDate;
@override@JsonKey(name: "button_url") final  String buttonUrl;
@override@JsonKey(name: "chapter_id") final  String chapterId;
@override@JsonKey(name: "related_id") final  String relatedId;
@override@JsonKey(name: "button_text") final  String buttonText;
@override@JsonKey(name: "created_at") final  String createdDate;
@override@JsonKey(name: "is_bookmarked") final  bool isBookmarked;
@override@JsonKey(name: "webapp_button_url") final  String webappButtonUrl;
@override@JsonKey(name: "webapp_button_text") final  String webappButtonText;
@override@JsonKey(name: "type") final  NotificationType type;
@override@JsonKey(name: "status") final  NotificationStatus status;
@override@JsonKey(name: "platform") final  NotificationPlatform platform;

/// Create a copy of ManoNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoNotificationCopyWith<_ManoNotification> get copyWith => __$ManoNotificationCopyWithImpl<_ManoNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.mangaId, mangaId) || other.mangaId == mangaId)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.readDate, readDate) || other.readDate == readDate)&&(identical(other.buttonUrl, buttonUrl) || other.buttonUrl == buttonUrl)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.relatedId, relatedId) || other.relatedId == relatedId)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.webappButtonUrl, webappButtonUrl) || other.webappButtonUrl == webappButtonUrl)&&(identical(other.webappButtonText, webappButtonText) || other.webappButtonText == webappButtonText)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,mangaId,photoUrl,readDate,buttonUrl,chapterId,relatedId,buttonText,createdDate,isBookmarked,webappButtonUrl,webappButtonText,type,status,platform);

@override
String toString() {
  return 'ManoNotification(id: $id, title: $title, content: $content, mangaId: $mangaId, photoUrl: $photoUrl, readDate: $readDate, buttonUrl: $buttonUrl, chapterId: $chapterId, relatedId: $relatedId, buttonText: $buttonText, createdDate: $createdDate, isBookmarked: $isBookmarked, webappButtonUrl: $webappButtonUrl, webappButtonText: $webappButtonText, type: $type, status: $status, platform: $platform)';
}


}

/// @nodoc
abstract mixin class _$ManoNotificationCopyWith<$Res> implements $ManoNotificationCopyWith<$Res> {
  factory _$ManoNotificationCopyWith(_ManoNotification value, $Res Function(_ManoNotification) _then) = __$ManoNotificationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "title") String title,@JsonKey(name: "content") String content,@JsonKey(name: "manga_id") String mangaId,@JsonKey(name: "photo_url") String photoUrl,@JsonKey(name: "read_date") String readDate,@JsonKey(name: "button_url") String buttonUrl,@JsonKey(name: "chapter_id") String chapterId,@JsonKey(name: "related_id") String relatedId,@JsonKey(name: "button_text") String buttonText,@JsonKey(name: "created_at") String createdDate,@JsonKey(name: "is_bookmarked") bool isBookmarked,@JsonKey(name: "webapp_button_url") String webappButtonUrl,@JsonKey(name: "webapp_button_text") String webappButtonText,@JsonKey(name: "type") NotificationType type,@JsonKey(name: "status") NotificationStatus status,@JsonKey(name: "platform") NotificationPlatform platform
});




}
/// @nodoc
class __$ManoNotificationCopyWithImpl<$Res>
    implements _$ManoNotificationCopyWith<$Res> {
  __$ManoNotificationCopyWithImpl(this._self, this._then);

  final _ManoNotification _self;
  final $Res Function(_ManoNotification) _then;

/// Create a copy of ManoNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? mangaId = null,Object? photoUrl = null,Object? readDate = null,Object? buttonUrl = null,Object? chapterId = null,Object? relatedId = null,Object? buttonText = null,Object? createdDate = null,Object? isBookmarked = null,Object? webappButtonUrl = null,Object? webappButtonText = null,Object? type = null,Object? status = null,Object? platform = null,}) {
  return _then(_ManoNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,mangaId: null == mangaId ? _self.mangaId : mangaId // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,readDate: null == readDate ? _self.readDate : readDate // ignore: cast_nullable_to_non_nullable
as String,buttonUrl: null == buttonUrl ? _self.buttonUrl : buttonUrl // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,relatedId: null == relatedId ? _self.relatedId : relatedId // ignore: cast_nullable_to_non_nullable
as String,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,webappButtonUrl: null == webappButtonUrl ? _self.webappButtonUrl : webappButtonUrl // ignore: cast_nullable_to_non_nullable
as String,webappButtonText: null == webappButtonText ? _self.webappButtonText : webappButtonText // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as NotificationPlatform,
  ));
}


}

// dart format on
