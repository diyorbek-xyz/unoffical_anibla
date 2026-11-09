// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BooksQuery {

@JsonKey(name: "page") int get page;@JsonKey(name: "limit") int get limit;@JsonKey(name: "types") MediaType? get type;@JsonKey(name: "search") String? get search;@JsonKey(name: "sort_by") SortType? get sortBy;@JsonKey(name: "release_statuses") String? get releaseStatus;@JsonKey(name: "age_restrictions") String? get ageRestrictions;@JsonKey(name: "translation_statuses") String? get translationStatus;@JsonKey(name: "genre_ids")@CommaConverter() List<String>? get genreIds;@JsonKey(name: "category_ids")@CommaConverter() List<String>? get categoryIds; BooksQueryType? get queryType;
/// Create a copy of BooksQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooksQueryCopyWith<BooksQuery> get copyWith => _$BooksQueryCopyWithImpl<BooksQuery>(this as BooksQuery, _$identity);

  /// Serializes this BooksQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooksQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.type, type) || other.type == type)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.ageRestrictions, ageRestrictions) || other.ageRestrictions == ageRestrictions)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds)&&(identical(other.queryType, queryType) || other.queryType == queryType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,type,search,sortBy,releaseStatus,ageRestrictions,translationStatus,const DeepCollectionEquality().hash(genreIds),const DeepCollectionEquality().hash(categoryIds),queryType);

@override
String toString() {
  return 'BooksQuery(page: $page, limit: $limit, type: $type, search: $search, sortBy: $sortBy, releaseStatus: $releaseStatus, ageRestrictions: $ageRestrictions, translationStatus: $translationStatus, genreIds: $genreIds, categoryIds: $categoryIds, queryType: $queryType)';
}


}

/// @nodoc
abstract mixin class $BooksQueryCopyWith<$Res>  {
  factory $BooksQueryCopyWith(BooksQuery value, $Res Function(BooksQuery) _then) = _$BooksQueryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "page") int page,@JsonKey(name: "limit") int limit,@JsonKey(name: "types") MediaType? type,@JsonKey(name: "search") String? search,@JsonKey(name: "sort_by") SortType? sortBy,@JsonKey(name: "release_statuses") String? releaseStatus,@JsonKey(name: "age_restrictions") String? ageRestrictions,@JsonKey(name: "translation_statuses") String? translationStatus,@JsonKey(name: "genre_ids")@CommaConverter() List<String>? genreIds,@JsonKey(name: "category_ids")@CommaConverter() List<String>? categoryIds, BooksQueryType? queryType
});




}
/// @nodoc
class _$BooksQueryCopyWithImpl<$Res>
    implements $BooksQueryCopyWith<$Res> {
  _$BooksQueryCopyWithImpl(this._self, this._then);

  final BooksQuery _self;
  final $Res Function(BooksQuery) _then;

/// Create a copy of BooksQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? type = freezed,Object? search = freezed,Object? sortBy = freezed,Object? releaseStatus = freezed,Object? ageRestrictions = freezed,Object? translationStatus = freezed,Object? genreIds = freezed,Object? categoryIds = freezed,Object? queryType = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortType?,releaseStatus: freezed == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as String?,ageRestrictions: freezed == ageRestrictions ? _self.ageRestrictions : ageRestrictions // ignore: cast_nullable_to_non_nullable
as String?,translationStatus: freezed == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as String?,genreIds: freezed == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<String>?,categoryIds: freezed == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>?,queryType: freezed == queryType ? _self.queryType : queryType // ignore: cast_nullable_to_non_nullable
as BooksQueryType?,
  ));
}

}


/// Adds pattern-matching-related methods to [BooksQuery].
extension BooksQueryPatterns on BooksQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BooksQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BooksQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BooksQuery value)  $default,){
final _that = this;
switch (_that) {
case _BooksQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BooksQuery value)?  $default,){
final _that = this;
switch (_that) {
case _BooksQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "page")  int page, @JsonKey(name: "limit")  int limit, @JsonKey(name: "types")  MediaType? type, @JsonKey(name: "search")  String? search, @JsonKey(name: "sort_by")  SortType? sortBy, @JsonKey(name: "release_statuses")  String? releaseStatus, @JsonKey(name: "age_restrictions")  String? ageRestrictions, @JsonKey(name: "translation_statuses")  String? translationStatus, @JsonKey(name: "genre_ids")@CommaConverter()  List<String>? genreIds, @JsonKey(name: "category_ids")@CommaConverter()  List<String>? categoryIds,  BooksQueryType? queryType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BooksQuery() when $default != null:
return $default(_that.page,_that.limit,_that.type,_that.search,_that.sortBy,_that.releaseStatus,_that.ageRestrictions,_that.translationStatus,_that.genreIds,_that.categoryIds,_that.queryType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "page")  int page, @JsonKey(name: "limit")  int limit, @JsonKey(name: "types")  MediaType? type, @JsonKey(name: "search")  String? search, @JsonKey(name: "sort_by")  SortType? sortBy, @JsonKey(name: "release_statuses")  String? releaseStatus, @JsonKey(name: "age_restrictions")  String? ageRestrictions, @JsonKey(name: "translation_statuses")  String? translationStatus, @JsonKey(name: "genre_ids")@CommaConverter()  List<String>? genreIds, @JsonKey(name: "category_ids")@CommaConverter()  List<String>? categoryIds,  BooksQueryType? queryType)  $default,) {final _that = this;
switch (_that) {
case _BooksQuery():
return $default(_that.page,_that.limit,_that.type,_that.search,_that.sortBy,_that.releaseStatus,_that.ageRestrictions,_that.translationStatus,_that.genreIds,_that.categoryIds,_that.queryType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "page")  int page, @JsonKey(name: "limit")  int limit, @JsonKey(name: "types")  MediaType? type, @JsonKey(name: "search")  String? search, @JsonKey(name: "sort_by")  SortType? sortBy, @JsonKey(name: "release_statuses")  String? releaseStatus, @JsonKey(name: "age_restrictions")  String? ageRestrictions, @JsonKey(name: "translation_statuses")  String? translationStatus, @JsonKey(name: "genre_ids")@CommaConverter()  List<String>? genreIds, @JsonKey(name: "category_ids")@CommaConverter()  List<String>? categoryIds,  BooksQueryType? queryType)?  $default,) {final _that = this;
switch (_that) {
case _BooksQuery() when $default != null:
return $default(_that.page,_that.limit,_that.type,_that.search,_that.sortBy,_that.releaseStatus,_that.ageRestrictions,_that.translationStatus,_that.genreIds,_that.categoryIds,_that.queryType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BooksQuery extends BooksQuery {
  const _BooksQuery({@JsonKey(name: "page") this.page = 1, @JsonKey(name: "limit") this.limit = 20, @JsonKey(name: "types") this.type, @JsonKey(name: "search") this.search, @JsonKey(name: "sort_by") this.sortBy, @JsonKey(name: "release_statuses") this.releaseStatus, @JsonKey(name: "age_restrictions") this.ageRestrictions, @JsonKey(name: "translation_statuses") this.translationStatus, @JsonKey(name: "genre_ids")@CommaConverter() final  List<String>? genreIds, @JsonKey(name: "category_ids")@CommaConverter() final  List<String>? categoryIds, this.queryType}): _genreIds = genreIds,_categoryIds = categoryIds,super._();
  factory _BooksQuery.fromJson(Map<String, dynamic> json) => _$BooksQueryFromJson(json);

@override@JsonKey(name: "page") final  int page;
@override@JsonKey(name: "limit") final  int limit;
@override@JsonKey(name: "types") final  MediaType? type;
@override@JsonKey(name: "search") final  String? search;
@override@JsonKey(name: "sort_by") final  SortType? sortBy;
@override@JsonKey(name: "release_statuses") final  String? releaseStatus;
@override@JsonKey(name: "age_restrictions") final  String? ageRestrictions;
@override@JsonKey(name: "translation_statuses") final  String? translationStatus;
 final  List<String>? _genreIds;
@override@JsonKey(name: "genre_ids")@CommaConverter() List<String>? get genreIds {
  final value = _genreIds;
  if (value == null) return null;
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _categoryIds;
@override@JsonKey(name: "category_ids")@CommaConverter() List<String>? get categoryIds {
  final value = _categoryIds;
  if (value == null) return null;
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  BooksQueryType? queryType;

/// Create a copy of BooksQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BooksQueryCopyWith<_BooksQuery> get copyWith => __$BooksQueryCopyWithImpl<_BooksQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BooksQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BooksQuery&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.type, type) || other.type == type)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.ageRestrictions, ageRestrictions) || other.ageRestrictions == ageRestrictions)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds)&&(identical(other.queryType, queryType) || other.queryType == queryType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,type,search,sortBy,releaseStatus,ageRestrictions,translationStatus,const DeepCollectionEquality().hash(_genreIds),const DeepCollectionEquality().hash(_categoryIds),queryType);

@override
String toString() {
  return 'BooksQuery(page: $page, limit: $limit, type: $type, search: $search, sortBy: $sortBy, releaseStatus: $releaseStatus, ageRestrictions: $ageRestrictions, translationStatus: $translationStatus, genreIds: $genreIds, categoryIds: $categoryIds, queryType: $queryType)';
}


}

/// @nodoc
abstract mixin class _$BooksQueryCopyWith<$Res> implements $BooksQueryCopyWith<$Res> {
  factory _$BooksQueryCopyWith(_BooksQuery value, $Res Function(_BooksQuery) _then) = __$BooksQueryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "page") int page,@JsonKey(name: "limit") int limit,@JsonKey(name: "types") MediaType? type,@JsonKey(name: "search") String? search,@JsonKey(name: "sort_by") SortType? sortBy,@JsonKey(name: "release_statuses") String? releaseStatus,@JsonKey(name: "age_restrictions") String? ageRestrictions,@JsonKey(name: "translation_statuses") String? translationStatus,@JsonKey(name: "genre_ids")@CommaConverter() List<String>? genreIds,@JsonKey(name: "category_ids")@CommaConverter() List<String>? categoryIds, BooksQueryType? queryType
});




}
/// @nodoc
class __$BooksQueryCopyWithImpl<$Res>
    implements _$BooksQueryCopyWith<$Res> {
  __$BooksQueryCopyWithImpl(this._self, this._then);

  final _BooksQuery _self;
  final $Res Function(_BooksQuery) _then;

/// Create a copy of BooksQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? type = freezed,Object? search = freezed,Object? sortBy = freezed,Object? releaseStatus = freezed,Object? ageRestrictions = freezed,Object? translationStatus = freezed,Object? genreIds = freezed,Object? categoryIds = freezed,Object? queryType = freezed,}) {
  return _then(_BooksQuery(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortType?,releaseStatus: freezed == releaseStatus ? _self.releaseStatus : releaseStatus // ignore: cast_nullable_to_non_nullable
as String?,ageRestrictions: freezed == ageRestrictions ? _self.ageRestrictions : ageRestrictions // ignore: cast_nullable_to_non_nullable
as String?,translationStatus: freezed == translationStatus ? _self.translationStatus : translationStatus // ignore: cast_nullable_to_non_nullable
as String?,genreIds: freezed == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<String>?,categoryIds: freezed == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>?,queryType: freezed == queryType ? _self.queryType : queryType // ignore: cast_nullable_to_non_nullable
as BooksQueryType?,
  ));
}


}

// dart format on
