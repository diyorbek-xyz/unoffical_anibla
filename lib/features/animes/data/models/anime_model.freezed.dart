// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeModel {

@HiveField(15) int? get age;@HiveField(2) dynamic get uz;@HiveField(20) dynamic get ru;@HiveField(3) String? get slug;@HiveField(0) List? get keywords;@HiveField(5) dynamic get studio;@HiveField(21) int? get duration;@HiveField(22) String? get video;@HiveField(4) dynamic get country;@HiveField(14) String? get trailer;@HiveField(6) dynamic get director;@HiveField(9) dynamic get categories;@HiveField(18) DateTime? get createdAt;@HiveField(19) DateTime? get updatedAt;@HiveField(8) List<GenreModel>? get genres;@HiveField(7) List<ItemModel>? get creators;@HiveField(1)@JsonKey(name: "_id") String? get id;@HiveField(23)@JsonKey(name: "mediaType") AnimeType? get type;@HiveField(17)@JsonKey(name: "for_only_mdh") bool? get forOnlyMDH;@HiveField(10)@JsonKey(name: "published_year") int? get publishedYear;@HiveField(16)@JsonKey(name: "total_episodes") int? get totalEpisodes;@HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? get thumbnail;@HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? get cover;@HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String>? get images;
/// Create a copy of AnimeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeModelCopyWith<AnimeModel> get copyWith => _$AnimeModelCopyWithImpl<AnimeModel>(this as AnimeModel, _$identity);

  /// Serializes this AnimeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeModel&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&const DeepCollectionEquality().equals(other.studio, studio)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.video, video) || other.video == video)&&const DeepCollectionEquality().equals(other.country, country)&&(identical(other.trailer, trailer) || other.trailer == trailer)&&const DeepCollectionEquality().equals(other.director, director)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.creators, creators)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.forOnlyMDH, forOnlyMDH) || other.forOnlyMDH == forOnlyMDH)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,age,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug,const DeepCollectionEquality().hash(keywords),const DeepCollectionEquality().hash(studio),duration,video,const DeepCollectionEquality().hash(country),trailer,const DeepCollectionEquality().hash(director),const DeepCollectionEquality().hash(categories),createdAt,updatedAt,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(creators),id,type,forOnlyMDH,publishedYear,totalEpisodes,thumbnail,cover,const DeepCollectionEquality().hash(images)]);

@override
String toString() {
  return 'AnimeModel(age: $age, uz: $uz, ru: $ru, slug: $slug, keywords: $keywords, studio: $studio, duration: $duration, video: $video, country: $country, trailer: $trailer, director: $director, categories: $categories, createdAt: $createdAt, updatedAt: $updatedAt, genres: $genres, creators: $creators, id: $id, type: $type, forOnlyMDH: $forOnlyMDH, publishedYear: $publishedYear, totalEpisodes: $totalEpisodes, thumbnail: $thumbnail, cover: $cover, images: $images)';
}


}

/// @nodoc
abstract mixin class $AnimeModelCopyWith<$Res>  {
  factory $AnimeModelCopyWith(AnimeModel value, $Res Function(AnimeModel) _then) = _$AnimeModelCopyWithImpl;
@useResult
$Res call({
@HiveField(15) int? age,@HiveField(2) dynamic uz,@HiveField(20) dynamic ru,@HiveField(3) String? slug,@HiveField(0) List? keywords,@HiveField(5) dynamic studio,@HiveField(21) int? duration,@HiveField(22) String? video,@HiveField(4) dynamic country,@HiveField(14) String? trailer,@HiveField(6) dynamic director,@HiveField(9) dynamic categories,@HiveField(18) DateTime? createdAt,@HiveField(19) DateTime? updatedAt,@HiveField(8) List<GenreModel>? genres,@HiveField(7) List<ItemModel>? creators,@HiveField(1)@JsonKey(name: "_id") String? id,@HiveField(23)@JsonKey(name: "mediaType") AnimeType? type,@HiveField(17)@JsonKey(name: "for_only_mdh") bool? forOnlyMDH,@HiveField(10)@JsonKey(name: "published_year") int? publishedYear,@HiveField(16)@JsonKey(name: "total_episodes") int? totalEpisodes,@HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? thumbnail,@HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? cover,@HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String>? images
});




}
/// @nodoc
class _$AnimeModelCopyWithImpl<$Res>
    implements $AnimeModelCopyWith<$Res> {
  _$AnimeModelCopyWithImpl(this._self, this._then);

  final AnimeModel _self;
  final $Res Function(AnimeModel) _then;

/// Create a copy of AnimeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? age = freezed,Object? uz = freezed,Object? ru = freezed,Object? slug = freezed,Object? keywords = freezed,Object? studio = freezed,Object? duration = freezed,Object? video = freezed,Object? country = freezed,Object? trailer = freezed,Object? director = freezed,Object? categories = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? genres = freezed,Object? creators = freezed,Object? id = freezed,Object? type = freezed,Object? forOnlyMDH = freezed,Object? publishedYear = freezed,Object? totalEpisodes = freezed,Object? thumbnail = freezed,Object? cover = freezed,Object? images = freezed,}) {
  return _then(_self.copyWith(
age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,keywords: freezed == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List?,studio: freezed == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as dynamic,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as dynamic,trailer: freezed == trailer ? _self.trailer : trailer // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as dynamic,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>?,creators: freezed == creators ? _self.creators : creators // ignore: cast_nullable_to_non_nullable
as List<ItemModel>?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType?,forOnlyMDH: freezed == forOnlyMDH ? _self.forOnlyMDH : forOnlyMDH // ignore: cast_nullable_to_non_nullable
as bool?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int?,totalEpisodes: freezed == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeModel].
extension AnimeModelPatterns on AnimeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeModel value)  $default,){
final _that = this;
switch (_that) {
case _AnimeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(15)  int? age, @HiveField(2)  dynamic uz, @HiveField(20)  dynamic ru, @HiveField(3)  String? slug, @HiveField(0)  List? keywords, @HiveField(5)  dynamic studio, @HiveField(21)  int? duration, @HiveField(22)  String? video, @HiveField(4)  dynamic country, @HiveField(14)  String? trailer, @HiveField(6)  dynamic director, @HiveField(9)  dynamic categories, @HiveField(18)  DateTime? createdAt, @HiveField(19)  DateTime? updatedAt, @HiveField(8)  List<GenreModel>? genres, @HiveField(7)  List<ItemModel>? creators, @HiveField(1)@JsonKey(name: "_id")  String? id, @HiveField(23)@JsonKey(name: "mediaType")  AnimeType? type, @HiveField(17)@JsonKey(name: "for_only_mdh")  bool? forOnlyMDH, @HiveField(10)@JsonKey(name: "published_year")  int? publishedYear, @HiveField(16)@JsonKey(name: "total_episodes")  int? totalEpisodes, @HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? thumbnail, @HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? cover, @HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true)  List<String>? images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeModel() when $default != null:
return $default(_that.age,_that.uz,_that.ru,_that.slug,_that.keywords,_that.studio,_that.duration,_that.video,_that.country,_that.trailer,_that.director,_that.categories,_that.createdAt,_that.updatedAt,_that.genres,_that.creators,_that.id,_that.type,_that.forOnlyMDH,_that.publishedYear,_that.totalEpisodes,_that.thumbnail,_that.cover,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(15)  int? age, @HiveField(2)  dynamic uz, @HiveField(20)  dynamic ru, @HiveField(3)  String? slug, @HiveField(0)  List? keywords, @HiveField(5)  dynamic studio, @HiveField(21)  int? duration, @HiveField(22)  String? video, @HiveField(4)  dynamic country, @HiveField(14)  String? trailer, @HiveField(6)  dynamic director, @HiveField(9)  dynamic categories, @HiveField(18)  DateTime? createdAt, @HiveField(19)  DateTime? updatedAt, @HiveField(8)  List<GenreModel>? genres, @HiveField(7)  List<ItemModel>? creators, @HiveField(1)@JsonKey(name: "_id")  String? id, @HiveField(23)@JsonKey(name: "mediaType")  AnimeType? type, @HiveField(17)@JsonKey(name: "for_only_mdh")  bool? forOnlyMDH, @HiveField(10)@JsonKey(name: "published_year")  int? publishedYear, @HiveField(16)@JsonKey(name: "total_episodes")  int? totalEpisodes, @HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? thumbnail, @HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? cover, @HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true)  List<String>? images)  $default,) {final _that = this;
switch (_that) {
case _AnimeModel():
return $default(_that.age,_that.uz,_that.ru,_that.slug,_that.keywords,_that.studio,_that.duration,_that.video,_that.country,_that.trailer,_that.director,_that.categories,_that.createdAt,_that.updatedAt,_that.genres,_that.creators,_that.id,_that.type,_that.forOnlyMDH,_that.publishedYear,_that.totalEpisodes,_that.thumbnail,_that.cover,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(15)  int? age, @HiveField(2)  dynamic uz, @HiveField(20)  dynamic ru, @HiveField(3)  String? slug, @HiveField(0)  List? keywords, @HiveField(5)  dynamic studio, @HiveField(21)  int? duration, @HiveField(22)  String? video, @HiveField(4)  dynamic country, @HiveField(14)  String? trailer, @HiveField(6)  dynamic director, @HiveField(9)  dynamic categories, @HiveField(18)  DateTime? createdAt, @HiveField(19)  DateTime? updatedAt, @HiveField(8)  List<GenreModel>? genres, @HiveField(7)  List<ItemModel>? creators, @HiveField(1)@JsonKey(name: "_id")  String? id, @HiveField(23)@JsonKey(name: "mediaType")  AnimeType? type, @HiveField(17)@JsonKey(name: "for_only_mdh")  bool? forOnlyMDH, @HiveField(10)@JsonKey(name: "published_year")  int? publishedYear, @HiveField(16)@JsonKey(name: "total_episodes")  int? totalEpisodes, @HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? thumbnail, @HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? cover, @HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true)  List<String>? images)?  $default,) {final _that = this;
switch (_that) {
case _AnimeModel() when $default != null:
return $default(_that.age,_that.uz,_that.ru,_that.slug,_that.keywords,_that.studio,_that.duration,_that.video,_that.country,_that.trailer,_that.director,_that.categories,_that.createdAt,_that.updatedAt,_that.genres,_that.creators,_that.id,_that.type,_that.forOnlyMDH,_that.publishedYear,_that.totalEpisodes,_that.thumbnail,_that.cover,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeModel implements AnimeModel {
   _AnimeModel({@HiveField(15) this.age, @HiveField(2) this.uz, @HiveField(20) this.ru, @HiveField(3) this.slug, @HiveField(0) final  List? keywords, @HiveField(5) this.studio, @HiveField(21) this.duration, @HiveField(22) this.video, @HiveField(4) this.country, @HiveField(14) this.trailer, @HiveField(6) this.director, @HiveField(9) this.categories, @HiveField(18) this.createdAt, @HiveField(19) this.updatedAt, @HiveField(8) final  List<GenreModel>? genres, @HiveField(7) final  List<ItemModel>? creators, @HiveField(1)@JsonKey(name: "_id") this.id, @HiveField(23)@JsonKey(name: "mediaType") this.type, @HiveField(17)@JsonKey(name: "for_only_mdh") this.forOnlyMDH, @HiveField(10)@JsonKey(name: "published_year") this.publishedYear, @HiveField(16)@JsonKey(name: "total_episodes") this.totalEpisodes, @HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) this.thumbnail, @HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) this.cover, @HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) final  List<String>? images}): _keywords = keywords,_genres = genres,_creators = creators,_images = images;
  factory _AnimeModel.fromJson(Map<String, dynamic> json) => _$AnimeModelFromJson(json);

@override@HiveField(15) final  int? age;
@override@HiveField(2) final  dynamic uz;
@override@HiveField(20) final  dynamic ru;
@override@HiveField(3) final  String? slug;
 final  List? _keywords;
@override@HiveField(0) List? get keywords {
  final value = _keywords;
  if (value == null) return null;
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(5) final  dynamic studio;
@override@HiveField(21) final  int? duration;
@override@HiveField(22) final  String? video;
@override@HiveField(4) final  dynamic country;
@override@HiveField(14) final  String? trailer;
@override@HiveField(6) final  dynamic director;
@override@HiveField(9) final  dynamic categories;
@override@HiveField(18) final  DateTime? createdAt;
@override@HiveField(19) final  DateTime? updatedAt;
 final  List<GenreModel>? _genres;
@override@HiveField(8) List<GenreModel>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ItemModel>? _creators;
@override@HiveField(7) List<ItemModel>? get creators {
  final value = _creators;
  if (value == null) return null;
  if (_creators is EqualUnmodifiableListView) return _creators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(1)@JsonKey(name: "_id") final  String? id;
@override@HiveField(23)@JsonKey(name: "mediaType") final  AnimeType? type;
@override@HiveField(17)@JsonKey(name: "for_only_mdh") final  bool? forOnlyMDH;
@override@HiveField(10)@JsonKey(name: "published_year") final  int? publishedYear;
@override@HiveField(16)@JsonKey(name: "total_episodes") final  int? totalEpisodes;
@override@HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) final  String? thumbnail;
@override@HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) final  String? cover;
 final  List<String>? _images;
@override@HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AnimeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeModelCopyWith<_AnimeModel> get copyWith => __$AnimeModelCopyWithImpl<_AnimeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeModel&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&const DeepCollectionEquality().equals(other.studio, studio)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.video, video) || other.video == video)&&const DeepCollectionEquality().equals(other.country, country)&&(identical(other.trailer, trailer) || other.trailer == trailer)&&const DeepCollectionEquality().equals(other.director, director)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._creators, _creators)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.forOnlyMDH, forOnlyMDH) || other.forOnlyMDH == forOnlyMDH)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,age,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),slug,const DeepCollectionEquality().hash(_keywords),const DeepCollectionEquality().hash(studio),duration,video,const DeepCollectionEquality().hash(country),trailer,const DeepCollectionEquality().hash(director),const DeepCollectionEquality().hash(categories),createdAt,updatedAt,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_creators),id,type,forOnlyMDH,publishedYear,totalEpisodes,thumbnail,cover,const DeepCollectionEquality().hash(_images)]);

@override
String toString() {
  return 'AnimeModel(age: $age, uz: $uz, ru: $ru, slug: $slug, keywords: $keywords, studio: $studio, duration: $duration, video: $video, country: $country, trailer: $trailer, director: $director, categories: $categories, createdAt: $createdAt, updatedAt: $updatedAt, genres: $genres, creators: $creators, id: $id, type: $type, forOnlyMDH: $forOnlyMDH, publishedYear: $publishedYear, totalEpisodes: $totalEpisodes, thumbnail: $thumbnail, cover: $cover, images: $images)';
}


}

/// @nodoc
abstract mixin class _$AnimeModelCopyWith<$Res> implements $AnimeModelCopyWith<$Res> {
  factory _$AnimeModelCopyWith(_AnimeModel value, $Res Function(_AnimeModel) _then) = __$AnimeModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(15) int? age,@HiveField(2) dynamic uz,@HiveField(20) dynamic ru,@HiveField(3) String? slug,@HiveField(0) List? keywords,@HiveField(5) dynamic studio,@HiveField(21) int? duration,@HiveField(22) String? video,@HiveField(4) dynamic country,@HiveField(14) String? trailer,@HiveField(6) dynamic director,@HiveField(9) dynamic categories,@HiveField(18) DateTime? createdAt,@HiveField(19) DateTime? updatedAt,@HiveField(8) List<GenreModel>? genres,@HiveField(7) List<ItemModel>? creators,@HiveField(1)@JsonKey(name: "_id") String? id,@HiveField(23)@JsonKey(name: "mediaType") AnimeType? type,@HiveField(17)@JsonKey(name: "for_only_mdh") bool? forOnlyMDH,@HiveField(10)@JsonKey(name: "published_year") int? publishedYear,@HiveField(16)@JsonKey(name: "total_episodes") int? totalEpisodes,@HiveField(11)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? thumbnail,@HiveField(12)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? cover,@HiveField(13)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String>? images
});




}
/// @nodoc
class __$AnimeModelCopyWithImpl<$Res>
    implements _$AnimeModelCopyWith<$Res> {
  __$AnimeModelCopyWithImpl(this._self, this._then);

  final _AnimeModel _self;
  final $Res Function(_AnimeModel) _then;

/// Create a copy of AnimeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? age = freezed,Object? uz = freezed,Object? ru = freezed,Object? slug = freezed,Object? keywords = freezed,Object? studio = freezed,Object? duration = freezed,Object? video = freezed,Object? country = freezed,Object? trailer = freezed,Object? director = freezed,Object? categories = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? genres = freezed,Object? creators = freezed,Object? id = freezed,Object? type = freezed,Object? forOnlyMDH = freezed,Object? publishedYear = freezed,Object? totalEpisodes = freezed,Object? thumbnail = freezed,Object? cover = freezed,Object? images = freezed,}) {
  return _then(_AnimeModel(
age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as dynamic,ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as dynamic,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,keywords: freezed == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List?,studio: freezed == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as dynamic,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as dynamic,trailer: freezed == trailer ? _self.trailer : trailer // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as dynamic,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>?,creators: freezed == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as List<ItemModel>?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType?,forOnlyMDH: freezed == forOnlyMDH ? _self.forOnlyMDH : forOnlyMDH // ignore: cast_nullable_to_non_nullable
as bool?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int?,totalEpisodes: freezed == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
