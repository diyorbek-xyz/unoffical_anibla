// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesReponse {

 List<Category> get categories; Pagination get pagination;
/// Create a copy of CategoriesReponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesReponseCopyWith<CategoriesReponse> get copyWith => _$CategoriesReponseCopyWithImpl<CategoriesReponse>(this as CategoriesReponse, _$identity);

  /// Serializes this CategoriesReponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesReponse&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),pagination);

@override
String toString() {
  return 'CategoriesReponse(categories: $categories, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $CategoriesReponseCopyWith<$Res>  {
  factory $CategoriesReponseCopyWith(CategoriesReponse value, $Res Function(CategoriesReponse) _then) = _$CategoriesReponseCopyWithImpl;
@useResult
$Res call({
 List<Category> categories, Pagination pagination
});


$PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$CategoriesReponseCopyWithImpl<$Res>
    implements $CategoriesReponseCopyWith<$Res> {
  _$CategoriesReponseCopyWithImpl(this._self, this._then);

  final CategoriesReponse _self;
  final $Res Function(CategoriesReponse) _then;

/// Create a copy of CategoriesReponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}
/// Create a copy of CategoriesReponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoriesReponse].
extension CategoriesReponsePatterns on CategoriesReponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesReponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesReponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesReponse value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesReponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesReponse value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesReponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Category> categories,  Pagination pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesReponse() when $default != null:
return $default(_that.categories,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Category> categories,  Pagination pagination)  $default,) {final _that = this;
switch (_that) {
case _CategoriesReponse():
return $default(_that.categories,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Category> categories,  Pagination pagination)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesReponse() when $default != null:
return $default(_that.categories,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriesReponse implements CategoriesReponse {
  const _CategoriesReponse({final  List<Category> categories = const [], this.pagination = const Pagination()}): _categories = categories;
  factory _CategoriesReponse.fromJson(Map<String, dynamic> json) => _$CategoriesReponseFromJson(json);

 final  List<Category> _categories;
@override@JsonKey() List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  Pagination pagination;

/// Create a copy of CategoriesReponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesReponseCopyWith<_CategoriesReponse> get copyWith => __$CategoriesReponseCopyWithImpl<_CategoriesReponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesReponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesReponse&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),pagination);

@override
String toString() {
  return 'CategoriesReponse(categories: $categories, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$CategoriesReponseCopyWith<$Res> implements $CategoriesReponseCopyWith<$Res> {
  factory _$CategoriesReponseCopyWith(_CategoriesReponse value, $Res Function(_CategoriesReponse) _then) = __$CategoriesReponseCopyWithImpl;
@override @useResult
$Res call({
 List<Category> categories, Pagination pagination
});


@override $PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$CategoriesReponseCopyWithImpl<$Res>
    implements _$CategoriesReponseCopyWith<$Res> {
  __$CategoriesReponseCopyWithImpl(this._self, this._then);

  final _CategoriesReponse _self;
  final $Res Function(_CategoriesReponse) _then;

/// Create a copy of CategoriesReponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? pagination = null,}) {
  return _then(_CategoriesReponse(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}

/// Create a copy of CategoriesReponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
