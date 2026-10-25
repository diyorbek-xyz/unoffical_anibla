// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaView {

 String get cover; String get title; String get error; bool get hasError; bool get isLoading; List<Tab> get tabs; String get thumbnail; List<Widget> get views; List<MapEntry<String, Object>> get items;
/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaViewCopyWith<MediaView> get copyWith => _$MediaViewCopyWithImpl<MediaView>(this as MediaView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaView&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.error, error) || other.error == error)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.tabs, tabs)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other.views, views)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,cover,title,error,hasError,isLoading,const DeepCollectionEquality().hash(tabs),thumbnail,const DeepCollectionEquality().hash(views),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MediaView(cover: $cover, title: $title, error: $error, hasError: $hasError, isLoading: $isLoading, tabs: $tabs, thumbnail: $thumbnail, views: $views, items: $items)';
}


}

/// @nodoc
abstract mixin class $MediaViewCopyWith<$Res>  {
  factory $MediaViewCopyWith(MediaView value, $Res Function(MediaView) _then) = _$MediaViewCopyWithImpl;
@useResult
$Res call({
 String cover, String title, String error, bool hasError, bool isLoading, List<Tab> tabs, String thumbnail, List<Widget> views, List<MapEntry<String, Object>> items
});




}
/// @nodoc
class _$MediaViewCopyWithImpl<$Res>
    implements $MediaViewCopyWith<$Res> {
  _$MediaViewCopyWithImpl(this._self, this._then);

  final MediaView _self;
  final $Res Function(MediaView) _then;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cover = null,Object? title = null,Object? error = null,Object? hasError = null,Object? isLoading = null,Object? tabs = null,Object? thumbnail = null,Object? views = null,Object? items = null,}) {
  return _then(_self.copyWith(
cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tabs: null == tabs ? _self.tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<Tab>,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as List<Widget>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MapEntry<String, Object>>,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaView].
extension MediaViewPatterns on MediaView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaView value)  $default,){
final _that = this;
switch (_that) {
case _MediaView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaView value)?  $default,){
final _that = this;
switch (_that) {
case _MediaView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cover,  String title,  String error,  bool hasError,  bool isLoading,  List<Tab> tabs,  String thumbnail,  List<Widget> views,  List<MapEntry<String, Object>> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaView() when $default != null:
return $default(_that.cover,_that.title,_that.error,_that.hasError,_that.isLoading,_that.tabs,_that.thumbnail,_that.views,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cover,  String title,  String error,  bool hasError,  bool isLoading,  List<Tab> tabs,  String thumbnail,  List<Widget> views,  List<MapEntry<String, Object>> items)  $default,) {final _that = this;
switch (_that) {
case _MediaView():
return $default(_that.cover,_that.title,_that.error,_that.hasError,_that.isLoading,_that.tabs,_that.thumbnail,_that.views,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cover,  String title,  String error,  bool hasError,  bool isLoading,  List<Tab> tabs,  String thumbnail,  List<Widget> views,  List<MapEntry<String, Object>> items)?  $default,) {final _that = this;
switch (_that) {
case _MediaView() when $default != null:
return $default(_that.cover,_that.title,_that.error,_that.hasError,_that.isLoading,_that.tabs,_that.thumbnail,_that.views,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _MediaView implements MediaView {
  const _MediaView({this.cover = "", this.title = "", this.error = "", this.hasError = false, this.isLoading = false, final  List<Tab> tabs = const [], this.thumbnail = "", final  List<Widget> views = const [], final  List<MapEntry<String, Object>> items = const []}): _tabs = tabs,_views = views,_items = items;
  

@override@JsonKey() final  String cover;
@override@JsonKey() final  String title;
@override@JsonKey() final  String error;
@override@JsonKey() final  bool hasError;
@override@JsonKey() final  bool isLoading;
 final  List<Tab> _tabs;
@override@JsonKey() List<Tab> get tabs {
  if (_tabs is EqualUnmodifiableListView) return _tabs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tabs);
}

@override@JsonKey() final  String thumbnail;
 final  List<Widget> _views;
@override@JsonKey() List<Widget> get views {
  if (_views is EqualUnmodifiableListView) return _views;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_views);
}

 final  List<MapEntry<String, Object>> _items;
@override@JsonKey() List<MapEntry<String, Object>> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaViewCopyWith<_MediaView> get copyWith => __$MediaViewCopyWithImpl<_MediaView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaView&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.error, error) || other.error == error)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._tabs, _tabs)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other._views, _views)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,cover,title,error,hasError,isLoading,const DeepCollectionEquality().hash(_tabs),thumbnail,const DeepCollectionEquality().hash(_views),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MediaView(cover: $cover, title: $title, error: $error, hasError: $hasError, isLoading: $isLoading, tabs: $tabs, thumbnail: $thumbnail, views: $views, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MediaViewCopyWith<$Res> implements $MediaViewCopyWith<$Res> {
  factory _$MediaViewCopyWith(_MediaView value, $Res Function(_MediaView) _then) = __$MediaViewCopyWithImpl;
@override @useResult
$Res call({
 String cover, String title, String error, bool hasError, bool isLoading, List<Tab> tabs, String thumbnail, List<Widget> views, List<MapEntry<String, Object>> items
});




}
/// @nodoc
class __$MediaViewCopyWithImpl<$Res>
    implements _$MediaViewCopyWith<$Res> {
  __$MediaViewCopyWithImpl(this._self, this._then);

  final _MediaView _self;
  final $Res Function(_MediaView) _then;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cover = null,Object? title = null,Object? error = null,Object? hasError = null,Object? isLoading = null,Object? tabs = null,Object? thumbnail = null,Object? views = null,Object? items = null,}) {
  return _then(_MediaView(
cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tabs: null == tabs ? _self._tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<Tab>,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self._views : views // ignore: cast_nullable_to_non_nullable
as List<Widget>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MapEntry<String, Object>>,
  ));
}


}

// dart format on
