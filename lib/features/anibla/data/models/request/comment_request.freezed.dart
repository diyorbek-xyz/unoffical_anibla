// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetCommentRequest {

 String get id; int get limit; int get page; String get type;
/// Create a copy of GetCommentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCommentRequestCopyWith<GetCommentRequest> get copyWith => _$GetCommentRequestCopyWithImpl<GetCommentRequest>(this as GetCommentRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCommentRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,limit,page,type);

@override
String toString() {
  return 'GetCommentRequest(id: $id, limit: $limit, page: $page, type: $type)';
}


}

/// @nodoc
abstract mixin class $GetCommentRequestCopyWith<$Res>  {
  factory $GetCommentRequestCopyWith(GetCommentRequest value, $Res Function(GetCommentRequest) _then) = _$GetCommentRequestCopyWithImpl;
@useResult
$Res call({
 String id, int limit, int page, String type
});




}
/// @nodoc
class _$GetCommentRequestCopyWithImpl<$Res>
    implements $GetCommentRequestCopyWith<$Res> {
  _$GetCommentRequestCopyWithImpl(this._self, this._then);

  final GetCommentRequest _self;
  final $Res Function(GetCommentRequest) _then;

/// Create a copy of GetCommentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? limit = null,Object? page = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetCommentRequest].
extension GetCommentRequestPatterns on GetCommentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetCommentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCommentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetCommentRequest value)  $default,){
final _that = this;
switch (_that) {
case _GetCommentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetCommentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GetCommentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int limit,  int page,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetCommentRequest() when $default != null:
return $default(_that.id,_that.limit,_that.page,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int limit,  int page,  String type)  $default,) {final _that = this;
switch (_that) {
case _GetCommentRequest():
return $default(_that.id,_that.limit,_that.page,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int limit,  int page,  String type)?  $default,) {final _that = this;
switch (_that) {
case _GetCommentRequest() when $default != null:
return $default(_that.id,_that.limit,_that.page,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _GetCommentRequest extends GetCommentRequest {
  const _GetCommentRequest({required this.id, required this.limit, required this.page, required this.type}): super._();
  

@override final  String id;
@override final  int limit;
@override final  int page;
@override final  String type;

/// Create a copy of GetCommentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCommentRequestCopyWith<_GetCommentRequest> get copyWith => __$GetCommentRequestCopyWithImpl<_GetCommentRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCommentRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,limit,page,type);

@override
String toString() {
  return 'GetCommentRequest(id: $id, limit: $limit, page: $page, type: $type)';
}


}

/// @nodoc
abstract mixin class _$GetCommentRequestCopyWith<$Res> implements $GetCommentRequestCopyWith<$Res> {
  factory _$GetCommentRequestCopyWith(_GetCommentRequest value, $Res Function(_GetCommentRequest) _then) = __$GetCommentRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, int limit, int page, String type
});




}
/// @nodoc
class __$GetCommentRequestCopyWithImpl<$Res>
    implements _$GetCommentRequestCopyWith<$Res> {
  __$GetCommentRequestCopyWithImpl(this._self, this._then);

  final _GetCommentRequest _self;
  final $Res Function(_GetCommentRequest) _then;

/// Create a copy of GetCommentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? limit = null,Object? page = null,Object? type = null,}) {
  return _then(_GetCommentRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$GetComRepliesRequest {

 int get limit; int get page; String get id;
/// Create a copy of GetComRepliesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetComRepliesRequestCopyWith<GetComRepliesRequest> get copyWith => _$GetComRepliesRequestCopyWithImpl<GetComRepliesRequest>(this as GetComRepliesRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetComRepliesRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,limit,page,id);

@override
String toString() {
  return 'GetComRepliesRequest(limit: $limit, page: $page, id: $id)';
}


}

/// @nodoc
abstract mixin class $GetComRepliesRequestCopyWith<$Res>  {
  factory $GetComRepliesRequestCopyWith(GetComRepliesRequest value, $Res Function(GetComRepliesRequest) _then) = _$GetComRepliesRequestCopyWithImpl;
@useResult
$Res call({
 int limit, int page, String id
});




}
/// @nodoc
class _$GetComRepliesRequestCopyWithImpl<$Res>
    implements $GetComRepliesRequestCopyWith<$Res> {
  _$GetComRepliesRequestCopyWithImpl(this._self, this._then);

  final GetComRepliesRequest _self;
  final $Res Function(GetComRepliesRequest) _then;

/// Create a copy of GetComRepliesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,Object? id = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetComRepliesRequest].
extension GetComRepliesRequestPatterns on GetComRepliesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetComRepliesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetComRepliesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetComRepliesRequest value)  $default,){
final _that = this;
switch (_that) {
case _GetComRepliesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetComRepliesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GetComRepliesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetComRepliesRequest() when $default != null:
return $default(_that.limit,_that.page,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page,  String id)  $default,) {final _that = this;
switch (_that) {
case _GetComRepliesRequest():
return $default(_that.limit,_that.page,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page,  String id)?  $default,) {final _that = this;
switch (_that) {
case _GetComRepliesRequest() when $default != null:
return $default(_that.limit,_that.page,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _GetComRepliesRequest implements GetComRepliesRequest {
  const _GetComRepliesRequest({this.limit = 0, this.page = 0, this.id = ""});
  

@override@JsonKey() final  int limit;
@override@JsonKey() final  int page;
@override@JsonKey() final  String id;

/// Create a copy of GetComRepliesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetComRepliesRequestCopyWith<_GetComRepliesRequest> get copyWith => __$GetComRepliesRequestCopyWithImpl<_GetComRepliesRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetComRepliesRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,limit,page,id);

@override
String toString() {
  return 'GetComRepliesRequest(limit: $limit, page: $page, id: $id)';
}


}

/// @nodoc
abstract mixin class _$GetComRepliesRequestCopyWith<$Res> implements $GetComRepliesRequestCopyWith<$Res> {
  factory _$GetComRepliesRequestCopyWith(_GetComRepliesRequest value, $Res Function(_GetComRepliesRequest) _then) = __$GetComRepliesRequestCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page, String id
});




}
/// @nodoc
class __$GetComRepliesRequestCopyWithImpl<$Res>
    implements _$GetComRepliesRequestCopyWith<$Res> {
  __$GetComRepliesRequestCopyWithImpl(this._self, this._then);

  final _GetComRepliesRequest _self;
  final $Res Function(_GetComRepliesRequest) _then;

/// Create a copy of GetComRepliesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? id = null,}) {
  return _then(_GetComRepliesRequest(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
