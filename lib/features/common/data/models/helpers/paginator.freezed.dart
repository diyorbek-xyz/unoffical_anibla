// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Paginator {

 int get limit; int get page;
/// Create a copy of Paginator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatorCopyWith<Paginator> get copyWith => _$PaginatorCopyWithImpl<Paginator>(this as Paginator, _$identity);

  /// Serializes this Paginator to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paginator&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page);

@override
String toString() {
  return 'Paginator(limit: $limit, page: $page)';
}


}

/// @nodoc
abstract mixin class $PaginatorCopyWith<$Res>  {
  factory $PaginatorCopyWith(Paginator value, $Res Function(Paginator) _then) = _$PaginatorCopyWithImpl;
@useResult
$Res call({
 int limit, int page
});




}
/// @nodoc
class _$PaginatorCopyWithImpl<$Res>
    implements $PaginatorCopyWith<$Res> {
  _$PaginatorCopyWithImpl(this._self, this._then);

  final Paginator _self;
  final $Res Function(Paginator) _then;

/// Create a copy of Paginator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Paginator].
extension PaginatorPatterns on Paginator {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Paginator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Paginator() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Paginator value)  $default,){
final _that = this;
switch (_that) {
case _Paginator():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Paginator value)?  $default,){
final _that = this;
switch (_that) {
case _Paginator() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Paginator() when $default != null:
return $default(_that.limit,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page)  $default,) {final _that = this;
switch (_that) {
case _Paginator():
return $default(_that.limit,_that.page);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page)?  $default,) {final _that = this;
switch (_that) {
case _Paginator() when $default != null:
return $default(_that.limit,_that.page);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _Paginator implements Paginator {
   _Paginator({required this.limit, required this.page});
  

@override final  int limit;
@override final  int page;

/// Create a copy of Paginator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatorCopyWith<_Paginator> get copyWith => __$PaginatorCopyWithImpl<_Paginator>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paginator&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page);

@override
String toString() {
  return 'Paginator(limit: $limit, page: $page)';
}


}

/// @nodoc
abstract mixin class _$PaginatorCopyWith<$Res> implements $PaginatorCopyWith<$Res> {
  factory _$PaginatorCopyWith(_Paginator value, $Res Function(_Paginator) _then) = __$PaginatorCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page
});




}
/// @nodoc
class __$PaginatorCopyWithImpl<$Res>
    implements _$PaginatorCopyWith<$Res> {
  __$PaginatorCopyWithImpl(this._self, this._then);

  final _Paginator _self;
  final $Res Function(_Paginator) _then;

/// Create a copy of Paginator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,}) {
  return _then(_Paginator(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
