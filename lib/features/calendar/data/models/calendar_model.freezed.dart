// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarModel {

@HiveField(0) Pagination? get pagination;@HiveField(1) List<TimerModel>? get timers;@HiveField(2) DateTime? get date;
/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarModelCopyWith<CalendarModel> get copyWith => _$CalendarModelCopyWithImpl<CalendarModel>(this as CalendarModel, _$identity);

  /// Serializes this CalendarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarModel&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.timers, timers)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(timers),date);

@override
String toString() {
  return 'CalendarModel(pagination: $pagination, timers: $timers, date: $date)';
}


}

/// @nodoc
abstract mixin class $CalendarModelCopyWith<$Res>  {
  factory $CalendarModelCopyWith(CalendarModel value, $Res Function(CalendarModel) _then) = _$CalendarModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) Pagination? pagination,@HiveField(1) List<TimerModel>? timers,@HiveField(2) DateTime? date
});




}
/// @nodoc
class _$CalendarModelCopyWithImpl<$Res>
    implements $CalendarModelCopyWith<$Res> {
  _$CalendarModelCopyWithImpl(this._self, this._then);

  final CalendarModel _self;
  final $Res Function(CalendarModel) _then;

/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pagination = freezed,Object? timers = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,timers: freezed == timers ? _self.timers : timers // ignore: cast_nullable_to_non_nullable
as List<TimerModel>?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarModel].
extension CalendarModelPatterns on CalendarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarModel value)  $default,){
final _that = this;
switch (_that) {
case _CalendarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarModel value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  Pagination? pagination, @HiveField(1)  List<TimerModel>? timers, @HiveField(2)  DateTime? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
return $default(_that.pagination,_that.timers,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  Pagination? pagination, @HiveField(1)  List<TimerModel>? timers, @HiveField(2)  DateTime? date)  $default,) {final _that = this;
switch (_that) {
case _CalendarModel():
return $default(_that.pagination,_that.timers,_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  Pagination? pagination, @HiveField(1)  List<TimerModel>? timers, @HiveField(2)  DateTime? date)?  $default,) {final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
return $default(_that.pagination,_that.timers,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarModel implements CalendarModel {
   _CalendarModel({@HiveField(0) this.pagination, @HiveField(1) final  List<TimerModel>? timers, @HiveField(2) this.date}): _timers = timers;
  factory _CalendarModel.fromJson(Map<String, dynamic> json) => _$CalendarModelFromJson(json);

@override@HiveField(0) final  Pagination? pagination;
 final  List<TimerModel>? _timers;
@override@HiveField(1) List<TimerModel>? get timers {
  final value = _timers;
  if (value == null) return null;
  if (_timers is EqualUnmodifiableListView) return _timers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(2) final  DateTime? date;

/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarModelCopyWith<_CalendarModel> get copyWith => __$CalendarModelCopyWithImpl<_CalendarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarModel&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other._timers, _timers)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(_timers),date);

@override
String toString() {
  return 'CalendarModel(pagination: $pagination, timers: $timers, date: $date)';
}


}

/// @nodoc
abstract mixin class _$CalendarModelCopyWith<$Res> implements $CalendarModelCopyWith<$Res> {
  factory _$CalendarModelCopyWith(_CalendarModel value, $Res Function(_CalendarModel) _then) = __$CalendarModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) Pagination? pagination,@HiveField(1) List<TimerModel>? timers,@HiveField(2) DateTime? date
});




}
/// @nodoc
class __$CalendarModelCopyWithImpl<$Res>
    implements _$CalendarModelCopyWith<$Res> {
  __$CalendarModelCopyWithImpl(this._self, this._then);

  final _CalendarModel _self;
  final $Res Function(_CalendarModel) _then;

/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pagination = freezed,Object? timers = freezed,Object? date = freezed,}) {
  return _then(_CalendarModel(
pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,timers: freezed == timers ? _self._timers : timers // ignore: cast_nullable_to_non_nullable
as List<TimerModel>?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
