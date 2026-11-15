// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeasonView {

 String get id; String get slug; int get offset; Localized get title;
/// Create a copy of SeasonView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonViewCopyWith<SeasonView> get copyWith => _$SeasonViewCopyWithImpl<SeasonView>(this as SeasonView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,slug,offset,title);

@override
String toString() {
  return 'SeasonView(id: $id, slug: $slug, offset: $offset, title: $title)';
}


}

/// @nodoc
abstract mixin class $SeasonViewCopyWith<$Res>  {
  factory $SeasonViewCopyWith(SeasonView value, $Res Function(SeasonView) _then) = _$SeasonViewCopyWithImpl;
@useResult
$Res call({
 String id, String slug, int offset, Localized title
});


$LocalizedCopyWith<$Res> get title;

}
/// @nodoc
class _$SeasonViewCopyWithImpl<$Res>
    implements $SeasonViewCopyWith<$Res> {
  _$SeasonViewCopyWithImpl(this._self, this._then);

  final SeasonView _self;
  final $Res Function(SeasonView) _then;

/// Create a copy of SeasonView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? offset = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Localized,
  ));
}
/// Create a copy of SeasonView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get title {
  
  return $LocalizedCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeasonView].
extension SeasonViewPatterns on SeasonView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonView value)  $default,){
final _that = this;
switch (_that) {
case _SeasonView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonView value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  int offset,  Localized title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonView() when $default != null:
return $default(_that.id,_that.slug,_that.offset,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  int offset,  Localized title)  $default,) {final _that = this;
switch (_that) {
case _SeasonView():
return $default(_that.id,_that.slug,_that.offset,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  int offset,  Localized title)?  $default,) {final _that = this;
switch (_that) {
case _SeasonView() when $default != null:
return $default(_that.id,_that.slug,_that.offset,_that.title);case _:
  return null;

}
}

}

/// @nodoc


class _SeasonView implements SeasonView {
  const _SeasonView({this.id = "", this.slug = "", this.offset = 1, this.title = const Localized()});
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String slug;
@override@JsonKey() final  int offset;
@override@JsonKey() final  Localized title;

/// Create a copy of SeasonView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonViewCopyWith<_SeasonView> get copyWith => __$SeasonViewCopyWithImpl<_SeasonView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,slug,offset,title);

@override
String toString() {
  return 'SeasonView(id: $id, slug: $slug, offset: $offset, title: $title)';
}


}

/// @nodoc
abstract mixin class _$SeasonViewCopyWith<$Res> implements $SeasonViewCopyWith<$Res> {
  factory _$SeasonViewCopyWith(_SeasonView value, $Res Function(_SeasonView) _then) = __$SeasonViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, int offset, Localized title
});


@override $LocalizedCopyWith<$Res> get title;

}
/// @nodoc
class __$SeasonViewCopyWithImpl<$Res>
    implements _$SeasonViewCopyWith<$Res> {
  __$SeasonViewCopyWithImpl(this._self, this._then);

  final _SeasonView _self;
  final $Res Function(_SeasonView) _then;

/// Create a copy of SeasonView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? offset = null,Object? title = null,}) {
  return _then(_SeasonView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Localized,
  ));
}

/// Create a copy of SeasonView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get title {
  
  return $LocalizedCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}

// dart format on
