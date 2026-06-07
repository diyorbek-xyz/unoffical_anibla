// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationModel {

@HiveField(0)@JsonKey(name: "_id") String? get id;@HiveField(1) String? get userId;@HiveField(2) String? get title;@HiveField(3) String? get body;@HiveField(4) String? get type;@HiveField(5) bool? get read;@HiveField(6) DateTime? get createdAt;@HiveField(7) DateTime? get updatedAt;@HiveField(8) EpisodeNotificationModel? get data;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.type, type) || other.type == type)&&(identical(other.read, read) || other.read == read)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,body,type,read,createdAt,updatedAt,data);

@override
String toString() {
  return 'NotificationModel(id: $id, userId: $userId, title: $title, body: $body, type: $type, read: $read, createdAt: $createdAt, updatedAt: $updatedAt, data: $data)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1) String? userId,@HiveField(2) String? title,@HiveField(3) String? body,@HiveField(4) String? type,@HiveField(5) bool? read,@HiveField(6) DateTime? createdAt,@HiveField(7) DateTime? updatedAt,@HiveField(8) EpisodeNotificationModel? data
});


$EpisodeNotificationModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? title = freezed,Object? body = freezed,Object? type = freezed,Object? read = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,read: freezed == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as EpisodeNotificationModel?,
  ));
}
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeNotificationModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $EpisodeNotificationModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationModel].
extension NotificationModelPatterns on NotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  String? userId, @HiveField(2)  String? title, @HiveField(3)  String? body, @HiveField(4)  String? type, @HiveField(5)  bool? read, @HiveField(6)  DateTime? createdAt, @HiveField(7)  DateTime? updatedAt, @HiveField(8)  EpisodeNotificationModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.body,_that.type,_that.read,_that.createdAt,_that.updatedAt,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  String? userId, @HiveField(2)  String? title, @HiveField(3)  String? body, @HiveField(4)  String? type, @HiveField(5)  bool? read, @HiveField(6)  DateTime? createdAt, @HiveField(7)  DateTime? updatedAt, @HiveField(8)  EpisodeNotificationModel? data)  $default,) {final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that.id,_that.userId,_that.title,_that.body,_that.type,_that.read,_that.createdAt,_that.updatedAt,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)  String? userId, @HiveField(2)  String? title, @HiveField(3)  String? body, @HiveField(4)  String? type, @HiveField(5)  bool? read, @HiveField(6)  DateTime? createdAt, @HiveField(7)  DateTime? updatedAt, @HiveField(8)  EpisodeNotificationModel? data)?  $default,) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.body,_that.type,_that.read,_that.createdAt,_that.updatedAt,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationModel implements NotificationModel {
   _NotificationModel({@HiveField(0)@JsonKey(name: "_id") this.id, @HiveField(1) this.userId, @HiveField(2) this.title, @HiveField(3) this.body, @HiveField(4) this.type, @HiveField(5) this.read, @HiveField(6) this.createdAt, @HiveField(7) this.updatedAt, @HiveField(8) this.data});
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String? id;
@override@HiveField(1) final  String? userId;
@override@HiveField(2) final  String? title;
@override@HiveField(3) final  String? body;
@override@HiveField(4) final  String? type;
@override@HiveField(5) final  bool? read;
@override@HiveField(6) final  DateTime? createdAt;
@override@HiveField(7) final  DateTime? updatedAt;
@override@HiveField(8) final  EpisodeNotificationModel? data;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.type, type) || other.type == type)&&(identical(other.read, read) || other.read == read)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,body,type,read,createdAt,updatedAt,data);

@override
String toString() {
  return 'NotificationModel(id: $id, userId: $userId, title: $title, body: $body, type: $type, read: $read, createdAt: $createdAt, updatedAt: $updatedAt, data: $data)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1) String? userId,@HiveField(2) String? title,@HiveField(3) String? body,@HiveField(4) String? type,@HiveField(5) bool? read,@HiveField(6) DateTime? createdAt,@HiveField(7) DateTime? updatedAt,@HiveField(8) EpisodeNotificationModel? data
});


@override $EpisodeNotificationModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? title = freezed,Object? body = freezed,Object? type = freezed,Object? read = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? data = freezed,}) {
  return _then(_NotificationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,read: freezed == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as EpisodeNotificationModel?,
  ));
}

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpisodeNotificationModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $EpisodeNotificationModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
