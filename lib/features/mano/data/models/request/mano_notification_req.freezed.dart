// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_notification_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoNotificationReq {

 int get page; int get limit; NotificationStatus? get status;
/// Create a copy of ManoNotificationReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoNotificationReqCopyWith<ManoNotificationReq> get copyWith => _$ManoNotificationReqCopyWithImpl<ManoNotificationReq>(this as ManoNotificationReq, _$identity);

  /// Serializes this ManoNotificationReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoNotificationReq&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,status);

@override
String toString() {
  return 'ManoNotificationReq(page: $page, limit: $limit, status: $status)';
}


}

/// @nodoc
abstract mixin class $ManoNotificationReqCopyWith<$Res>  {
  factory $ManoNotificationReqCopyWith(ManoNotificationReq value, $Res Function(ManoNotificationReq) _then) = _$ManoNotificationReqCopyWithImpl;
@useResult
$Res call({
 int page, int limit, NotificationStatus? status
});




}
/// @nodoc
class _$ManoNotificationReqCopyWithImpl<$Res>
    implements $ManoNotificationReqCopyWith<$Res> {
  _$ManoNotificationReqCopyWithImpl(this._self, this._then);

  final ManoNotificationReq _self;
  final $Res Function(ManoNotificationReq) _then;

/// Create a copy of ManoNotificationReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? status = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoNotificationReq].
extension ManoNotificationReqPatterns on ManoNotificationReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoNotificationReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoNotificationReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoNotificationReq value)  $default,){
final _that = this;
switch (_that) {
case _ManoNotificationReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoNotificationReq value)?  $default,){
final _that = this;
switch (_that) {
case _ManoNotificationReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  NotificationStatus? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoNotificationReq() when $default != null:
return $default(_that.page,_that.limit,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  NotificationStatus? status)  $default,) {final _that = this;
switch (_that) {
case _ManoNotificationReq():
return $default(_that.page,_that.limit,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  NotificationStatus? status)?  $default,) {final _that = this;
switch (_that) {
case _ManoNotificationReq() when $default != null:
return $default(_that.page,_that.limit,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoNotificationReq implements ManoNotificationReq {
  const _ManoNotificationReq({this.page = 1, this.limit = 10, this.status});
  factory _ManoNotificationReq.fromJson(Map<String, dynamic> json) => _$ManoNotificationReqFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override final  NotificationStatus? status;

/// Create a copy of ManoNotificationReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoNotificationReqCopyWith<_ManoNotificationReq> get copyWith => __$ManoNotificationReqCopyWithImpl<_ManoNotificationReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoNotificationReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoNotificationReq&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,status);

@override
String toString() {
  return 'ManoNotificationReq(page: $page, limit: $limit, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ManoNotificationReqCopyWith<$Res> implements $ManoNotificationReqCopyWith<$Res> {
  factory _$ManoNotificationReqCopyWith(_ManoNotificationReq value, $Res Function(_ManoNotificationReq) _then) = __$ManoNotificationReqCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, NotificationStatus? status
});




}
/// @nodoc
class __$ManoNotificationReqCopyWithImpl<$Res>
    implements _$ManoNotificationReqCopyWith<$Res> {
  __$ManoNotificationReqCopyWithImpl(this._self, this._then);

  final _ManoNotificationReq _self;
  final $Res Function(_ManoNotificationReq) _then;

/// Create a copy of ManoNotificationReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? status = freezed,}) {
  return _then(_ManoNotificationReq(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus?,
  ));
}


}

// dart format on
