// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterRequest {

 int get page; int get limit; int get offset; String get search;@JsonKey(name: "order_dir") OrderDirection get order;
/// Create a copy of ChapterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterRequestCopyWith<ChapterRequest> get copyWith => _$ChapterRequestCopyWithImpl<ChapterRequest>(this as ChapterRequest, _$identity);

  /// Serializes this ChapterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterRequest&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.search, search) || other.search == search)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,offset,search,order);

@override
String toString() {
  return 'ChapterRequest(page: $page, limit: $limit, offset: $offset, search: $search, order: $order)';
}


}

/// @nodoc
abstract mixin class $ChapterRequestCopyWith<$Res>  {
  factory $ChapterRequestCopyWith(ChapterRequest value, $Res Function(ChapterRequest) _then) = _$ChapterRequestCopyWithImpl;
@useResult
$Res call({
 int page, int limit, int offset, String search,@JsonKey(name: "order_dir") OrderDirection order
});




}
/// @nodoc
class _$ChapterRequestCopyWithImpl<$Res>
    implements $ChapterRequestCopyWith<$Res> {
  _$ChapterRequestCopyWithImpl(this._self, this._then);

  final ChapterRequest _self;
  final $Res Function(ChapterRequest) _then;

/// Create a copy of ChapterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? offset = null,Object? search = null,Object? order = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDirection,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterRequest].
extension ChapterRequestPatterns on ChapterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChapterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  int offset,  String search, @JsonKey(name: "order_dir")  OrderDirection order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterRequest() when $default != null:
return $default(_that.page,_that.limit,_that.offset,_that.search,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  int offset,  String search, @JsonKey(name: "order_dir")  OrderDirection order)  $default,) {final _that = this;
switch (_that) {
case _ChapterRequest():
return $default(_that.page,_that.limit,_that.offset,_that.search,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  int offset,  String search, @JsonKey(name: "order_dir")  OrderDirection order)?  $default,) {final _that = this;
switch (_that) {
case _ChapterRequest() when $default != null:
return $default(_that.page,_that.limit,_that.offset,_that.search,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterRequest implements ChapterRequest {
  const _ChapterRequest({this.page = 1, this.limit = 10000, this.offset = 0, this.search = "", @JsonKey(name: "order_dir") this.order = OrderDirection.ascending});
  factory _ChapterRequest.fromJson(Map<String, dynamic> json) => _$ChapterRequestFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;
@override@JsonKey() final  String search;
@override@JsonKey(name: "order_dir") final  OrderDirection order;

/// Create a copy of ChapterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterRequestCopyWith<_ChapterRequest> get copyWith => __$ChapterRequestCopyWithImpl<_ChapterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterRequest&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.search, search) || other.search == search)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,offset,search,order);

@override
String toString() {
  return 'ChapterRequest(page: $page, limit: $limit, offset: $offset, search: $search, order: $order)';
}


}

/// @nodoc
abstract mixin class _$ChapterRequestCopyWith<$Res> implements $ChapterRequestCopyWith<$Res> {
  factory _$ChapterRequestCopyWith(_ChapterRequest value, $Res Function(_ChapterRequest) _then) = __$ChapterRequestCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, int offset, String search,@JsonKey(name: "order_dir") OrderDirection order
});




}
/// @nodoc
class __$ChapterRequestCopyWithImpl<$Res>
    implements _$ChapterRequestCopyWith<$Res> {
  __$ChapterRequestCopyWithImpl(this._self, this._then);

  final _ChapterRequest _self;
  final $Res Function(_ChapterRequest) _then;

/// Create a copy of ChapterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? offset = null,Object? search = null,Object? order = null,}) {
  return _then(_ChapterRequest(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderDirection,
  ));
}


}

// dart format on
