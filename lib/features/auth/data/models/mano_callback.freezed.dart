// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_callback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoCallback {

 String get code;@JsonKey(name: "expires_at") String get expiresDate;@JsonKey(name: "redirect_uri") String get redirectUri;
/// Create a copy of ManoCallback
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoCallbackCopyWith<ManoCallback> get copyWith => _$ManoCallbackCopyWithImpl<ManoCallback>(this as ManoCallback, _$identity);

  /// Serializes this ManoCallback to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoCallback&&(identical(other.code, code) || other.code == code)&&(identical(other.expiresDate, expiresDate) || other.expiresDate == expiresDate)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,expiresDate,redirectUri);

@override
String toString() {
  return 'ManoCallback(code: $code, expiresDate: $expiresDate, redirectUri: $redirectUri)';
}


}

/// @nodoc
abstract mixin class $ManoCallbackCopyWith<$Res>  {
  factory $ManoCallbackCopyWith(ManoCallback value, $Res Function(ManoCallback) _then) = _$ManoCallbackCopyWithImpl;
@useResult
$Res call({
 String code,@JsonKey(name: "expires_at") String expiresDate,@JsonKey(name: "redirect_uri") String redirectUri
});




}
/// @nodoc
class _$ManoCallbackCopyWithImpl<$Res>
    implements $ManoCallbackCopyWith<$Res> {
  _$ManoCallbackCopyWithImpl(this._self, this._then);

  final ManoCallback _self;
  final $Res Function(ManoCallback) _then;

/// Create a copy of ManoCallback
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? expiresDate = null,Object? redirectUri = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,expiresDate: null == expiresDate ? _self.expiresDate : expiresDate // ignore: cast_nullable_to_non_nullable
as String,redirectUri: null == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoCallback].
extension ManoCallbackPatterns on ManoCallback {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoCallback value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoCallback() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoCallback value)  $default,){
final _that = this;
switch (_that) {
case _ManoCallback():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoCallback value)?  $default,){
final _that = this;
switch (_that) {
case _ManoCallback() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code, @JsonKey(name: "expires_at")  String expiresDate, @JsonKey(name: "redirect_uri")  String redirectUri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoCallback() when $default != null:
return $default(_that.code,_that.expiresDate,_that.redirectUri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code, @JsonKey(name: "expires_at")  String expiresDate, @JsonKey(name: "redirect_uri")  String redirectUri)  $default,) {final _that = this;
switch (_that) {
case _ManoCallback():
return $default(_that.code,_that.expiresDate,_that.redirectUri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code, @JsonKey(name: "expires_at")  String expiresDate, @JsonKey(name: "redirect_uri")  String redirectUri)?  $default,) {final _that = this;
switch (_that) {
case _ManoCallback() when $default != null:
return $default(_that.code,_that.expiresDate,_that.redirectUri);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoCallback implements ManoCallback {
   _ManoCallback({this.code = "", @JsonKey(name: "expires_at") this.expiresDate = "", @JsonKey(name: "redirect_uri") this.redirectUri = ""});
  factory _ManoCallback.fromJson(Map<String, dynamic> json) => _$ManoCallbackFromJson(json);

@override@JsonKey() final  String code;
@override@JsonKey(name: "expires_at") final  String expiresDate;
@override@JsonKey(name: "redirect_uri") final  String redirectUri;

/// Create a copy of ManoCallback
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoCallbackCopyWith<_ManoCallback> get copyWith => __$ManoCallbackCopyWithImpl<_ManoCallback>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoCallbackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoCallback&&(identical(other.code, code) || other.code == code)&&(identical(other.expiresDate, expiresDate) || other.expiresDate == expiresDate)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,expiresDate,redirectUri);

@override
String toString() {
  return 'ManoCallback(code: $code, expiresDate: $expiresDate, redirectUri: $redirectUri)';
}


}

/// @nodoc
abstract mixin class _$ManoCallbackCopyWith<$Res> implements $ManoCallbackCopyWith<$Res> {
  factory _$ManoCallbackCopyWith(_ManoCallback value, $Res Function(_ManoCallback) _then) = __$ManoCallbackCopyWithImpl;
@override @useResult
$Res call({
 String code,@JsonKey(name: "expires_at") String expiresDate,@JsonKey(name: "redirect_uri") String redirectUri
});




}
/// @nodoc
class __$ManoCallbackCopyWithImpl<$Res>
    implements _$ManoCallbackCopyWith<$Res> {
  __$ManoCallbackCopyWithImpl(this._self, this._then);

  final _ManoCallback _self;
  final $Res Function(_ManoCallback) _then;

/// Create a copy of ManoCallback
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? expiresDate = null,Object? redirectUri = null,}) {
  return _then(_ManoCallback(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,expiresDate: null == expiresDate ? _self.expiresDate : expiresDate // ignore: cast_nullable_to_non_nullable
as String,redirectUri: null == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
