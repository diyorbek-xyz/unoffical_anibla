// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'big_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BigResponse<T> {

@JsonKey(name: "data") List<T> get datas; bool get success; String get message; Pagination get pagination; dynamic get error;
/// Create a copy of BigResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BigResponseCopyWith<T, BigResponse<T>> get copyWith => _$BigResponseCopyWithImpl<T, BigResponse<T>>(this as BigResponse<T>, _$identity);

  /// Serializes this BigResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BigResponse<T>&&const DeepCollectionEquality().equals(other.datas, datas)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(datas),success,message,pagination,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BigResponse<$T>(datas: $datas, success: $success, message: $message, pagination: $pagination, error: $error)';
}


}

/// @nodoc
abstract mixin class $BigResponseCopyWith<T,$Res>  {
  factory $BigResponseCopyWith(BigResponse<T> value, $Res Function(BigResponse<T>) _then) = _$BigResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "data") List<T> datas, bool success, String message, Pagination pagination, dynamic error
});


$PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$BigResponseCopyWithImpl<T,$Res>
    implements $BigResponseCopyWith<T, $Res> {
  _$BigResponseCopyWithImpl(this._self, this._then);

  final BigResponse<T> _self;
  final $Res Function(BigResponse<T>) _then;

/// Create a copy of BigResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? datas = null,Object? success = null,Object? message = null,Object? pagination = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
datas: null == datas ? _self.datas : datas // ignore: cast_nullable_to_non_nullable
as List<T>,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of BigResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [BigResponse].
extension BigResponsePatterns<T> on BigResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BigResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BigResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BigResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _BigResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BigResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BigResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "data")  List<T> datas,  bool success,  String message,  Pagination pagination,  dynamic error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BigResponse() when $default != null:
return $default(_that.datas,_that.success,_that.message,_that.pagination,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "data")  List<T> datas,  bool success,  String message,  Pagination pagination,  dynamic error)  $default,) {final _that = this;
switch (_that) {
case _BigResponse():
return $default(_that.datas,_that.success,_that.message,_that.pagination,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "data")  List<T> datas,  bool success,  String message,  Pagination pagination,  dynamic error)?  $default,) {final _that = this;
switch (_that) {
case _BigResponse() when $default != null:
return $default(_that.datas,_that.success,_that.message,_that.pagination,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BigResponse<T> implements BigResponse<T> {
  const _BigResponse({@JsonKey(name: "data") final  List<T> datas = const [], this.success = false, this.message = "", this.pagination = const Pagination(), this.error = ""}): _datas = datas;
  factory _BigResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BigResponseFromJson(json,fromJsonT);

 final  List<T> _datas;
@override@JsonKey(name: "data") List<T> get datas {
  if (_datas is EqualUnmodifiableListView) return _datas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_datas);
}

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override@JsonKey() final  Pagination pagination;
@override@JsonKey() final  dynamic error;

/// Create a copy of BigResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BigResponseCopyWith<T, _BigResponse<T>> get copyWith => __$BigResponseCopyWithImpl<T, _BigResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BigResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BigResponse<T>&&const DeepCollectionEquality().equals(other._datas, _datas)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_datas),success,message,pagination,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BigResponse<$T>(datas: $datas, success: $success, message: $message, pagination: $pagination, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BigResponseCopyWith<T,$Res> implements $BigResponseCopyWith<T, $Res> {
  factory _$BigResponseCopyWith(_BigResponse<T> value, $Res Function(_BigResponse<T>) _then) = __$BigResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "data") List<T> datas, bool success, String message, Pagination pagination, dynamic error
});


@override $PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$BigResponseCopyWithImpl<T,$Res>
    implements _$BigResponseCopyWith<T, $Res> {
  __$BigResponseCopyWithImpl(this._self, this._then);

  final _BigResponse<T> _self;
  final $Res Function(_BigResponse<T>) _then;

/// Create a copy of BigResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? datas = null,Object? success = null,Object? message = null,Object? pagination = null,Object? error = freezed,}) {
  return _then(_BigResponse<T>(
datas: null == datas ? _self._datas : datas // ignore: cast_nullable_to_non_nullable
as List<T>,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of BigResponse
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
