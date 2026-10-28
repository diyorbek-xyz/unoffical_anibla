// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationView {

 String get title; String get subtitle; List<ActionView> get actions; IconData get icon; bool get isHtml; String get image; String get mediaKey; String get chapterKey; MediaType get type;
/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationViewCopyWith<NotificationView> get copyWith => _$NotificationViewCopyWithImpl<NotificationView>(this as NotificationView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationView&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.actions, actions)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isHtml, isHtml) || other.isHtml == isHtml)&&(identical(other.image, image) || other.image == image)&&(identical(other.mediaKey, mediaKey) || other.mediaKey == mediaKey)&&(identical(other.chapterKey, chapterKey) || other.chapterKey == chapterKey)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(actions),icon,isHtml,image,mediaKey,chapterKey,type);

@override
String toString() {
  return 'NotificationView(title: $title, subtitle: $subtitle, actions: $actions, icon: $icon, isHtml: $isHtml, image: $image, mediaKey: $mediaKey, chapterKey: $chapterKey, type: $type)';
}


}

/// @nodoc
abstract mixin class $NotificationViewCopyWith<$Res>  {
  factory $NotificationViewCopyWith(NotificationView value, $Res Function(NotificationView) _then) = _$NotificationViewCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, List<ActionView> actions, IconData icon, bool isHtml, String image, String mediaKey, String chapterKey, MediaType type
});




}
/// @nodoc
class _$NotificationViewCopyWithImpl<$Res>
    implements $NotificationViewCopyWith<$Res> {
  _$NotificationViewCopyWithImpl(this._self, this._then);

  final NotificationView _self;
  final $Res Function(NotificationView) _then;

/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? actions = null,Object? icon = null,Object? isHtml = null,Object? image = null,Object? mediaKey = null,Object? chapterKey = null,Object? type = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<ActionView>,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,isHtml: null == isHtml ? _self.isHtml : isHtml // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,mediaKey: null == mediaKey ? _self.mediaKey : mediaKey // ignore: cast_nullable_to_non_nullable
as String,chapterKey: null == chapterKey ? _self.chapterKey : chapterKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationView].
extension NotificationViewPatterns on NotificationView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationView value)  $default,){
final _that = this;
switch (_that) {
case _NotificationView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationView value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  List<ActionView> actions,  IconData icon,  bool isHtml,  String image,  String mediaKey,  String chapterKey,  MediaType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
return $default(_that.title,_that.subtitle,_that.actions,_that.icon,_that.isHtml,_that.image,_that.mediaKey,_that.chapterKey,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  List<ActionView> actions,  IconData icon,  bool isHtml,  String image,  String mediaKey,  String chapterKey,  MediaType type)  $default,) {final _that = this;
switch (_that) {
case _NotificationView():
return $default(_that.title,_that.subtitle,_that.actions,_that.icon,_that.isHtml,_that.image,_that.mediaKey,_that.chapterKey,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  List<ActionView> actions,  IconData icon,  bool isHtml,  String image,  String mediaKey,  String chapterKey,  MediaType type)?  $default,) {final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
return $default(_that.title,_that.subtitle,_that.actions,_that.icon,_that.isHtml,_that.image,_that.mediaKey,_that.chapterKey,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationView implements NotificationView {
  const _NotificationView({this.title = "", this.subtitle = "", final  List<ActionView> actions = const [], this.icon = Icons.home, this.isHtml = false, this.image = "", this.mediaKey = "", this.chapterKey = "", this.type = MediaType.serie}): _actions = actions;
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String subtitle;
 final  List<ActionView> _actions;
@override@JsonKey() List<ActionView> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}

@override@JsonKey() final  IconData icon;
@override@JsonKey() final  bool isHtml;
@override@JsonKey() final  String image;
@override@JsonKey() final  String mediaKey;
@override@JsonKey() final  String chapterKey;
@override@JsonKey() final  MediaType type;

/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationViewCopyWith<_NotificationView> get copyWith => __$NotificationViewCopyWithImpl<_NotificationView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationView&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._actions, _actions)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isHtml, isHtml) || other.isHtml == isHtml)&&(identical(other.image, image) || other.image == image)&&(identical(other.mediaKey, mediaKey) || other.mediaKey == mediaKey)&&(identical(other.chapterKey, chapterKey) || other.chapterKey == chapterKey)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(_actions),icon,isHtml,image,mediaKey,chapterKey,type);

@override
String toString() {
  return 'NotificationView(title: $title, subtitle: $subtitle, actions: $actions, icon: $icon, isHtml: $isHtml, image: $image, mediaKey: $mediaKey, chapterKey: $chapterKey, type: $type)';
}


}

/// @nodoc
abstract mixin class _$NotificationViewCopyWith<$Res> implements $NotificationViewCopyWith<$Res> {
  factory _$NotificationViewCopyWith(_NotificationView value, $Res Function(_NotificationView) _then) = __$NotificationViewCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, List<ActionView> actions, IconData icon, bool isHtml, String image, String mediaKey, String chapterKey, MediaType type
});




}
/// @nodoc
class __$NotificationViewCopyWithImpl<$Res>
    implements _$NotificationViewCopyWith<$Res> {
  __$NotificationViewCopyWithImpl(this._self, this._then);

  final _NotificationView _self;
  final $Res Function(_NotificationView) _then;

/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? actions = null,Object? icon = null,Object? isHtml = null,Object? image = null,Object? mediaKey = null,Object? chapterKey = null,Object? type = null,}) {
  return _then(_NotificationView(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<ActionView>,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,isHtml: null == isHtml ? _self.isHtml : isHtml // ignore: cast_nullable_to_non_nullable
as bool,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,mediaKey: null == mediaKey ? _self.mediaKey : mediaKey // ignore: cast_nullable_to_non_nullable
as String,chapterKey: null == chapterKey ? _self.chapterKey : chapterKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}


}

// dart format on
