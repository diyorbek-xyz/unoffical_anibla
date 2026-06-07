// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SliderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SliderState()';
}


}

/// @nodoc
class $SliderStateCopyWith<$Res>  {
$SliderStateCopyWith(SliderState _, $Res Function(SliderState) __);
}


/// Adds pattern-matching-related methods to [SliderState].
extension SliderStatePatterns on SliderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success value)?  success,TResult Function( _Failed value)?  failed,TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
return failed(_that);case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success value)  success,required TResult Function( _Failed value)  failed,required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _Failed():
return failed(_that);case _Initial():
return initial(_that);case _Loading():
return loading(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success value)?  success,TResult? Function( _Failed value)?  failed,TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
return failed(_that);case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<SliderEntity> data)?  success,TResult Function( String message)?  failed,TResult Function()?  initial,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _Failed() when failed != null:
return failed(_that.message);case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<SliderEntity> data)  success,required TResult Function( String message)  failed,required TResult Function()  initial,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.data);case _Failed():
return failed(_that.message);case _Initial():
return initial();case _Loading():
return loading();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<SliderEntity> data)?  success,TResult? Function( String message)?  failed,TResult? Function()?  initial,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _Failed() when failed != null:
return failed(_that.message);case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class _Success implements SliderState {
   _Success(final  List<SliderEntity> data): _data = data;
  

 final  List<SliderEntity> _data;
 List<SliderEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SliderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SliderState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $SliderStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<SliderEntity> data
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of SliderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Success(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SliderEntity>,
  ));
}


}

/// @nodoc


class _Failed implements SliderState {
   _Failed(this.message);
  

 final  String message;

/// Create a copy of SliderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedCopyWith<_Failed> get copyWith => __$FailedCopyWithImpl<_Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SliderState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res> implements $SliderStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) = __$FailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailedCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

/// Create a copy of SliderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Initial implements SliderState {
   _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SliderState.initial()';
}


}




/// @nodoc


class _Loading implements SliderState {
   _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SliderState.loading()';
}


}




/// @nodoc
mixin _$SliderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SliderEvent()';
}


}

/// @nodoc
class $SliderEventCopyWith<$Res>  {
$SliderEventCopyWith(SliderEvent _, $Res Function(SliderEvent) __);
}


/// Adds pattern-matching-related methods to [SliderEvent].
extension SliderEventPatterns on SliderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetFull value)?  getFull,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetFull() when getFull != null:
return getFull(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetFull value)  getFull,}){
final _that = this;
switch (_that) {
case _GetFull():
return getFull(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetFull value)?  getFull,}){
final _that = this;
switch (_that) {
case _GetFull() when getFull != null:
return getFull(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getFull,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetFull() when getFull != null:
return getFull();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getFull,}) {final _that = this;
switch (_that) {
case _GetFull():
return getFull();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getFull,}) {final _that = this;
switch (_that) {
case _GetFull() when getFull != null:
return getFull();case _:
  return null;

}
}

}

/// @nodoc


class _GetFull implements SliderEvent {
   _GetFull();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetFull);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SliderEvent.getFull()';
}


}




// dart format on
