// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoResponse<T> {

 T get data; int get limit; int get offset; int get total;
/// Create a copy of ManoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoResponseCopyWith<T, ManoResponse<T>> get copyWith => _$ManoResponseCopyWithImpl<T, ManoResponse<T>>(this as ManoResponse<T>, _$identity);

  /// Serializes this ManoResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoResponse<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),limit,offset,total);

@override
String toString() {
  return 'ManoResponse<$T>(data: $data, limit: $limit, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class $ManoResponseCopyWith<T,$Res>  {
  factory $ManoResponseCopyWith(ManoResponse<T> value, $Res Function(ManoResponse<T>) _then) = _$ManoResponseCopyWithImpl;
@useResult
$Res call({
 T data, int limit, int offset, int total
});




}
/// @nodoc
class _$ManoResponseCopyWithImpl<T,$Res>
    implements $ManoResponseCopyWith<T, $Res> {
  _$ManoResponseCopyWithImpl(this._self, this._then);

  final ManoResponse<T> _self;
  final $Res Function(ManoResponse<T>) _then;

/// Create a copy of ManoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? limit = null,Object? offset = null,Object? total = null,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoResponse].
extension ManoResponsePatterns<T> on ManoResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _ManoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ManoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data,  int limit,  int offset,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoResponse() when $default != null:
return $default(_that.data,_that.limit,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data,  int limit,  int offset,  int total)  $default,) {final _that = this;
switch (_that) {
case _ManoResponse():
return $default(_that.data,_that.limit,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data,  int limit,  int offset,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ManoResponse() when $default != null:
return $default(_that.data,_that.limit,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ManoResponse<T> implements ManoResponse<T> {
  const _ManoResponse({required this.data, this.limit = 0, this.offset = 0, this.total = 0});
  factory _ManoResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ManoResponseFromJson(json,fromJsonT);

@override final  T data;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;
@override@JsonKey() final  int total;

/// Create a copy of ManoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoResponseCopyWith<T, _ManoResponse<T>> get copyWith => __$ManoResponseCopyWithImpl<T, _ManoResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ManoResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoResponse<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),limit,offset,total);

@override
String toString() {
  return 'ManoResponse<$T>(data: $data, limit: $limit, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ManoResponseCopyWith<T,$Res> implements $ManoResponseCopyWith<T, $Res> {
  factory _$ManoResponseCopyWith(_ManoResponse<T> value, $Res Function(_ManoResponse<T>) _then) = __$ManoResponseCopyWithImpl;
@override @useResult
$Res call({
 T data, int limit, int offset, int total
});




}
/// @nodoc
class __$ManoResponseCopyWithImpl<T,$Res>
    implements _$ManoResponseCopyWith<T, $Res> {
  __$ManoResponseCopyWithImpl(this._self, this._then);

  final _ManoResponse<T> _self;
  final $Res Function(_ManoResponse<T>) _then;

/// Create a copy of ManoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? limit = null,Object? offset = null,Object? total = null,}) {
  return _then(_ManoResponse<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
