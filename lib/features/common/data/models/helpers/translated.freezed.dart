// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslatedModel {

@HiveField(0) String? get ru;@HiveField(1) String? get uz;
/// Create a copy of TranslatedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslatedModelCopyWith<TranslatedModel> get copyWith => _$TranslatedModelCopyWithImpl<TranslatedModel>(this as TranslatedModel, _$identity);

  /// Serializes this TranslatedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslatedModel&&(identical(other.ru, ru) || other.ru == ru)&&(identical(other.uz, uz) || other.uz == uz));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ru,uz);

@override
String toString() {
  return 'TranslatedModel(ru: $ru, uz: $uz)';
}


}

/// @nodoc
abstract mixin class $TranslatedModelCopyWith<$Res>  {
  factory $TranslatedModelCopyWith(TranslatedModel value, $Res Function(TranslatedModel) _then) = _$TranslatedModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String? ru,@HiveField(1) String? uz
});




}
/// @nodoc
class _$TranslatedModelCopyWithImpl<$Res>
    implements $TranslatedModelCopyWith<$Res> {
  _$TranslatedModelCopyWithImpl(this._self, this._then);

  final TranslatedModel _self;
  final $Res Function(TranslatedModel) _then;

/// Create a copy of TranslatedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ru = freezed,Object? uz = freezed,}) {
  return _then(_self.copyWith(
ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as String?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslatedModel].
extension TranslatedModelPatterns on TranslatedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslatedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslatedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslatedModel value)  $default,){
final _that = this;
switch (_that) {
case _TranslatedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslatedModel value)?  $default,){
final _that = this;
switch (_that) {
case _TranslatedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String? ru, @HiveField(1)  String? uz)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslatedModel() when $default != null:
return $default(_that.ru,_that.uz);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String? ru, @HiveField(1)  String? uz)  $default,) {final _that = this;
switch (_that) {
case _TranslatedModel():
return $default(_that.ru,_that.uz);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String? ru, @HiveField(1)  String? uz)?  $default,) {final _that = this;
switch (_that) {
case _TranslatedModel() when $default != null:
return $default(_that.ru,_that.uz);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslatedModel implements TranslatedModel {
   _TranslatedModel({@HiveField(0) this.ru, @HiveField(1) this.uz});
  factory _TranslatedModel.fromJson(Map<String, dynamic> json) => _$TranslatedModelFromJson(json);

@override@HiveField(0) final  String? ru;
@override@HiveField(1) final  String? uz;

/// Create a copy of TranslatedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslatedModelCopyWith<_TranslatedModel> get copyWith => __$TranslatedModelCopyWithImpl<_TranslatedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslatedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslatedModel&&(identical(other.ru, ru) || other.ru == ru)&&(identical(other.uz, uz) || other.uz == uz));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ru,uz);

@override
String toString() {
  return 'TranslatedModel(ru: $ru, uz: $uz)';
}


}

/// @nodoc
abstract mixin class _$TranslatedModelCopyWith<$Res> implements $TranslatedModelCopyWith<$Res> {
  factory _$TranslatedModelCopyWith(_TranslatedModel value, $Res Function(_TranslatedModel) _then) = __$TranslatedModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String? ru,@HiveField(1) String? uz
});




}
/// @nodoc
class __$TranslatedModelCopyWithImpl<$Res>
    implements _$TranslatedModelCopyWith<$Res> {
  __$TranslatedModelCopyWithImpl(this._self, this._then);

  final _TranslatedModel _self;
  final $Res Function(_TranslatedModel) _then;

/// Create a copy of TranslatedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ru = freezed,Object? uz = freezed,}) {
  return _then(_TranslatedModel(
ru: freezed == ru ? _self.ru : ru // ignore: cast_nullable_to_non_nullable
as String?,uz: freezed == uz ? _self.uz : uz // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
