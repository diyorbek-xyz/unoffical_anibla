// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnimeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnimeEvent()';
}


}

/// @nodoc
class $AnimeEventCopyWith<$Res>  {
$AnimeEventCopyWith(AnimeEvent _, $Res Function(AnimeEvent) __);
}


/// Adds pattern-matching-related methods to [AnimeEvent].
extension AnimeEventPatterns on AnimeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetSingle value)?  getSingle,TResult Function( _GetHome value)?  getHome,TResult Function( _GetMore value)?  getMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSingle() when getSingle != null:
return getSingle(_that);case _GetHome() when getHome != null:
return getHome(_that);case _GetMore() when getMore != null:
return getMore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetSingle value)  getSingle,required TResult Function( _GetHome value)  getHome,required TResult Function( _GetMore value)  getMore,}){
final _that = this;
switch (_that) {
case _GetSingle():
return getSingle(_that);case _GetHome():
return getHome(_that);case _GetMore():
return getMore(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetSingle value)?  getSingle,TResult? Function( _GetHome value)?  getHome,TResult? Function( _GetMore value)?  getMore,}){
final _that = this;
switch (_that) {
case _GetSingle() when getSingle != null:
return getSingle(_that);case _GetHome() when getHome != null:
return getHome(_that);case _GetMore() when getMore != null:
return getMore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String slug,  String type)?  getSingle,TResult Function( Paginator paginator)?  getHome,TResult Function()?  getMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetSingle() when getSingle != null:
return getSingle(_that.slug,_that.type);case _GetHome() when getHome != null:
return getHome(_that.paginator);case _GetMore() when getMore != null:
return getMore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String slug,  String type)  getSingle,required TResult Function( Paginator paginator)  getHome,required TResult Function()  getMore,}) {final _that = this;
switch (_that) {
case _GetSingle():
return getSingle(_that.slug,_that.type);case _GetHome():
return getHome(_that.paginator);case _GetMore():
return getMore();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String slug,  String type)?  getSingle,TResult? Function( Paginator paginator)?  getHome,TResult? Function()?  getMore,}) {final _that = this;
switch (_that) {
case _GetSingle() when getSingle != null:
return getSingle(_that.slug,_that.type);case _GetHome() when getHome != null:
return getHome(_that.paginator);case _GetMore() when getMore != null:
return getMore();case _:
  return null;

}
}

}

/// @nodoc


class _GetSingle implements AnimeEvent {
   _GetSingle({required this.slug, required this.type});
  

 final  String slug;
 final  String type;

/// Create a copy of AnimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSingleCopyWith<_GetSingle> get copyWith => __$GetSingleCopyWithImpl<_GetSingle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSingle&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,slug,type);

@override
String toString() {
  return 'AnimeEvent.getSingle(slug: $slug, type: $type)';
}


}

/// @nodoc
abstract mixin class _$GetSingleCopyWith<$Res> implements $AnimeEventCopyWith<$Res> {
  factory _$GetSingleCopyWith(_GetSingle value, $Res Function(_GetSingle) _then) = __$GetSingleCopyWithImpl;
@useResult
$Res call({
 String slug, String type
});




}
/// @nodoc
class __$GetSingleCopyWithImpl<$Res>
    implements _$GetSingleCopyWith<$Res> {
  __$GetSingleCopyWithImpl(this._self, this._then);

  final _GetSingle _self;
  final $Res Function(_GetSingle) _then;

/// Create a copy of AnimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? type = null,}) {
  return _then(_GetSingle(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetHome implements AnimeEvent {
   _GetHome(this.paginator);
  

 final  Paginator paginator;

/// Create a copy of AnimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHomeCopyWith<_GetHome> get copyWith => __$GetHomeCopyWithImpl<_GetHome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHome&&(identical(other.paginator, paginator) || other.paginator == paginator));
}


@override
int get hashCode => Object.hash(runtimeType,paginator);

@override
String toString() {
  return 'AnimeEvent.getHome(paginator: $paginator)';
}


}

/// @nodoc
abstract mixin class _$GetHomeCopyWith<$Res> implements $AnimeEventCopyWith<$Res> {
  factory _$GetHomeCopyWith(_GetHome value, $Res Function(_GetHome) _then) = __$GetHomeCopyWithImpl;
@useResult
$Res call({
 Paginator paginator
});


$PaginatorCopyWith<$Res> get paginator;

}
/// @nodoc
class __$GetHomeCopyWithImpl<$Res>
    implements _$GetHomeCopyWith<$Res> {
  __$GetHomeCopyWithImpl(this._self, this._then);

  final _GetHome _self;
  final $Res Function(_GetHome) _then;

/// Create a copy of AnimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paginator = null,}) {
  return _then(_GetHome(
null == paginator ? _self.paginator : paginator // ignore: cast_nullable_to_non_nullable
as Paginator,
  ));
}

/// Create a copy of AnimeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatorCopyWith<$Res> get paginator {
  
  return $PaginatorCopyWith<$Res>(_self.paginator, (value) {
    return _then(_self.copyWith(paginator: value));
  });
}
}

/// @nodoc


class _GetMore implements AnimeEvent {
   _GetMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnimeEvent.getMore()';
}


}




// dart format on
