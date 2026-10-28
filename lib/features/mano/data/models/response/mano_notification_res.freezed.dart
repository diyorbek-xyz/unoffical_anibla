// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_notification_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoNotificationRes {

 List<ManoNotification> get notifications;@JsonKey(name: "total_count") String get totalCount;
/// Create a copy of ManoNotificationRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoNotificationResCopyWith<ManoNotificationRes> get copyWith => _$ManoNotificationResCopyWithImpl<ManoNotificationRes>(this as ManoNotificationRes, _$identity);

  /// Serializes this ManoNotificationRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoNotificationRes&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications),totalCount);

@override
String toString() {
  return 'ManoNotificationRes(notifications: $notifications, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $ManoNotificationResCopyWith<$Res>  {
  factory $ManoNotificationResCopyWith(ManoNotificationRes value, $Res Function(ManoNotificationRes) _then) = _$ManoNotificationResCopyWithImpl;
@useResult
$Res call({
 List<ManoNotification> notifications,@JsonKey(name: "total_count") String totalCount
});




}
/// @nodoc
class _$ManoNotificationResCopyWithImpl<$Res>
    implements $ManoNotificationResCopyWith<$Res> {
  _$ManoNotificationResCopyWithImpl(this._self, this._then);

  final ManoNotificationRes _self;
  final $Res Function(ManoNotificationRes) _then;

/// Create a copy of ManoNotificationRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<ManoNotification>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoNotificationRes].
extension ManoNotificationResPatterns on ManoNotificationRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoNotificationRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoNotificationRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoNotificationRes value)  $default,){
final _that = this;
switch (_that) {
case _ManoNotificationRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoNotificationRes value)?  $default,){
final _that = this;
switch (_that) {
case _ManoNotificationRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ManoNotification> notifications, @JsonKey(name: "total_count")  String totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoNotificationRes() when $default != null:
return $default(_that.notifications,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ManoNotification> notifications, @JsonKey(name: "total_count")  String totalCount)  $default,) {final _that = this;
switch (_that) {
case _ManoNotificationRes():
return $default(_that.notifications,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ManoNotification> notifications, @JsonKey(name: "total_count")  String totalCount)?  $default,) {final _that = this;
switch (_that) {
case _ManoNotificationRes() when $default != null:
return $default(_that.notifications,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoNotificationRes implements ManoNotificationRes {
  const _ManoNotificationRes({final  List<ManoNotification> notifications = const [], @JsonKey(name: "total_count") this.totalCount = "0"}): _notifications = notifications;
  factory _ManoNotificationRes.fromJson(Map<String, dynamic> json) => _$ManoNotificationResFromJson(json);

 final  List<ManoNotification> _notifications;
@override@JsonKey() List<ManoNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override@JsonKey(name: "total_count") final  String totalCount;

/// Create a copy of ManoNotificationRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoNotificationResCopyWith<_ManoNotificationRes> get copyWith => __$ManoNotificationResCopyWithImpl<_ManoNotificationRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoNotificationResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoNotificationRes&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),totalCount);

@override
String toString() {
  return 'ManoNotificationRes(notifications: $notifications, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$ManoNotificationResCopyWith<$Res> implements $ManoNotificationResCopyWith<$Res> {
  factory _$ManoNotificationResCopyWith(_ManoNotificationRes value, $Res Function(_ManoNotificationRes) _then) = __$ManoNotificationResCopyWithImpl;
@override @useResult
$Res call({
 List<ManoNotification> notifications,@JsonKey(name: "total_count") String totalCount
});




}
/// @nodoc
class __$ManoNotificationResCopyWithImpl<$Res>
    implements _$ManoNotificationResCopyWith<$Res> {
  __$ManoNotificationResCopyWithImpl(this._self, this._then);

  final _ManoNotificationRes _self;
  final $Res Function(_ManoNotificationRes) _then;

/// Create a copy of ManoNotificationRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? totalCount = null,}) {
  return _then(_ManoNotificationRes(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<ManoNotification>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
