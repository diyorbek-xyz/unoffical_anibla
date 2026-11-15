// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActionView {

 String? get title; IconData get icon; VoidCallback get action;
/// Create a copy of ActionView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionViewCopyWith<ActionView> get copyWith => _$ActionViewCopyWithImpl<ActionView>(this as ActionView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionView&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,title,icon,action);

@override
String toString() {
  return 'ActionView(title: $title, icon: $icon, action: $action)';
}


}

/// @nodoc
abstract mixin class $ActionViewCopyWith<$Res>  {
  factory $ActionViewCopyWith(ActionView value, $Res Function(ActionView) _then) = _$ActionViewCopyWithImpl;
@useResult
$Res call({
 String? title, IconData icon, VoidCallback action
});




}
/// @nodoc
class _$ActionViewCopyWithImpl<$Res>
    implements $ActionViewCopyWith<$Res> {
  _$ActionViewCopyWithImpl(this._self, this._then);

  final ActionView _self;
  final $Res Function(ActionView) _then;

/// Create a copy of ActionView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? icon = null,Object? action = null,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionView].
extension ActionViewPatterns on ActionView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionView value)  $default,){
final _that = this;
switch (_that) {
case _ActionView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionView value)?  $default,){
final _that = this;
switch (_that) {
case _ActionView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  IconData icon,  VoidCallback action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionView() when $default != null:
return $default(_that.title,_that.icon,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  IconData icon,  VoidCallback action)  $default,) {final _that = this;
switch (_that) {
case _ActionView():
return $default(_that.title,_that.icon,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  IconData icon,  VoidCallback action)?  $default,) {final _that = this;
switch (_that) {
case _ActionView() when $default != null:
return $default(_that.title,_that.icon,_that.action);case _:
  return null;

}
}

}

/// @nodoc


class _ActionView implements ActionView {
  const _ActionView({this.title, required this.icon, required this.action});
  

@override final  String? title;
@override final  IconData icon;
@override final  VoidCallback action;

/// Create a copy of ActionView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionViewCopyWith<_ActionView> get copyWith => __$ActionViewCopyWithImpl<_ActionView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionView&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,title,icon,action);

@override
String toString() {
  return 'ActionView(title: $title, icon: $icon, action: $action)';
}


}

/// @nodoc
abstract mixin class _$ActionViewCopyWith<$Res> implements $ActionViewCopyWith<$Res> {
  factory _$ActionViewCopyWith(_ActionView value, $Res Function(_ActionView) _then) = __$ActionViewCopyWithImpl;
@override @useResult
$Res call({
 String? title, IconData icon, VoidCallback action
});




}
/// @nodoc
class __$ActionViewCopyWithImpl<$Res>
    implements _$ActionViewCopyWith<$Res> {
  __$ActionViewCopyWithImpl(this._self, this._then);

  final _ActionView _self;
  final $Res Function(_ActionView) _then;

/// Create a copy of ActionView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? icon = null,Object? action = null,}) {
  return _then(_ActionView(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}


}

// dart format on
