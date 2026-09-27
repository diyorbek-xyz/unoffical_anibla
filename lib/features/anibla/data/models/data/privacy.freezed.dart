// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Privacy {

@HiveField(0)@JsonKey(name: "show_comments") bool get showComments;@HiveField(1)@JsonKey(name: "show_favorites") bool get showFavorites;@HiveField(2) String get id;
/// Create a copy of Privacy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacyCopyWith<Privacy> get copyWith => _$PrivacyCopyWithImpl<Privacy>(this as Privacy, _$identity);

  /// Serializes this Privacy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Privacy&&(identical(other.showComments, showComments) || other.showComments == showComments)&&(identical(other.showFavorites, showFavorites) || other.showFavorites == showFavorites)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showComments,showFavorites,id);

@override
String toString() {
  return 'Privacy(showComments: $showComments, showFavorites: $showFavorites, id: $id)';
}


}

/// @nodoc
abstract mixin class $PrivacyCopyWith<$Res>  {
  factory $PrivacyCopyWith(Privacy value, $Res Function(Privacy) _then) = _$PrivacyCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "show_comments") bool showComments,@HiveField(1)@JsonKey(name: "show_favorites") bool showFavorites,@HiveField(2) String id
});




}
/// @nodoc
class _$PrivacyCopyWithImpl<$Res>
    implements $PrivacyCopyWith<$Res> {
  _$PrivacyCopyWithImpl(this._self, this._then);

  final Privacy _self;
  final $Res Function(Privacy) _then;

/// Create a copy of Privacy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showComments = null,Object? showFavorites = null,Object? id = null,}) {
  return _then(_self.copyWith(
showComments: null == showComments ? _self.showComments : showComments // ignore: cast_nullable_to_non_nullable
as bool,showFavorites: null == showFavorites ? _self.showFavorites : showFavorites // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Privacy].
extension PrivacyPatterns on Privacy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Privacy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Privacy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Privacy value)  $default,){
final _that = this;
switch (_that) {
case _Privacy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Privacy value)?  $default,){
final _that = this;
switch (_that) {
case _Privacy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "show_comments")  bool showComments, @HiveField(1)@JsonKey(name: "show_favorites")  bool showFavorites, @HiveField(2)  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Privacy() when $default != null:
return $default(_that.showComments,_that.showFavorites,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "show_comments")  bool showComments, @HiveField(1)@JsonKey(name: "show_favorites")  bool showFavorites, @HiveField(2)  String id)  $default,) {final _that = this;
switch (_that) {
case _Privacy():
return $default(_that.showComments,_that.showFavorites,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "show_comments")  bool showComments, @HiveField(1)@JsonKey(name: "show_favorites")  bool showFavorites, @HiveField(2)  String id)?  $default,) {final _that = this;
switch (_that) {
case _Privacy() when $default != null:
return $default(_that.showComments,_that.showFavorites,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Privacy implements Privacy {
  const _Privacy({@HiveField(0)@JsonKey(name: "show_comments") this.showComments = false, @HiveField(1)@JsonKey(name: "show_favorites") this.showFavorites = false, @HiveField(2) this.id = ""});
  factory _Privacy.fromJson(Map<String, dynamic> json) => _$PrivacyFromJson(json);

@override@HiveField(0)@JsonKey(name: "show_comments") final  bool showComments;
@override@HiveField(1)@JsonKey(name: "show_favorites") final  bool showFavorites;
@override@JsonKey()@HiveField(2) final  String id;

/// Create a copy of Privacy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacyCopyWith<_Privacy> get copyWith => __$PrivacyCopyWithImpl<_Privacy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Privacy&&(identical(other.showComments, showComments) || other.showComments == showComments)&&(identical(other.showFavorites, showFavorites) || other.showFavorites == showFavorites)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showComments,showFavorites,id);

@override
String toString() {
  return 'Privacy(showComments: $showComments, showFavorites: $showFavorites, id: $id)';
}


}

/// @nodoc
abstract mixin class _$PrivacyCopyWith<$Res> implements $PrivacyCopyWith<$Res> {
  factory _$PrivacyCopyWith(_Privacy value, $Res Function(_Privacy) _then) = __$PrivacyCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "show_comments") bool showComments,@HiveField(1)@JsonKey(name: "show_favorites") bool showFavorites,@HiveField(2) String id
});




}
/// @nodoc
class __$PrivacyCopyWithImpl<$Res>
    implements _$PrivacyCopyWith<$Res> {
  __$PrivacyCopyWithImpl(this._self, this._then);

  final _Privacy _self;
  final $Res Function(_Privacy) _then;

/// Create a copy of Privacy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showComments = null,Object? showFavorites = null,Object? id = null,}) {
  return _then(_Privacy(
showComments: null == showComments ? _self.showComments : showComments // ignore: cast_nullable_to_non_nullable
as bool,showFavorites: null == showFavorites ? _self.showFavorites : showFavorites // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
