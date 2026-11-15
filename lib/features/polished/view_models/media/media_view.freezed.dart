// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaView {

 int get releaseYear; int get ageRestriction; int get views; int get likes; int get saves; String get key; String get cover; String get title; String get author; String get studio; String get thumbnail; String get description; List<String> get frames; Map<String, String> get genres; Map<String, String> get categories; Map<String, String> get translators; MediaType get type;
/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaViewCopyWith<MediaView> get copyWith => _$MediaViewCopyWithImpl<MediaView>(this as MediaView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaView&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.views, views) || other.views == views)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.saves, saves) || other.saves == saves)&&(identical(other.key, key) || other.key == key)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.studio, studio) || other.studio == studio)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.frames, frames)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.translators, translators)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,releaseYear,ageRestriction,views,likes,saves,key,cover,title,author,studio,thumbnail,description,const DeepCollectionEquality().hash(frames),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(translators),type);

@override
String toString() {
  return 'MediaView(releaseYear: $releaseYear, ageRestriction: $ageRestriction, views: $views, likes: $likes, saves: $saves, key: $key, cover: $cover, title: $title, author: $author, studio: $studio, thumbnail: $thumbnail, description: $description, frames: $frames, genres: $genres, categories: $categories, translators: $translators, type: $type)';
}


}

/// @nodoc
abstract mixin class $MediaViewCopyWith<$Res>  {
  factory $MediaViewCopyWith(MediaView value, $Res Function(MediaView) _then) = _$MediaViewCopyWithImpl;
@useResult
$Res call({
 int releaseYear, int ageRestriction, int views, int likes, int saves, String key, String cover, String title, String author, String studio, String thumbnail, String description, List<String> frames, Map<String, String> genres, Map<String, String> categories, Map<String, String> translators, MediaType type
});




}
/// @nodoc
class _$MediaViewCopyWithImpl<$Res>
    implements $MediaViewCopyWith<$Res> {
  _$MediaViewCopyWithImpl(this._self, this._then);

  final MediaView _self;
  final $Res Function(MediaView) _then;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? releaseYear = null,Object? ageRestriction = null,Object? views = null,Object? likes = null,Object? saves = null,Object? key = null,Object? cover = null,Object? title = null,Object? author = null,Object? studio = null,Object? thumbnail = null,Object? description = null,Object? frames = null,Object? genres = null,Object? categories = null,Object? translators = null,Object? type = null,}) {
  return _then(_self.copyWith(
releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as int,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,saves: null == saves ? _self.saves : saves // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,studio: null == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,frames: null == frames ? _self.frames : frames // ignore: cast_nullable_to_non_nullable
as List<String>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as Map<String, String>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as Map<String, String>,translators: null == translators ? _self.translators : translators // ignore: cast_nullable_to_non_nullable
as Map<String, String>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaView].
extension MediaViewPatterns on MediaView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaView value)  $default,){
final _that = this;
switch (_that) {
case _MediaView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaView value)?  $default,){
final _that = this;
switch (_that) {
case _MediaView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int releaseYear,  int ageRestriction,  int views,  int likes,  int saves,  String key,  String cover,  String title,  String author,  String studio,  String thumbnail,  String description,  List<String> frames,  Map<String, String> genres,  Map<String, String> categories,  Map<String, String> translators,  MediaType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaView() when $default != null:
return $default(_that.releaseYear,_that.ageRestriction,_that.views,_that.likes,_that.saves,_that.key,_that.cover,_that.title,_that.author,_that.studio,_that.thumbnail,_that.description,_that.frames,_that.genres,_that.categories,_that.translators,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int releaseYear,  int ageRestriction,  int views,  int likes,  int saves,  String key,  String cover,  String title,  String author,  String studio,  String thumbnail,  String description,  List<String> frames,  Map<String, String> genres,  Map<String, String> categories,  Map<String, String> translators,  MediaType type)  $default,) {final _that = this;
switch (_that) {
case _MediaView():
return $default(_that.releaseYear,_that.ageRestriction,_that.views,_that.likes,_that.saves,_that.key,_that.cover,_that.title,_that.author,_that.studio,_that.thumbnail,_that.description,_that.frames,_that.genres,_that.categories,_that.translators,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int releaseYear,  int ageRestriction,  int views,  int likes,  int saves,  String key,  String cover,  String title,  String author,  String studio,  String thumbnail,  String description,  List<String> frames,  Map<String, String> genres,  Map<String, String> categories,  Map<String, String> translators,  MediaType type)?  $default,) {final _that = this;
switch (_that) {
case _MediaView() when $default != null:
return $default(_that.releaseYear,_that.ageRestriction,_that.views,_that.likes,_that.saves,_that.key,_that.cover,_that.title,_that.author,_that.studio,_that.thumbnail,_that.description,_that.frames,_that.genres,_that.categories,_that.translators,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _MediaView implements MediaView {
  const _MediaView({this.releaseYear = 0, this.ageRestriction = 0, this.views = 0, this.likes = 0, this.saves = 0, this.key = "", this.cover = "", this.title = "", this.author = "", this.studio = "", this.thumbnail = "", this.description = "", final  List<String> frames = const [], final  Map<String, String> genres = const {}, final  Map<String, String> categories = const {}, final  Map<String, String> translators = const {}, this.type = MediaType.comics}): _frames = frames,_genres = genres,_categories = categories,_translators = translators;
  

@override@JsonKey() final  int releaseYear;
@override@JsonKey() final  int ageRestriction;
@override@JsonKey() final  int views;
@override@JsonKey() final  int likes;
@override@JsonKey() final  int saves;
@override@JsonKey() final  String key;
@override@JsonKey() final  String cover;
@override@JsonKey() final  String title;
@override@JsonKey() final  String author;
@override@JsonKey() final  String studio;
@override@JsonKey() final  String thumbnail;
@override@JsonKey() final  String description;
 final  List<String> _frames;
@override@JsonKey() List<String> get frames {
  if (_frames is EqualUnmodifiableListView) return _frames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_frames);
}

 final  Map<String, String> _genres;
@override@JsonKey() Map<String, String> get genres {
  if (_genres is EqualUnmodifiableMapView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_genres);
}

 final  Map<String, String> _categories;
@override@JsonKey() Map<String, String> get categories {
  if (_categories is EqualUnmodifiableMapView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categories);
}

 final  Map<String, String> _translators;
@override@JsonKey() Map<String, String> get translators {
  if (_translators is EqualUnmodifiableMapView) return _translators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translators);
}

@override@JsonKey() final  MediaType type;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaViewCopyWith<_MediaView> get copyWith => __$MediaViewCopyWithImpl<_MediaView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaView&&(identical(other.releaseYear, releaseYear) || other.releaseYear == releaseYear)&&(identical(other.ageRestriction, ageRestriction) || other.ageRestriction == ageRestriction)&&(identical(other.views, views) || other.views == views)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.saves, saves) || other.saves == saves)&&(identical(other.key, key) || other.key == key)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.studio, studio) || other.studio == studio)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._frames, _frames)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._translators, _translators)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,releaseYear,ageRestriction,views,likes,saves,key,cover,title,author,studio,thumbnail,description,const DeepCollectionEquality().hash(_frames),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_translators),type);

@override
String toString() {
  return 'MediaView(releaseYear: $releaseYear, ageRestriction: $ageRestriction, views: $views, likes: $likes, saves: $saves, key: $key, cover: $cover, title: $title, author: $author, studio: $studio, thumbnail: $thumbnail, description: $description, frames: $frames, genres: $genres, categories: $categories, translators: $translators, type: $type)';
}


}

/// @nodoc
abstract mixin class _$MediaViewCopyWith<$Res> implements $MediaViewCopyWith<$Res> {
  factory _$MediaViewCopyWith(_MediaView value, $Res Function(_MediaView) _then) = __$MediaViewCopyWithImpl;
@override @useResult
$Res call({
 int releaseYear, int ageRestriction, int views, int likes, int saves, String key, String cover, String title, String author, String studio, String thumbnail, String description, List<String> frames, Map<String, String> genres, Map<String, String> categories, Map<String, String> translators, MediaType type
});




}
/// @nodoc
class __$MediaViewCopyWithImpl<$Res>
    implements _$MediaViewCopyWith<$Res> {
  __$MediaViewCopyWithImpl(this._self, this._then);

  final _MediaView _self;
  final $Res Function(_MediaView) _then;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? releaseYear = null,Object? ageRestriction = null,Object? views = null,Object? likes = null,Object? saves = null,Object? key = null,Object? cover = null,Object? title = null,Object? author = null,Object? studio = null,Object? thumbnail = null,Object? description = null,Object? frames = null,Object? genres = null,Object? categories = null,Object? translators = null,Object? type = null,}) {
  return _then(_MediaView(
releaseYear: null == releaseYear ? _self.releaseYear : releaseYear // ignore: cast_nullable_to_non_nullable
as int,ageRestriction: null == ageRestriction ? _self.ageRestriction : ageRestriction // ignore: cast_nullable_to_non_nullable
as int,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,saves: null == saves ? _self.saves : saves // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,studio: null == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,frames: null == frames ? _self._frames : frames // ignore: cast_nullable_to_non_nullable
as List<String>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as Map<String, String>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Map<String, String>,translators: null == translators ? _self._translators : translators // ignore: cast_nullable_to_non_nullable
as Map<String, String>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,
  ));
}


}

// dart format on
