// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoCategory {

@JsonKey(name: "category_id") String get id;@JsonKey(name: "name") String get title;
/// Create a copy of ManoCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoCategoryCopyWith<ManoCategory> get copyWith => _$ManoCategoryCopyWithImpl<ManoCategory>(this as ManoCategory, _$identity);

  /// Serializes this ManoCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'ManoCategory(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $ManoCategoryCopyWith<$Res>  {
  factory $ManoCategoryCopyWith(ManoCategory value, $Res Function(ManoCategory) _then) = _$ManoCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "category_id") String id,@JsonKey(name: "name") String title
});




}
/// @nodoc
class _$ManoCategoryCopyWithImpl<$Res>
    implements $ManoCategoryCopyWith<$Res> {
  _$ManoCategoryCopyWithImpl(this._self, this._then);

  final ManoCategory _self;
  final $Res Function(ManoCategory) _then;

/// Create a copy of ManoCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoCategory].
extension ManoCategoryPatterns on ManoCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoCategory value)  $default,){
final _that = this;
switch (_that) {
case _ManoCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "category_id")  String id, @JsonKey(name: "name")  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "category_id")  String id, @JsonKey(name: "name")  String title)  $default,) {final _that = this;
switch (_that) {
case _ManoCategory():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "category_id")  String id, @JsonKey(name: "name")  String title)?  $default,) {final _that = this;
switch (_that) {
case _ManoCategory() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoCategory implements ManoCategory {
  const _ManoCategory({@JsonKey(name: "category_id") this.id = "", @JsonKey(name: "name") this.title = ""});
  factory _ManoCategory.fromJson(Map<String, dynamic> json) => _$ManoCategoryFromJson(json);

@override@JsonKey(name: "category_id") final  String id;
@override@JsonKey(name: "name") final  String title;

/// Create a copy of ManoCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoCategoryCopyWith<_ManoCategory> get copyWith => __$ManoCategoryCopyWithImpl<_ManoCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'ManoCategory(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$ManoCategoryCopyWith<$Res> implements $ManoCategoryCopyWith<$Res> {
  factory _$ManoCategoryCopyWith(_ManoCategory value, $Res Function(_ManoCategory) _then) = __$ManoCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "category_id") String id,@JsonKey(name: "name") String title
});




}
/// @nodoc
class __$ManoCategoryCopyWithImpl<$Res>
    implements _$ManoCategoryCopyWith<$Res> {
  __$ManoCategoryCopyWithImpl(this._self, this._then);

  final _ManoCategory _self;
  final $Res Function(_ManoCategory) _then;

/// Create a copy of ManoCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_ManoCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
