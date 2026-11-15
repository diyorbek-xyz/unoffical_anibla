// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaState {

 bool get isMediaLoading; bool get isChaptersLoading; bool get hasChaptersError; bool get hasMediaError; String get chaptersError; String get mediaError;
/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStateCopyWith<MediaState> get copyWith => _$MediaStateCopyWithImpl<MediaState>(this as MediaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaState&&(identical(other.isMediaLoading, isMediaLoading) || other.isMediaLoading == isMediaLoading)&&(identical(other.isChaptersLoading, isChaptersLoading) || other.isChaptersLoading == isChaptersLoading)&&(identical(other.hasChaptersError, hasChaptersError) || other.hasChaptersError == hasChaptersError)&&(identical(other.hasMediaError, hasMediaError) || other.hasMediaError == hasMediaError)&&(identical(other.chaptersError, chaptersError) || other.chaptersError == chaptersError)&&(identical(other.mediaError, mediaError) || other.mediaError == mediaError));
}


@override
int get hashCode => Object.hash(runtimeType,isMediaLoading,isChaptersLoading,hasChaptersError,hasMediaError,chaptersError,mediaError);

@override
String toString() {
  return 'MediaState(isMediaLoading: $isMediaLoading, isChaptersLoading: $isChaptersLoading, hasChaptersError: $hasChaptersError, hasMediaError: $hasMediaError, chaptersError: $chaptersError, mediaError: $mediaError)';
}


}

/// @nodoc
abstract mixin class $MediaStateCopyWith<$Res>  {
  factory $MediaStateCopyWith(MediaState value, $Res Function(MediaState) _then) = _$MediaStateCopyWithImpl;
@useResult
$Res call({
 bool isMediaLoading, bool isChaptersLoading, bool hasChaptersError, bool hasMediaError, String chaptersError, String mediaError
});




}
/// @nodoc
class _$MediaStateCopyWithImpl<$Res>
    implements $MediaStateCopyWith<$Res> {
  _$MediaStateCopyWithImpl(this._self, this._then);

  final MediaState _self;
  final $Res Function(MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMediaLoading = null,Object? isChaptersLoading = null,Object? hasChaptersError = null,Object? hasMediaError = null,Object? chaptersError = null,Object? mediaError = null,}) {
  return _then(_self.copyWith(
isMediaLoading: null == isMediaLoading ? _self.isMediaLoading : isMediaLoading // ignore: cast_nullable_to_non_nullable
as bool,isChaptersLoading: null == isChaptersLoading ? _self.isChaptersLoading : isChaptersLoading // ignore: cast_nullable_to_non_nullable
as bool,hasChaptersError: null == hasChaptersError ? _self.hasChaptersError : hasChaptersError // ignore: cast_nullable_to_non_nullable
as bool,hasMediaError: null == hasMediaError ? _self.hasMediaError : hasMediaError // ignore: cast_nullable_to_non_nullable
as bool,chaptersError: null == chaptersError ? _self.chaptersError : chaptersError // ignore: cast_nullable_to_non_nullable
as String,mediaError: null == mediaError ? _self.mediaError : mediaError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaState].
extension MediaStatePatterns on MediaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaState value)  $default,){
final _that = this;
switch (_that) {
case _MediaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaState value)?  $default,){
final _that = this;
switch (_that) {
case _MediaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isMediaLoading,  bool isChaptersLoading,  bool hasChaptersError,  bool hasMediaError,  String chaptersError,  String mediaError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaState() when $default != null:
return $default(_that.isMediaLoading,_that.isChaptersLoading,_that.hasChaptersError,_that.hasMediaError,_that.chaptersError,_that.mediaError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isMediaLoading,  bool isChaptersLoading,  bool hasChaptersError,  bool hasMediaError,  String chaptersError,  String mediaError)  $default,) {final _that = this;
switch (_that) {
case _MediaState():
return $default(_that.isMediaLoading,_that.isChaptersLoading,_that.hasChaptersError,_that.hasMediaError,_that.chaptersError,_that.mediaError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isMediaLoading,  bool isChaptersLoading,  bool hasChaptersError,  bool hasMediaError,  String chaptersError,  String mediaError)?  $default,) {final _that = this;
switch (_that) {
case _MediaState() when $default != null:
return $default(_that.isMediaLoading,_that.isChaptersLoading,_that.hasChaptersError,_that.hasMediaError,_that.chaptersError,_that.mediaError);case _:
  return null;

}
}

}

/// @nodoc


class _MediaState implements MediaState {
  const _MediaState({this.isMediaLoading = true, this.isChaptersLoading = true, this.hasChaptersError = false, this.hasMediaError = false, this.chaptersError = "", this.mediaError = ""});
  

@override@JsonKey() final  bool isMediaLoading;
@override@JsonKey() final  bool isChaptersLoading;
@override@JsonKey() final  bool hasChaptersError;
@override@JsonKey() final  bool hasMediaError;
@override@JsonKey() final  String chaptersError;
@override@JsonKey() final  String mediaError;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaStateCopyWith<_MediaState> get copyWith => __$MediaStateCopyWithImpl<_MediaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaState&&(identical(other.isMediaLoading, isMediaLoading) || other.isMediaLoading == isMediaLoading)&&(identical(other.isChaptersLoading, isChaptersLoading) || other.isChaptersLoading == isChaptersLoading)&&(identical(other.hasChaptersError, hasChaptersError) || other.hasChaptersError == hasChaptersError)&&(identical(other.hasMediaError, hasMediaError) || other.hasMediaError == hasMediaError)&&(identical(other.chaptersError, chaptersError) || other.chaptersError == chaptersError)&&(identical(other.mediaError, mediaError) || other.mediaError == mediaError));
}


@override
int get hashCode => Object.hash(runtimeType,isMediaLoading,isChaptersLoading,hasChaptersError,hasMediaError,chaptersError,mediaError);

@override
String toString() {
  return 'MediaState(isMediaLoading: $isMediaLoading, isChaptersLoading: $isChaptersLoading, hasChaptersError: $hasChaptersError, hasMediaError: $hasMediaError, chaptersError: $chaptersError, mediaError: $mediaError)';
}


}

/// @nodoc
abstract mixin class _$MediaStateCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory _$MediaStateCopyWith(_MediaState value, $Res Function(_MediaState) _then) = __$MediaStateCopyWithImpl;
@override @useResult
$Res call({
 bool isMediaLoading, bool isChaptersLoading, bool hasChaptersError, bool hasMediaError, String chaptersError, String mediaError
});




}
/// @nodoc
class __$MediaStateCopyWithImpl<$Res>
    implements _$MediaStateCopyWith<$Res> {
  __$MediaStateCopyWithImpl(this._self, this._then);

  final _MediaState _self;
  final $Res Function(_MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMediaLoading = null,Object? isChaptersLoading = null,Object? hasChaptersError = null,Object? hasMediaError = null,Object? chaptersError = null,Object? mediaError = null,}) {
  return _then(_MediaState(
isMediaLoading: null == isMediaLoading ? _self.isMediaLoading : isMediaLoading // ignore: cast_nullable_to_non_nullable
as bool,isChaptersLoading: null == isChaptersLoading ? _self.isChaptersLoading : isChaptersLoading // ignore: cast_nullable_to_non_nullable
as bool,hasChaptersError: null == hasChaptersError ? _self.hasChaptersError : hasChaptersError // ignore: cast_nullable_to_non_nullable
as bool,hasMediaError: null == hasMediaError ? _self.hasMediaError : hasMediaError // ignore: cast_nullable_to_non_nullable
as bool,chaptersError: null == chaptersError ? _self.chaptersError : chaptersError // ignore: cast_nullable_to_non_nullable
as String,mediaError: null == mediaError ? _self.mediaError : mediaError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
