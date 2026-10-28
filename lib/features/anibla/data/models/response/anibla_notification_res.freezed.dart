// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anibla_notification_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AniblaNotificationRes {

@HiveField(0) List<AniblaNotification> get data;@HiveField(1) int get unreadCount;@HiveField(2) Pagination get pagination;
/// Create a copy of AniblaNotificationRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AniblaNotificationResCopyWith<AniblaNotificationRes> get copyWith => _$AniblaNotificationResCopyWithImpl<AniblaNotificationRes>(this as AniblaNotificationRes, _$identity);

  /// Serializes this AniblaNotificationRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AniblaNotificationRes&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),unreadCount,pagination);

@override
String toString() {
  return 'AniblaNotificationRes(data: $data, unreadCount: $unreadCount, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $AniblaNotificationResCopyWith<$Res>  {
  factory $AniblaNotificationResCopyWith(AniblaNotificationRes value, $Res Function(AniblaNotificationRes) _then) = _$AniblaNotificationResCopyWithImpl;
@useResult
$Res call({
@HiveField(0) List<AniblaNotification> data,@HiveField(1) int unreadCount,@HiveField(2) Pagination pagination
});


$PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$AniblaNotificationResCopyWithImpl<$Res>
    implements $AniblaNotificationResCopyWith<$Res> {
  _$AniblaNotificationResCopyWithImpl(this._self, this._then);

  final AniblaNotificationRes _self;
  final $Res Function(AniblaNotificationRes) _then;

/// Create a copy of AniblaNotificationRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? unreadCount = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AniblaNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}
/// Create a copy of AniblaNotificationRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [AniblaNotificationRes].
extension AniblaNotificationResPatterns on AniblaNotificationRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AniblaNotificationRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AniblaNotificationRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AniblaNotificationRes value)  $default,){
final _that = this;
switch (_that) {
case _AniblaNotificationRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AniblaNotificationRes value)?  $default,){
final _that = this;
switch (_that) {
case _AniblaNotificationRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  List<AniblaNotification> data, @HiveField(1)  int unreadCount, @HiveField(2)  Pagination pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AniblaNotificationRes() when $default != null:
return $default(_that.data,_that.unreadCount,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  List<AniblaNotification> data, @HiveField(1)  int unreadCount, @HiveField(2)  Pagination pagination)  $default,) {final _that = this;
switch (_that) {
case _AniblaNotificationRes():
return $default(_that.data,_that.unreadCount,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  List<AniblaNotification> data, @HiveField(1)  int unreadCount, @HiveField(2)  Pagination pagination)?  $default,) {final _that = this;
switch (_that) {
case _AniblaNotificationRes() when $default != null:
return $default(_that.data,_that.unreadCount,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AniblaNotificationRes implements AniblaNotificationRes {
  const _AniblaNotificationRes({@HiveField(0) final  List<AniblaNotification> data = const [], @HiveField(1) this.unreadCount = 0, @HiveField(2) this.pagination = const Pagination()}): _data = data;
  factory _AniblaNotificationRes.fromJson(Map<String, dynamic> json) => _$AniblaNotificationResFromJson(json);

 final  List<AniblaNotification> _data;
@override@JsonKey()@HiveField(0) List<AniblaNotification> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey()@HiveField(1) final  int unreadCount;
@override@JsonKey()@HiveField(2) final  Pagination pagination;

/// Create a copy of AniblaNotificationRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AniblaNotificationResCopyWith<_AniblaNotificationRes> get copyWith => __$AniblaNotificationResCopyWithImpl<_AniblaNotificationRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AniblaNotificationResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AniblaNotificationRes&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),unreadCount,pagination);

@override
String toString() {
  return 'AniblaNotificationRes(data: $data, unreadCount: $unreadCount, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$AniblaNotificationResCopyWith<$Res> implements $AniblaNotificationResCopyWith<$Res> {
  factory _$AniblaNotificationResCopyWith(_AniblaNotificationRes value, $Res Function(_AniblaNotificationRes) _then) = __$AniblaNotificationResCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) List<AniblaNotification> data,@HiveField(1) int unreadCount,@HiveField(2) Pagination pagination
});


@override $PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$AniblaNotificationResCopyWithImpl<$Res>
    implements _$AniblaNotificationResCopyWith<$Res> {
  __$AniblaNotificationResCopyWithImpl(this._self, this._then);

  final _AniblaNotificationRes _self;
  final $Res Function(_AniblaNotificationRes) _then;

/// Create a copy of AniblaNotificationRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? unreadCount = null,Object? pagination = null,}) {
  return _then(_AniblaNotificationRes(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AniblaNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}

/// Create a copy of AniblaNotificationRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
