// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetCommentsProps {

 String get id; int get limit; int get page; String get type;
/// Create a copy of GetCommentsProps
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCommentsPropsCopyWith<GetCommentsProps> get copyWith => _$GetCommentsPropsCopyWithImpl<GetCommentsProps>(this as GetCommentsProps, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCommentsProps&&(identical(other.id, id) || other.id == id)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,limit,page,type);

@override
String toString() {
  return 'GetCommentsProps(id: $id, limit: $limit, page: $page, type: $type)';
}


}

/// @nodoc
abstract mixin class $GetCommentsPropsCopyWith<$Res>  {
  factory $GetCommentsPropsCopyWith(GetCommentsProps value, $Res Function(GetCommentsProps) _then) = _$GetCommentsPropsCopyWithImpl;
@useResult
$Res call({
 String id, int limit, int page, String type
});




}
/// @nodoc
class _$GetCommentsPropsCopyWithImpl<$Res>
    implements $GetCommentsPropsCopyWith<$Res> {
  _$GetCommentsPropsCopyWithImpl(this._self, this._then);

  final GetCommentsProps _self;
  final $Res Function(GetCommentsProps) _then;

/// Create a copy of GetCommentsProps
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


/// Adds pattern-matching-related methods to [GetCommentsProps].
extension GetCommentsPropsPatterns on GetCommentsProps {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetCommentsProps value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCommentsProps() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetCommentsProps value)  $default,){
final _that = this;
switch (_that) {
case _GetCommentsProps():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetCommentsProps value)?  $default,){
final _that = this;
switch (_that) {
case _GetCommentsProps() when $default != null:
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
case _GetCommentsProps() when $default != null:
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
case _GetCommentsProps():
return $default(_that.id,_that.limit,_that.page,_that.type);}
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
case _GetCommentsProps() when $default != null:
return $default(_that.id,_that.limit,_that.page,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _GetCommentsProps extends GetCommentsProps {
   _GetCommentsProps({required this.id, required this.limit, required this.page, required this.type}): super._();
  

@override final  String id;
@override final  int limit;
@override final  int page;
@override final  String type;

/// Create a copy of GetCommentsProps
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCommentsPropsCopyWith<_GetCommentsProps> get copyWith => __$GetCommentsPropsCopyWithImpl<_GetCommentsProps>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCommentsProps&&(identical(other.id, id) || other.id == id)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,limit,page,type);

@override
String toString() {
  return 'GetCommentsProps(id: $id, limit: $limit, page: $page, type: $type)';
}


}

/// @nodoc
abstract mixin class _$GetCommentsPropsCopyWith<$Res> implements $GetCommentsPropsCopyWith<$Res> {
  factory _$GetCommentsPropsCopyWith(_GetCommentsProps value, $Res Function(_GetCommentsProps) _then) = __$GetCommentsPropsCopyWithImpl;
@override @useResult
$Res call({
 String id, int limit, int page, String type
});




}
/// @nodoc
class __$GetCommentsPropsCopyWithImpl<$Res>
    implements _$GetCommentsPropsCopyWith<$Res> {
  __$GetCommentsPropsCopyWithImpl(this._self, this._then);

  final _GetCommentsProps _self;
  final $Res Function(_GetCommentsProps) _then;

/// Create a copy of GetCommentsProps
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? limit = null,Object? page = null,Object? type = null,}) {
  return _then(_GetCommentsProps(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
