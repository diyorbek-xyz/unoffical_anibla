// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentState {

 CommentsState get state; GetCommentsProps? get props; String? get error; CommentResponse? get response;
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentStateCopyWith<CommentState> get copyWith => _$CommentStateCopyWithImpl<CommentState>(this as CommentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentState&&(identical(other.state, state) || other.state == state)&&(identical(other.props, props) || other.props == props)&&(identical(other.error, error) || other.error == error)&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,state,props,error,response);

@override
String toString() {
  return 'CommentState(state: $state, props: $props, error: $error, response: $response)';
}


}

/// @nodoc
abstract mixin class $CommentStateCopyWith<$Res>  {
  factory $CommentStateCopyWith(CommentState value, $Res Function(CommentState) _then) = _$CommentStateCopyWithImpl;
@useResult
$Res call({
 CommentsState state, GetCommentsProps? props, String? error, CommentResponse? response
});


$GetCommentsPropsCopyWith<$Res>? get props;$CommentResponseCopyWith<$Res>? get response;

}
/// @nodoc
class _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._self, this._then);

  final CommentState _self;
  final $Res Function(CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? props = freezed,Object? error = freezed,Object? response = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as CommentsState,props: freezed == props ? _self.props : props // ignore: cast_nullable_to_non_nullable
as GetCommentsProps?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CommentResponse?,
  ));
}
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetCommentsPropsCopyWith<$Res>? get props {
    if (_self.props == null) {
    return null;
  }

  return $GetCommentsPropsCopyWith<$Res>(_self.props!, (value) {
    return _then(_self.copyWith(props: value));
  });
}/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
    return null;
  }

  return $CommentResponseCopyWith<$Res>(_self.response!, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommentState].
extension CommentStatePatterns on CommentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentState value)  $default,){
final _that = this;
switch (_that) {
case _CommentState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentState value)?  $default,){
final _that = this;
switch (_that) {
case _CommentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommentsState state,  GetCommentsProps? props,  String? error,  CommentResponse? response)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentState() when $default != null:
return $default(_that.state,_that.props,_that.error,_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommentsState state,  GetCommentsProps? props,  String? error,  CommentResponse? response)  $default,) {final _that = this;
switch (_that) {
case _CommentState():
return $default(_that.state,_that.props,_that.error,_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommentsState state,  GetCommentsProps? props,  String? error,  CommentResponse? response)?  $default,) {final _that = this;
switch (_that) {
case _CommentState() when $default != null:
return $default(_that.state,_that.props,_that.error,_that.response);case _:
  return null;

}
}

}

/// @nodoc


class _CommentState implements CommentState {
   _CommentState({required this.state, this.props, this.error, this.response});
  

@override final  CommentsState state;
@override final  GetCommentsProps? props;
@override final  String? error;
@override final  CommentResponse? response;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentStateCopyWith<_CommentState> get copyWith => __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentState&&(identical(other.state, state) || other.state == state)&&(identical(other.props, props) || other.props == props)&&(identical(other.error, error) || other.error == error)&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,state,props,error,response);

@override
String toString() {
  return 'CommentState(state: $state, props: $props, error: $error, response: $response)';
}


}

/// @nodoc
abstract mixin class _$CommentStateCopyWith<$Res> implements $CommentStateCopyWith<$Res> {
  factory _$CommentStateCopyWith(_CommentState value, $Res Function(_CommentState) _then) = __$CommentStateCopyWithImpl;
@override @useResult
$Res call({
 CommentsState state, GetCommentsProps? props, String? error, CommentResponse? response
});


@override $GetCommentsPropsCopyWith<$Res>? get props;@override $CommentResponseCopyWith<$Res>? get response;

}
/// @nodoc
class __$CommentStateCopyWithImpl<$Res>
    implements _$CommentStateCopyWith<$Res> {
  __$CommentStateCopyWithImpl(this._self, this._then);

  final _CommentState _self;
  final $Res Function(_CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? props = freezed,Object? error = freezed,Object? response = freezed,}) {
  return _then(_CommentState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as CommentsState,props: freezed == props ? _self.props : props // ignore: cast_nullable_to_non_nullable
as GetCommentsProps?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CommentResponse?,
  ));
}

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetCommentsPropsCopyWith<$Res>? get props {
    if (_self.props == null) {
    return null;
  }

  return $GetCommentsPropsCopyWith<$Res>(_self.props!, (value) {
    return _then(_self.copyWith(props: value));
  });
}/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
    return null;
  }

  return $CommentResponseCopyWith<$Res>(_self.response!, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}

// dart format on
