// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_authback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoAuthed {

 ManoProfile get user;@JsonKey(name: "access_token") String get accessToken;@JsonKey(name: "refresh_token") String get refreshToken;@JsonKey(name: "expires_in") int get expiresIn;@JsonKey(name: "refresh_expires_in") int get refreshExpiresIn;
/// Create a copy of ManoAuthed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoAuthedCopyWith<ManoAuthed> get copyWith => _$ManoAuthedCopyWithImpl<ManoAuthed>(this as ManoAuthed, _$identity);

  /// Serializes this ManoAuthed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoAuthed&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken,expiresIn,refreshExpiresIn);

@override
String toString() {
  return 'ManoAuthed(user: $user, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn)';
}


}

/// @nodoc
abstract mixin class $ManoAuthedCopyWith<$Res>  {
  factory $ManoAuthedCopyWith(ManoAuthed value, $Res Function(ManoAuthed) _then) = _$ManoAuthedCopyWithImpl;
@useResult
$Res call({
 ManoProfile user,@JsonKey(name: "access_token") String accessToken,@JsonKey(name: "refresh_token") String refreshToken,@JsonKey(name: "expires_in") int expiresIn,@JsonKey(name: "refresh_expires_in") int refreshExpiresIn
});


$ManoProfileCopyWith<$Res> get user;

}
/// @nodoc
class _$ManoAuthedCopyWithImpl<$Res>
    implements $ManoAuthedCopyWith<$Res> {
  _$ManoAuthedCopyWithImpl(this._self, this._then);

  final ManoAuthed _self;
  final $Res Function(ManoAuthed) _then;

/// Create a copy of ManoAuthed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ManoProfile,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ManoAuthed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManoProfileCopyWith<$Res> get user {
  
  return $ManoProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManoAuthed].
extension ManoAuthedPatterns on ManoAuthed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoAuthed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoAuthed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoAuthed value)  $default,){
final _that = this;
switch (_that) {
case _ManoAuthed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoAuthed value)?  $default,){
final _that = this;
switch (_that) {
case _ManoAuthed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ManoProfile user, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "expires_in")  int expiresIn, @JsonKey(name: "refresh_expires_in")  int refreshExpiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoAuthed() when $default != null:
return $default(_that.user,_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ManoProfile user, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "expires_in")  int expiresIn, @JsonKey(name: "refresh_expires_in")  int refreshExpiresIn)  $default,) {final _that = this;
switch (_that) {
case _ManoAuthed():
return $default(_that.user,_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ManoProfile user, @JsonKey(name: "access_token")  String accessToken, @JsonKey(name: "refresh_token")  String refreshToken, @JsonKey(name: "expires_in")  int expiresIn, @JsonKey(name: "refresh_expires_in")  int refreshExpiresIn)?  $default,) {final _that = this;
switch (_that) {
case _ManoAuthed() when $default != null:
return $default(_that.user,_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoAuthed implements ManoAuthed {
  const _ManoAuthed({this.user = const ManoProfile(), @JsonKey(name: "access_token") this.accessToken = "", @JsonKey(name: "refresh_token") this.refreshToken = "", @JsonKey(name: "expires_in") this.expiresIn = 0, @JsonKey(name: "refresh_expires_in") this.refreshExpiresIn = 0});
  factory _ManoAuthed.fromJson(Map<String, dynamic> json) => _$ManoAuthedFromJson(json);

@override@JsonKey() final  ManoProfile user;
@override@JsonKey(name: "access_token") final  String accessToken;
@override@JsonKey(name: "refresh_token") final  String refreshToken;
@override@JsonKey(name: "expires_in") final  int expiresIn;
@override@JsonKey(name: "refresh_expires_in") final  int refreshExpiresIn;

/// Create a copy of ManoAuthed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoAuthedCopyWith<_ManoAuthed> get copyWith => __$ManoAuthedCopyWithImpl<_ManoAuthed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoAuthedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoAuthed&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken,expiresIn,refreshExpiresIn);

@override
String toString() {
  return 'ManoAuthed(user: $user, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn)';
}


}

/// @nodoc
abstract mixin class _$ManoAuthedCopyWith<$Res> implements $ManoAuthedCopyWith<$Res> {
  factory _$ManoAuthedCopyWith(_ManoAuthed value, $Res Function(_ManoAuthed) _then) = __$ManoAuthedCopyWithImpl;
@override @useResult
$Res call({
 ManoProfile user,@JsonKey(name: "access_token") String accessToken,@JsonKey(name: "refresh_token") String refreshToken,@JsonKey(name: "expires_in") int expiresIn,@JsonKey(name: "refresh_expires_in") int refreshExpiresIn
});


@override $ManoProfileCopyWith<$Res> get user;

}
/// @nodoc
class __$ManoAuthedCopyWithImpl<$Res>
    implements _$ManoAuthedCopyWith<$Res> {
  __$ManoAuthedCopyWithImpl(this._self, this._then);

  final _ManoAuthed _self;
  final $Res Function(_ManoAuthed) _then;

/// Create a copy of ManoAuthed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,}) {
  return _then(_ManoAuthed(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ManoProfile,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ManoAuthed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManoProfileCopyWith<$Res> get user {
  
  return $ManoProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
