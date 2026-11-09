// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animes_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimesQuery {

 int get page; int get limit; String? get search; AnimesQueryType get type;@CommaConverter() List<String>? get genres;@CommaConverter() List<String>? get categories;
/// Create a copy of AnimesQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimesQueryCopyWith<AnimesQuery> get copyWith => _$AnimesQueryCopyWithImpl<AnimesQuery>(this as AnimesQuery, _$identity);

  /// Serializes this AnimesQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimesQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.search, search) || other.search == search)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,search,type,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'AnimesQuery(page: $page, limit: $limit, search: $search, type: $type, genres: $genres, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $AnimesQueryCopyWith<$Res>  {
  factory $AnimesQueryCopyWith(AnimesQuery value, $Res Function(AnimesQuery) _then) = _$AnimesQueryCopyWithImpl;
@useResult
$Res call({
 int page, int limit, String? search, AnimesQueryType type,@CommaConverter() List<String>? genres,@CommaConverter() List<String>? categories
});




}
/// @nodoc
class _$AnimesQueryCopyWithImpl<$Res>
    implements $AnimesQueryCopyWith<$Res> {
  _$AnimesQueryCopyWithImpl(this._self, this._then);

  final AnimesQuery _self;
  final $Res Function(AnimesQuery) _then;

/// Create a copy of AnimesQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? search = freezed,Object? type = null,Object? genres = freezed,Object? categories = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimesQueryType,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimesQuery].
extension AnimesQueryPatterns on AnimesQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimesQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimesQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimesQuery value)  $default,){
final _that = this;
switch (_that) {
case _AnimesQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimesQuery value)?  $default,){
final _that = this;
switch (_that) {
case _AnimesQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  String? search,  AnimesQueryType type, @CommaConverter()  List<String>? genres, @CommaConverter()  List<String>? categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimesQuery() when $default != null:
return $default(_that.page,_that.limit,_that.search,_that.type,_that.genres,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  String? search,  AnimesQueryType type, @CommaConverter()  List<String>? genres, @CommaConverter()  List<String>? categories)  $default,) {final _that = this;
switch (_that) {
case _AnimesQuery():
return $default(_that.page,_that.limit,_that.search,_that.type,_that.genres,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  String? search,  AnimesQueryType type, @CommaConverter()  List<String>? genres, @CommaConverter()  List<String>? categories)?  $default,) {final _that = this;
switch (_that) {
case _AnimesQuery() when $default != null:
return $default(_that.page,_that.limit,_that.search,_that.type,_that.genres,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimesQuery extends AnimesQuery {
  const _AnimesQuery({this.page = 1, this.limit = 0, this.search, this.type = AnimesQueryType.media, @CommaConverter() final  List<String>? genres, @CommaConverter() final  List<String>? categories}): _genres = genres,_categories = categories,super._();
  factory _AnimesQuery.fromJson(Map<String, dynamic> json) => _$AnimesQueryFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override final  String? search;
@override@JsonKey() final  AnimesQueryType type;
 final  List<String>? _genres;
@override@CommaConverter() List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _categories;
@override@CommaConverter() List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AnimesQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimesQueryCopyWith<_AnimesQuery> get copyWith => __$AnimesQueryCopyWithImpl<_AnimesQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimesQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimesQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.search, search) || other.search == search)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,search,type,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'AnimesQuery(page: $page, limit: $limit, search: $search, type: $type, genres: $genres, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$AnimesQueryCopyWith<$Res> implements $AnimesQueryCopyWith<$Res> {
  factory _$AnimesQueryCopyWith(_AnimesQuery value, $Res Function(_AnimesQuery) _then) = __$AnimesQueryCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, String? search, AnimesQueryType type,@CommaConverter() List<String>? genres,@CommaConverter() List<String>? categories
});




}
/// @nodoc
class __$AnimesQueryCopyWithImpl<$Res>
    implements _$AnimesQueryCopyWith<$Res> {
  __$AnimesQueryCopyWithImpl(this._self, this._then);

  final _AnimesQuery _self;
  final $Res Function(_AnimesQuery) _then;

/// Create a copy of AnimesQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? search = freezed,Object? type = null,Object? genres = freezed,Object? categories = freezed,}) {
  return _then(_AnimesQuery(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimesQueryType,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
