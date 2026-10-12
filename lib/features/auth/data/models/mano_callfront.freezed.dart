// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_callfront.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoCallfront {

@JsonKey(name: "app_id") String get appId;@JsonKey(name: "redirect_uri") String get redirectUri;
/// Create a copy of ManoCallfront
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoCallfrontCopyWith<ManoCallfront> get copyWith => _$ManoCallfrontCopyWithImpl<ManoCallfront>(this as ManoCallfront, _$identity);

  /// Serializes this ManoCallfront to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoCallfront&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appId,redirectUri);

@override
String toString() {
  return 'ManoCallfront(appId: $appId, redirectUri: $redirectUri)';
}


}

/// @nodoc
abstract mixin class $ManoCallfrontCopyWith<$Res>  {
  factory $ManoCallfrontCopyWith(ManoCallfront value, $Res Function(ManoCallfront) _then) = _$ManoCallfrontCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "app_id") String appId,@JsonKey(name: "redirect_uri") String redirectUri
});




}
/// @nodoc
class _$ManoCallfrontCopyWithImpl<$Res>
    implements $ManoCallfrontCopyWith<$Res> {
  _$ManoCallfrontCopyWithImpl(this._self, this._then);

  final ManoCallfront _self;
  final $Res Function(ManoCallfront) _then;

/// Create a copy of ManoCallfront
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appId = null,Object? redirectUri = null,}) {
  return _then(_self.copyWith(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,redirectUri: null == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoCallfront].
extension ManoCallfrontPatterns on ManoCallfront {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoCallfront value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoCallfront() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoCallfront value)  $default,){
final _that = this;
switch (_that) {
case _ManoCallfront():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoCallfront value)?  $default,){
final _that = this;
switch (_that) {
case _ManoCallfront() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "app_id")  String appId, @JsonKey(name: "redirect_uri")  String redirectUri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoCallfront() when $default != null:
return $default(_that.appId,_that.redirectUri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "app_id")  String appId, @JsonKey(name: "redirect_uri")  String redirectUri)  $default,) {final _that = this;
switch (_that) {
case _ManoCallfront():
return $default(_that.appId,_that.redirectUri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "app_id")  String appId, @JsonKey(name: "redirect_uri")  String redirectUri)?  $default,) {final _that = this;
switch (_that) {
case _ManoCallfront() when $default != null:
return $default(_that.appId,_that.redirectUri);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoCallfront implements ManoCallfront {
  const _ManoCallfront({@JsonKey(name: "app_id") this.appId = "", @JsonKey(name: "redirect_uri") this.redirectUri = ""});
  factory _ManoCallfront.fromJson(Map<String, dynamic> json) => _$ManoCallfrontFromJson(json);

@override@JsonKey(name: "app_id") final  String appId;
@override@JsonKey(name: "redirect_uri") final  String redirectUri;

/// Create a copy of ManoCallfront
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoCallfrontCopyWith<_ManoCallfront> get copyWith => __$ManoCallfrontCopyWithImpl<_ManoCallfront>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoCallfrontToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoCallfront&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.redirectUri, redirectUri) || other.redirectUri == redirectUri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appId,redirectUri);

@override
String toString() {
  return 'ManoCallfront(appId: $appId, redirectUri: $redirectUri)';
}


}

/// @nodoc
abstract mixin class _$ManoCallfrontCopyWith<$Res> implements $ManoCallfrontCopyWith<$Res> {
  factory _$ManoCallfrontCopyWith(_ManoCallfront value, $Res Function(_ManoCallfront) _then) = __$ManoCallfrontCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "app_id") String appId,@JsonKey(name: "redirect_uri") String redirectUri
});




}
/// @nodoc
class __$ManoCallfrontCopyWithImpl<$Res>
    implements _$ManoCallfrontCopyWith<$Res> {
  __$ManoCallfrontCopyWithImpl(this._self, this._then);

  final _ManoCallfront _self;
  final $Res Function(_ManoCallfront) _then;

/// Create a copy of ManoCallfront
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appId = null,Object? redirectUri = null,}) {
  return _then(_ManoCallfront(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,redirectUri: null == redirectUri ? _self.redirectUri : redirectUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
