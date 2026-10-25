// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'novel_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NovelRequest {

@JsonKey(name: "page") int get page;@JsonKey(name: "limit") int get limit;@JsonKey(name: "types") MediaType? get type;@JsonKey(name: "search") String? get search;@JsonKey(name: "sort_by") SortType? get sortBy;@JsonKey(name: "release_statuses") String? get releaseStatus;@JsonKey(name: "age_restrictions") String? get ageRestrictions;@JsonKey(name: "translation_statuses") String? get translationStatus;@JsonKey(name: "genre_ids")@ListConverter() List<String>? get genreIds;@JsonKey(name: "category_ids")@ListConverter() List<String>? get categoryIds;
/// Create a copy of NovelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NovelRequestCopyWith<NovelRequest> get copyWith => _$NovelRequestCopyWithImpl<NovelRequest>(this as NovelRequest, _$identity);

  /// Serializes this NovelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NovelRequest&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.type, type) || other.type == type)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.ageRestrictions, ageRestrictions) || other.ageRestrictions == ageRestrictions)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,type,search,sortBy,releaseStatus,ageRestrictions,translationStatus,const DeepCollectionEquality().hash(genreIds),const DeepCollectionEquality().hash(categoryIds));

@override
String toString() {
  return 'NovelRequest(page: $page, limit: $limit, type: $type, search: $search, sortBy: $sortBy, releaseStatus: $releaseStatus, ageRestrictions: $ageRestrictions, translationStatus: $translationStatus, genreIds: $genreIds, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class $NovelRequestCopyWith<$Res>  {
  factory $NovelRequestCopyWith(NovelRequest value, $Res Function(NovelRequest) _then) = _$NovelRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "page") int page,@JsonKey(name: "limit") int limit,@JsonKey(name: "types") MediaType? type,@JsonKey(name: "search") String? search,@JsonKey(name: "sort_by") SortType? sortBy,@JsonKey(name: "release_statuses") String? releaseStatus,@JsonKey(name: "age_restrictions") String? ageRestrictions,@JsonKey(name: "translation_statuses") String? translationStatus,@JsonKey(name: "genre_ids")@ListConverter() List<String>? genreIds,@JsonKey(name: "category_ids")@ListConverter() List<String>? categoryIds
});




}
/// @nodoc
class _$NovelRequestCopyWithImpl<$Res>
    implements $NovelRequestCopyWith<$Res> {
  _$NovelRequestCopyWithImpl(this._self, this._then);

  final NovelRequest _self;
  final $Res Function(NovelRequest) _then;

/// Create a copy of NovelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? type = freezed,Object? search = freezed,Object? sortBy = freezed,Object? releaseStatus = freezed,Object? ageRestrictions = freezed,Object? translationStatus = freezed,Object? genreIds = freezed,Object? categoryIds = freezed,}) {
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
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [NovelRequest].
extension NovelRequestPatterns on NovelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NovelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NovelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NovelRequest value)  $default,){
final _that = this;
switch (_that) {
case _NovelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NovelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NovelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "page")  int page, @JsonKey(name: "limit")  int limit, @JsonKey(name: "types")  MediaType? type, @JsonKey(name: "search")  String? search, @JsonKey(name: "sort_by")  SortType? sortBy, @JsonKey(name: "release_statuses")  String? releaseStatus, @JsonKey(name: "age_restrictions")  String? ageRestrictions, @JsonKey(name: "translation_statuses")  String? translationStatus, @JsonKey(name: "genre_ids")@ListConverter()  List<String>? genreIds, @JsonKey(name: "category_ids")@ListConverter()  List<String>? categoryIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NovelRequest() when $default != null:
return $default(_that.page,_that.limit,_that.type,_that.search,_that.sortBy,_that.releaseStatus,_that.ageRestrictions,_that.translationStatus,_that.genreIds,_that.categoryIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "page")  int page, @JsonKey(name: "limit")  int limit, @JsonKey(name: "types")  MediaType? type, @JsonKey(name: "search")  String? search, @JsonKey(name: "sort_by")  SortType? sortBy, @JsonKey(name: "release_statuses")  String? releaseStatus, @JsonKey(name: "age_restrictions")  String? ageRestrictions, @JsonKey(name: "translation_statuses")  String? translationStatus, @JsonKey(name: "genre_ids")@ListConverter()  List<String>? genreIds, @JsonKey(name: "category_ids")@ListConverter()  List<String>? categoryIds)  $default,) {final _that = this;
switch (_that) {
case _NovelRequest():
return $default(_that.page,_that.limit,_that.type,_that.search,_that.sortBy,_that.releaseStatus,_that.ageRestrictions,_that.translationStatus,_that.genreIds,_that.categoryIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "page")  int page, @JsonKey(name: "limit")  int limit, @JsonKey(name: "types")  MediaType? type, @JsonKey(name: "search")  String? search, @JsonKey(name: "sort_by")  SortType? sortBy, @JsonKey(name: "release_statuses")  String? releaseStatus, @JsonKey(name: "age_restrictions")  String? ageRestrictions, @JsonKey(name: "translation_statuses")  String? translationStatus, @JsonKey(name: "genre_ids")@ListConverter()  List<String>? genreIds, @JsonKey(name: "category_ids")@ListConverter()  List<String>? categoryIds)?  $default,) {final _that = this;
switch (_that) {
case _NovelRequest() when $default != null:
return $default(_that.page,_that.limit,_that.type,_that.search,_that.sortBy,_that.releaseStatus,_that.ageRestrictions,_that.translationStatus,_that.genreIds,_that.categoryIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NovelRequest implements NovelRequest {
  const _NovelRequest({@JsonKey(name: "page") this.page = 1, @JsonKey(name: "limit") this.limit = 20, @JsonKey(name: "types") this.type, @JsonKey(name: "search") this.search, @JsonKey(name: "sort_by") this.sortBy, @JsonKey(name: "release_statuses") this.releaseStatus, @JsonKey(name: "age_restrictions") this.ageRestrictions, @JsonKey(name: "translation_statuses") this.translationStatus, @JsonKey(name: "genre_ids")@ListConverter() final  List<String>? genreIds, @JsonKey(name: "category_ids")@ListConverter() final  List<String>? categoryIds}): _genreIds = genreIds,_categoryIds = categoryIds;
  factory _NovelRequest.fromJson(Map<String, dynamic> json) => _$NovelRequestFromJson(json);

@override@JsonKey(name: "page") final  int page;
@override@JsonKey(name: "limit") final  int limit;
@override@JsonKey(name: "types") final  MediaType? type;
@override@JsonKey(name: "search") final  String? search;
@override@JsonKey(name: "sort_by") final  SortType? sortBy;
@override@JsonKey(name: "release_statuses") final  String? releaseStatus;
@override@JsonKey(name: "age_restrictions") final  String? ageRestrictions;
@override@JsonKey(name: "translation_statuses") final  String? translationStatus;
 final  List<String>? _genreIds;
@override@JsonKey(name: "genre_ids")@ListConverter() List<String>? get genreIds {
  final value = _genreIds;
  if (value == null) return null;
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _categoryIds;
@override@JsonKey(name: "category_ids")@ListConverter() List<String>? get categoryIds {
  final value = _categoryIds;
  if (value == null) return null;
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of NovelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NovelRequestCopyWith<_NovelRequest> get copyWith => __$NovelRequestCopyWithImpl<_NovelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NovelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NovelRequest&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.type, type) || other.type == type)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.releaseStatus, releaseStatus) || other.releaseStatus == releaseStatus)&&(identical(other.ageRestrictions, ageRestrictions) || other.ageRestrictions == ageRestrictions)&&(identical(other.translationStatus, translationStatus) || other.translationStatus == translationStatus)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,type,search,sortBy,releaseStatus,ageRestrictions,translationStatus,const DeepCollectionEquality().hash(_genreIds),const DeepCollectionEquality().hash(_categoryIds));

@override
String toString() {
  return 'NovelRequest(page: $page, limit: $limit, type: $type, search: $search, sortBy: $sortBy, releaseStatus: $releaseStatus, ageRestrictions: $ageRestrictions, translationStatus: $translationStatus, genreIds: $genreIds, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class _$NovelRequestCopyWith<$Res> implements $NovelRequestCopyWith<$Res> {
  factory _$NovelRequestCopyWith(_NovelRequest value, $Res Function(_NovelRequest) _then) = __$NovelRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "page") int page,@JsonKey(name: "limit") int limit,@JsonKey(name: "types") MediaType? type,@JsonKey(name: "search") String? search,@JsonKey(name: "sort_by") SortType? sortBy,@JsonKey(name: "release_statuses") String? releaseStatus,@JsonKey(name: "age_restrictions") String? ageRestrictions,@JsonKey(name: "translation_statuses") String? translationStatus,@JsonKey(name: "genre_ids")@ListConverter() List<String>? genreIds,@JsonKey(name: "category_ids")@ListConverter() List<String>? categoryIds
});




}
/// @nodoc
class __$NovelRequestCopyWithImpl<$Res>
    implements _$NovelRequestCopyWith<$Res> {
  __$NovelRequestCopyWithImpl(this._self, this._then);

  final _NovelRequest _self;
  final $Res Function(_NovelRequest) _then;

/// Create a copy of NovelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? type = freezed,Object? search = freezed,Object? sortBy = freezed,Object? releaseStatus = freezed,Object? ageRestrictions = freezed,Object? translationStatus = freezed,Object? genreIds = freezed,Object? categoryIds = freezed,}) {
  return _then(_NovelRequest(
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
as List<String>?,
  ));
}


}

// dart format on
