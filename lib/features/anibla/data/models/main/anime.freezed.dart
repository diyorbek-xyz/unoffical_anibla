// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Anime {

@HiveField(2) Map<String, dynamic> get uz;@HiveField(3) Map<String, dynamic> get ru;@HiveField(1) int get age;@HiveField(4) String get slug;@HiveField(5) List get keywords;@HiveField(6) dynamic get studio;@HiveField(7) int get duration;@HiveField(8) String get video;@HiveField(9) dynamic get country;@HiveField(10) String get trailer;@HiveField(11) dynamic get director;@HiveField(12) dynamic get categories;@HiveField(13) String get createdDate;@HiveField(14) String get updatedDate;@HiveField(15) List<Genre> get genres;@HiveField(16) List<Creator> get creators;@HiveField(17)@JsonKey(name: "_id") String get id;@HiveField(18)@JsonKey(name: "mediaType") AnimeType get type;@HiveField(19)@JsonKey(name: "for_only_mdh") bool get forOnlyMDH;@HiveField(20)@JsonKey(name: "published_year") int get publishedYear;@HiveField(21)@JsonKey(name: "total_episodes") int get totalEpisodes;@HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String get thumbnail;@HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String get cover;@HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String> get images;
/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeCopyWith<Anime> get copyWith => _$AnimeCopyWithImpl<Anime>(this as Anime, _$identity);

  /// Serializes this Anime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Anime&&const DeepCollectionEquality().equals(other.uz, uz)&&const DeepCollectionEquality().equals(other.ru, ru)&&(identical(other.age, age) || other.age == age)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&const DeepCollectionEquality().equals(other.studio, studio)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.video, video) || other.video == video)&&const DeepCollectionEquality().equals(other.country, country)&&(identical(other.trailer, trailer) || other.trailer == trailer)&&const DeepCollectionEquality().equals(other.director, director)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.updatedDate, updatedDate) || other.updatedDate == updatedDate)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.creators, creators)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.forOnlyMDH, forOnlyMDH) || other.forOnlyMDH == forOnlyMDH)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(uz),const DeepCollectionEquality().hash(ru),age,slug,const DeepCollectionEquality().hash(keywords),const DeepCollectionEquality().hash(studio),duration,video,const DeepCollectionEquality().hash(country),trailer,const DeepCollectionEquality().hash(director),const DeepCollectionEquality().hash(categories),createdDate,updatedDate,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(creators),id,type,forOnlyMDH,publishedYear,totalEpisodes,thumbnail,cover,const DeepCollectionEquality().hash(images)]);

@override
String toString() {
  return 'Anime(uz: $uz, ru: $ru, age: $age, slug: $slug, keywords: $keywords, studio: $studio, duration: $duration, video: $video, country: $country, trailer: $trailer, director: $director, categories: $categories, createdDate: $createdDate, updatedDate: $updatedDate, genres: $genres, creators: $creators, id: $id, type: $type, forOnlyMDH: $forOnlyMDH, publishedYear: $publishedYear, totalEpisodes: $totalEpisodes, thumbnail: $thumbnail, cover: $cover, images: $images)';
}


}

/// @nodoc
abstract mixin class $AnimeCopyWith<$Res>  {
  factory $AnimeCopyWith(Anime value, $Res Function(Anime) _then) = _$AnimeCopyWithImpl;
@useResult
$Res call({
@HiveField(2) Map<String, dynamic> uz,@HiveField(3) Map<String, dynamic> ru,@HiveField(1) int age,@HiveField(4) String slug,@HiveField(5) List keywords,@HiveField(6) dynamic studio,@HiveField(7) int duration,@HiveField(8) String video,@HiveField(9) dynamic country,@HiveField(10) String trailer,@HiveField(11) dynamic director,@HiveField(12) dynamic categories,@HiveField(13) String createdDate,@HiveField(14) String updatedDate,@HiveField(15) List<Genre> genres,@HiveField(16) List<Creator> creators,@HiveField(17)@JsonKey(name: "_id") String id,@HiveField(18)@JsonKey(name: "mediaType") AnimeType type,@HiveField(19)@JsonKey(name: "for_only_mdh") bool forOnlyMDH,@HiveField(20)@JsonKey(name: "published_year") int publishedYear,@HiveField(21)@JsonKey(name: "total_episodes") int totalEpisodes,@HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String thumbnail,@HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String cover,@HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String> images
});




}
/// @nodoc
class _$AnimeCopyWithImpl<$Res>
    implements $AnimeCopyWith<$Res> {
  _$AnimeCopyWithImpl(this._self, this._then);

  final Anime _self;
  final $Res Function(Anime) _then;

/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uz = null,Object? ru = null,Object? age = null,Object? slug = null,Object? keywords = null,Object? studio = freezed,Object? duration = null,Object? video = null,Object? country = freezed,Object? trailer = null,Object? director = freezed,Object? categories = freezed,Object? createdDate = null,Object? updatedDate = null,Object? genres = null,Object? creators = null,Object? id = null,Object? type = null,Object? forOnlyMDH = null,Object? publishedYear = null,Object? totalEpisodes = null,Object? thumbnail = null,Object? cover = null,Object? images = null,}) {
  return _then(_self.copyWith(
uz: null == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,ru: null == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List,studio: freezed == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as dynamic,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as dynamic,trailer: null == trailer ? _self.trailer : trailer // ignore: cast_nullable_to_non_nullable
as String,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as dynamic,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as dynamic,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,updatedDate: null == updatedDate ? _self.updatedDate : updatedDate // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,creators: null == creators ? _self.creators : creators // ignore: cast_nullable_to_non_nullable
as List<Creator>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,forOnlyMDH: null == forOnlyMDH ? _self.forOnlyMDH : forOnlyMDH // ignore: cast_nullable_to_non_nullable
as bool,publishedYear: null == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Anime].
extension AnimePatterns on Anime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Anime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Anime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Anime value)  $default,){
final _that = this;
switch (_that) {
case _Anime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Anime value)?  $default,){
final _that = this;
switch (_that) {
case _Anime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(2)  Map<String, dynamic> uz, @HiveField(3)  Map<String, dynamic> ru, @HiveField(1)  int age, @HiveField(4)  String slug, @HiveField(5)  List keywords, @HiveField(6)  dynamic studio, @HiveField(7)  int duration, @HiveField(8)  String video, @HiveField(9)  dynamic country, @HiveField(10)  String trailer, @HiveField(11)  dynamic director, @HiveField(12)  dynamic categories, @HiveField(13)  String createdDate, @HiveField(14)  String updatedDate, @HiveField(15)  List<Genre> genres, @HiveField(16)  List<Creator> creators, @HiveField(17)@JsonKey(name: "_id")  String id, @HiveField(18)@JsonKey(name: "mediaType")  AnimeType type, @HiveField(19)@JsonKey(name: "for_only_mdh")  bool forOnlyMDH, @HiveField(20)@JsonKey(name: "published_year")  int publishedYear, @HiveField(21)@JsonKey(name: "total_episodes")  int totalEpisodes, @HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String thumbnail, @HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String cover, @HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true)  List<String> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Anime() when $default != null:
return $default(_that.uz,_that.ru,_that.age,_that.slug,_that.keywords,_that.studio,_that.duration,_that.video,_that.country,_that.trailer,_that.director,_that.categories,_that.createdDate,_that.updatedDate,_that.genres,_that.creators,_that.id,_that.type,_that.forOnlyMDH,_that.publishedYear,_that.totalEpisodes,_that.thumbnail,_that.cover,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(2)  Map<String, dynamic> uz, @HiveField(3)  Map<String, dynamic> ru, @HiveField(1)  int age, @HiveField(4)  String slug, @HiveField(5)  List keywords, @HiveField(6)  dynamic studio, @HiveField(7)  int duration, @HiveField(8)  String video, @HiveField(9)  dynamic country, @HiveField(10)  String trailer, @HiveField(11)  dynamic director, @HiveField(12)  dynamic categories, @HiveField(13)  String createdDate, @HiveField(14)  String updatedDate, @HiveField(15)  List<Genre> genres, @HiveField(16)  List<Creator> creators, @HiveField(17)@JsonKey(name: "_id")  String id, @HiveField(18)@JsonKey(name: "mediaType")  AnimeType type, @HiveField(19)@JsonKey(name: "for_only_mdh")  bool forOnlyMDH, @HiveField(20)@JsonKey(name: "published_year")  int publishedYear, @HiveField(21)@JsonKey(name: "total_episodes")  int totalEpisodes, @HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String thumbnail, @HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String cover, @HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true)  List<String> images)  $default,) {final _that = this;
switch (_that) {
case _Anime():
return $default(_that.uz,_that.ru,_that.age,_that.slug,_that.keywords,_that.studio,_that.duration,_that.video,_that.country,_that.trailer,_that.director,_that.categories,_that.createdDate,_that.updatedDate,_that.genres,_that.creators,_that.id,_that.type,_that.forOnlyMDH,_that.publishedYear,_that.totalEpisodes,_that.thumbnail,_that.cover,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(2)  Map<String, dynamic> uz, @HiveField(3)  Map<String, dynamic> ru, @HiveField(1)  int age, @HiveField(4)  String slug, @HiveField(5)  List keywords, @HiveField(6)  dynamic studio, @HiveField(7)  int duration, @HiveField(8)  String video, @HiveField(9)  dynamic country, @HiveField(10)  String trailer, @HiveField(11)  dynamic director, @HiveField(12)  dynamic categories, @HiveField(13)  String createdDate, @HiveField(14)  String updatedDate, @HiveField(15)  List<Genre> genres, @HiveField(16)  List<Creator> creators, @HiveField(17)@JsonKey(name: "_id")  String id, @HiveField(18)@JsonKey(name: "mediaType")  AnimeType type, @HiveField(19)@JsonKey(name: "for_only_mdh")  bool forOnlyMDH, @HiveField(20)@JsonKey(name: "published_year")  int publishedYear, @HiveField(21)@JsonKey(name: "total_episodes")  int totalEpisodes, @HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String thumbnail, @HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String cover, @HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true)  List<String> images)?  $default,) {final _that = this;
switch (_that) {
case _Anime() when $default != null:
return $default(_that.uz,_that.ru,_that.age,_that.slug,_that.keywords,_that.studio,_that.duration,_that.video,_that.country,_that.trailer,_that.director,_that.categories,_that.createdDate,_that.updatedDate,_that.genres,_that.creators,_that.id,_that.type,_that.forOnlyMDH,_that.publishedYear,_that.totalEpisodes,_that.thumbnail,_that.cover,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Anime extends Anime {
  const _Anime({@HiveField(2) final  Map<String, dynamic> uz = const {}, @HiveField(3) final  Map<String, dynamic> ru = const {}, @HiveField(1) this.age = 0, @HiveField(4) this.slug = "", @HiveField(5) final  List keywords = const [], @HiveField(6) this.studio = const {}, @HiveField(7) this.duration = 0, @HiveField(8) this.video = "", @HiveField(9) this.country = const {}, @HiveField(10) this.trailer = "", @HiveField(11) this.director = const {}, @HiveField(12) this.categories = const [], @HiveField(13) this.createdDate = "", @HiveField(14) this.updatedDate = "", @HiveField(15) final  List<Genre> genres = const [], @HiveField(16) final  List<Creator> creators = const [], @HiveField(17)@JsonKey(name: "_id") this.id = "", @HiveField(18)@JsonKey(name: "mediaType") this.type = AnimeType.serie, @HiveField(19)@JsonKey(name: "for_only_mdh") this.forOnlyMDH = false, @HiveField(20)@JsonKey(name: "published_year") this.publishedYear = 0, @HiveField(21)@JsonKey(name: "total_episodes") this.totalEpisodes = 0, @HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) this.thumbnail = "", @HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) this.cover = "", @HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) final  List<String> images = const []}): _uz = uz,_ru = ru,_keywords = keywords,_genres = genres,_creators = creators,_images = images,super._();
  factory _Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

 final  Map<String, dynamic> _uz;
@override@JsonKey()@HiveField(2) Map<String, dynamic> get uz {
  if (_uz is EqualUnmodifiableMapView) return _uz;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_uz);
}

 final  Map<String, dynamic> _ru;
@override@JsonKey()@HiveField(3) Map<String, dynamic> get ru {
  if (_ru is EqualUnmodifiableMapView) return _ru;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ru);
}

@override@JsonKey()@HiveField(1) final  int age;
@override@JsonKey()@HiveField(4) final  String slug;
 final  List _keywords;
@override@JsonKey()@HiveField(5) List get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

@override@JsonKey()@HiveField(6) final  dynamic studio;
@override@JsonKey()@HiveField(7) final  int duration;
@override@JsonKey()@HiveField(8) final  String video;
@override@JsonKey()@HiveField(9) final  dynamic country;
@override@JsonKey()@HiveField(10) final  String trailer;
@override@JsonKey()@HiveField(11) final  dynamic director;
@override@JsonKey()@HiveField(12) final  dynamic categories;
@override@JsonKey()@HiveField(13) final  String createdDate;
@override@JsonKey()@HiveField(14) final  String updatedDate;
 final  List<Genre> _genres;
@override@JsonKey()@HiveField(15) List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<Creator> _creators;
@override@JsonKey()@HiveField(16) List<Creator> get creators {
  if (_creators is EqualUnmodifiableListView) return _creators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creators);
}

@override@HiveField(17)@JsonKey(name: "_id") final  String id;
@override@HiveField(18)@JsonKey(name: "mediaType") final  AnimeType type;
@override@HiveField(19)@JsonKey(name: "for_only_mdh") final  bool forOnlyMDH;
@override@HiveField(20)@JsonKey(name: "published_year") final  int publishedYear;
@override@HiveField(21)@JsonKey(name: "total_episodes") final  int totalEpisodes;
@override@HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) final  String thumbnail;
@override@HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) final  String cover;
 final  List<String> _images;
@override@HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeCopyWith<_Anime> get copyWith => __$AnimeCopyWithImpl<_Anime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Anime&&const DeepCollectionEquality().equals(other._uz, _uz)&&const DeepCollectionEquality().equals(other._ru, _ru)&&(identical(other.age, age) || other.age == age)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&const DeepCollectionEquality().equals(other.studio, studio)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.video, video) || other.video == video)&&const DeepCollectionEquality().equals(other.country, country)&&(identical(other.trailer, trailer) || other.trailer == trailer)&&const DeepCollectionEquality().equals(other.director, director)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.updatedDate, updatedDate) || other.updatedDate == updatedDate)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._creators, _creators)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.forOnlyMDH, forOnlyMDH) || other.forOnlyMDH == forOnlyMDH)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_uz),const DeepCollectionEquality().hash(_ru),age,slug,const DeepCollectionEquality().hash(_keywords),const DeepCollectionEquality().hash(studio),duration,video,const DeepCollectionEquality().hash(country),trailer,const DeepCollectionEquality().hash(director),const DeepCollectionEquality().hash(categories),createdDate,updatedDate,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_creators),id,type,forOnlyMDH,publishedYear,totalEpisodes,thumbnail,cover,const DeepCollectionEquality().hash(_images)]);

@override
String toString() {
  return 'Anime(uz: $uz, ru: $ru, age: $age, slug: $slug, keywords: $keywords, studio: $studio, duration: $duration, video: $video, country: $country, trailer: $trailer, director: $director, categories: $categories, createdDate: $createdDate, updatedDate: $updatedDate, genres: $genres, creators: $creators, id: $id, type: $type, forOnlyMDH: $forOnlyMDH, publishedYear: $publishedYear, totalEpisodes: $totalEpisodes, thumbnail: $thumbnail, cover: $cover, images: $images)';
}


}

/// @nodoc
abstract mixin class _$AnimeCopyWith<$Res> implements $AnimeCopyWith<$Res> {
  factory _$AnimeCopyWith(_Anime value, $Res Function(_Anime) _then) = __$AnimeCopyWithImpl;
@override @useResult
$Res call({
@HiveField(2) Map<String, dynamic> uz,@HiveField(3) Map<String, dynamic> ru,@HiveField(1) int age,@HiveField(4) String slug,@HiveField(5) List keywords,@HiveField(6) dynamic studio,@HiveField(7) int duration,@HiveField(8) String video,@HiveField(9) dynamic country,@HiveField(10) String trailer,@HiveField(11) dynamic director,@HiveField(12) dynamic categories,@HiveField(13) String createdDate,@HiveField(14) String updatedDate,@HiveField(15) List<Genre> genres,@HiveField(16) List<Creator> creators,@HiveField(17)@JsonKey(name: "_id") String id,@HiveField(18)@JsonKey(name: "mediaType") AnimeType type,@HiveField(19)@JsonKey(name: "for_only_mdh") bool forOnlyMDH,@HiveField(20)@JsonKey(name: "published_year") int publishedYear,@HiveField(21)@JsonKey(name: "total_episodes") int totalEpisodes,@HiveField(22)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String thumbnail,@HiveField(23)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String cover,@HiveField(24)@JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String> images
});




}
/// @nodoc
class __$AnimeCopyWithImpl<$Res>
    implements _$AnimeCopyWith<$Res> {
  __$AnimeCopyWithImpl(this._self, this._then);

  final _Anime _self;
  final $Res Function(_Anime) _then;

/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uz = null,Object? ru = null,Object? age = null,Object? slug = null,Object? keywords = null,Object? studio = freezed,Object? duration = null,Object? video = null,Object? country = freezed,Object? trailer = null,Object? director = freezed,Object? categories = freezed,Object? createdDate = null,Object? updatedDate = null,Object? genres = null,Object? creators = null,Object? id = null,Object? type = null,Object? forOnlyMDH = null,Object? publishedYear = null,Object? totalEpisodes = null,Object? thumbnail = null,Object? cover = null,Object? images = null,}) {
  return _then(_Anime(
uz: null == uz ? _self._uz : uz // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,ru: null == ru ? _self._ru : ru // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List,studio: freezed == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as dynamic,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as dynamic,trailer: null == trailer ? _self.trailer : trailer // ignore: cast_nullable_to_non_nullable
as String,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as dynamic,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as dynamic,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,updatedDate: null == updatedDate ? _self.updatedDate : updatedDate // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as List<Creator>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnimeType,forOnlyMDH: null == forOnlyMDH ? _self.forOnlyMDH : forOnlyMDH // ignore: cast_nullable_to_non_nullable
as bool,publishedYear: null == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int,totalEpisodes: null == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
