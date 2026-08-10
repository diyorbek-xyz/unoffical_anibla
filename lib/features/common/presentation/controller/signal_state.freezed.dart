// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignalState<T> {

 bool get isLoading; bool get hasValue; bool get hasError; String? get error; T? get value;
/// Create a copy of SignalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignalStateCopyWith<T, SignalState<T>> get copyWith => _$SignalStateCopyWithImpl<T, SignalState<T>>(this as SignalState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignalState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasValue, hasValue) || other.hasValue == hasValue)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasValue,hasError,error,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'SignalState<$T>(isLoading: $isLoading, hasValue: $hasValue, hasError: $hasError, error: $error, value: $value)';
}


}

/// @nodoc
abstract mixin class $SignalStateCopyWith<T,$Res>  {
  factory $SignalStateCopyWith(SignalState<T> value, $Res Function(SignalState<T>) _then) = _$SignalStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool hasValue, bool hasError, String? error, T? value
});




}
/// @nodoc
class _$SignalStateCopyWithImpl<T,$Res>
    implements $SignalStateCopyWith<T, $Res> {
  _$SignalStateCopyWithImpl(this._self, this._then);

  final SignalState<T> _self;
  final $Res Function(SignalState<T>) _then;

/// Create a copy of SignalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? hasValue = null,Object? hasError = null,Object? error = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasValue: null == hasValue ? _self.hasValue : hasValue // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignalState].
extension SignalStatePatterns<T> on SignalState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignalState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignalState<T> value)  $default,){
final _that = this;
switch (_that) {
case _SignalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignalState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _SignalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool hasValue,  bool hasError,  String? error,  T? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignalState() when $default != null:
return $default(_that.isLoading,_that.hasValue,_that.hasError,_that.error,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool hasValue,  bool hasError,  String? error,  T? value)  $default,) {final _that = this;
switch (_that) {
case _SignalState():
return $default(_that.isLoading,_that.hasValue,_that.hasError,_that.error,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool hasValue,  bool hasError,  String? error,  T? value)?  $default,) {final _that = this;
switch (_that) {
case _SignalState() when $default != null:
return $default(_that.isLoading,_that.hasValue,_that.hasError,_that.error,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _SignalState<T> extends SignalState<T> {
   _SignalState({this.isLoading = false, this.hasValue = false, this.hasError = false, this.error, this.value}): super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasValue;
@override@JsonKey() final  bool hasError;
@override final  String? error;
@override final  T? value;

/// Create a copy of SignalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignalStateCopyWith<T, _SignalState<T>> get copyWith => __$SignalStateCopyWithImpl<T, _SignalState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignalState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasValue, hasValue) || other.hasValue == hasValue)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasValue,hasError,error,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'SignalState<$T>(isLoading: $isLoading, hasValue: $hasValue, hasError: $hasError, error: $error, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SignalStateCopyWith<T,$Res> implements $SignalStateCopyWith<T, $Res> {
  factory _$SignalStateCopyWith(_SignalState<T> value, $Res Function(_SignalState<T>) _then) = __$SignalStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool hasValue, bool hasError, String? error, T? value
});




}
/// @nodoc
class __$SignalStateCopyWithImpl<T,$Res>
    implements _$SignalStateCopyWith<T, $Res> {
  __$SignalStateCopyWithImpl(this._self, this._then);

  final _SignalState<T> _self;
  final $Res Function(_SignalState<T>) _then;

/// Create a copy of SignalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? hasValue = null,Object? hasError = null,Object? error = freezed,Object? value = freezed,}) {
  return _then(_SignalState<T>(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasValue: null == hasValue ? _self.hasValue : hasValue // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc
mixin _$BigSignalState<T> {

 bool get isLoading; bool get hasValue; bool get hasError; Pagination get pagination; List<T> get value; String? get error;
/// Create a copy of BigSignalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BigSignalStateCopyWith<T, BigSignalState<T>> get copyWith => _$BigSignalStateCopyWithImpl<T, BigSignalState<T>>(this as BigSignalState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BigSignalState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasValue, hasValue) || other.hasValue == hasValue)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasValue,hasError,pagination,const DeepCollectionEquality().hash(value),error);

@override
String toString() {
  return 'BigSignalState<$T>(isLoading: $isLoading, hasValue: $hasValue, hasError: $hasError, pagination: $pagination, value: $value, error: $error)';
}


}

/// @nodoc
abstract mixin class $BigSignalStateCopyWith<T,$Res>  {
  factory $BigSignalStateCopyWith(BigSignalState<T> value, $Res Function(BigSignalState<T>) _then) = _$BigSignalStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool hasValue, bool hasError, Pagination pagination, List<T> value, String? error
});




}
/// @nodoc
class _$BigSignalStateCopyWithImpl<T,$Res>
    implements $BigSignalStateCopyWith<T, $Res> {
  _$BigSignalStateCopyWithImpl(this._self, this._then);

  final BigSignalState<T> _self;
  final $Res Function(BigSignalState<T>) _then;

/// Create a copy of BigSignalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? hasValue = null,Object? hasError = null,Object? pagination = null,Object? value = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasValue: null == hasValue ? _self.hasValue : hasValue // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as List<T>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BigSignalState].
extension BigSignalStatePatterns<T> on BigSignalState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BigSignalState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BigSignalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BigSignalState<T> value)  $default,){
final _that = this;
switch (_that) {
case _BigSignalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BigSignalState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BigSignalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool hasValue,  bool hasError,  Pagination pagination,  List<T> value,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BigSignalState() when $default != null:
return $default(_that.isLoading,_that.hasValue,_that.hasError,_that.pagination,_that.value,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool hasValue,  bool hasError,  Pagination pagination,  List<T> value,  String? error)  $default,) {final _that = this;
switch (_that) {
case _BigSignalState():
return $default(_that.isLoading,_that.hasValue,_that.hasError,_that.pagination,_that.value,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool hasValue,  bool hasError,  Pagination pagination,  List<T> value,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _BigSignalState() when $default != null:
return $default(_that.isLoading,_that.hasValue,_that.hasError,_that.pagination,_that.value,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BigSignalState<T> extends BigSignalState<T> {
   _BigSignalState({this.isLoading = false, this.hasValue = false, this.hasError = false, this.pagination = const Pagination(), final  List<T> value = const [], this.error}): _value = value,super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasValue;
@override@JsonKey() final  bool hasError;
@override@JsonKey() final  Pagination pagination;
 final  List<T> _value;
@override@JsonKey() List<T> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}

@override final  String? error;

/// Create a copy of BigSignalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BigSignalStateCopyWith<T, _BigSignalState<T>> get copyWith => __$BigSignalStateCopyWithImpl<T, _BigSignalState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BigSignalState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasValue, hasValue) || other.hasValue == hasValue)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other._value, _value)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasValue,hasError,pagination,const DeepCollectionEquality().hash(_value),error);

@override
String toString() {
  return 'BigSignalState<$T>(isLoading: $isLoading, hasValue: $hasValue, hasError: $hasError, pagination: $pagination, value: $value, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BigSignalStateCopyWith<T,$Res> implements $BigSignalStateCopyWith<T, $Res> {
  factory _$BigSignalStateCopyWith(_BigSignalState<T> value, $Res Function(_BigSignalState<T>) _then) = __$BigSignalStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool hasValue, bool hasError, Pagination pagination, List<T> value, String? error
});




}
/// @nodoc
class __$BigSignalStateCopyWithImpl<T,$Res>
    implements _$BigSignalStateCopyWith<T, $Res> {
  __$BigSignalStateCopyWithImpl(this._self, this._then);

  final _BigSignalState<T> _self;
  final $Res Function(_BigSignalState<T>) _then;

/// Create a copy of BigSignalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? hasValue = null,Object? hasError = null,Object? pagination = null,Object? value = null,Object? error = freezed,}) {
  return _then(_BigSignalState<T>(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasValue: null == hasValue ? _self.hasValue : hasValue // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,value: null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<T>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
