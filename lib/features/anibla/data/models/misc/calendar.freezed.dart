// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Calendar {

@HiveField(0) Pagination get pagination;@HiveField(1) List<Timer> get timers;@HiveField(2) String get date;
/// Create a copy of Calendar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarCopyWith<Calendar> get copyWith => _$CalendarCopyWithImpl<Calendar>(this as Calendar, _$identity);

  /// Serializes this Calendar to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Calendar&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.timers, timers)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(timers),date);

@override
String toString() {
  return 'Calendar(pagination: $pagination, timers: $timers, date: $date)';
}


}

/// @nodoc
abstract mixin class $CalendarCopyWith<$Res>  {
  factory $CalendarCopyWith(Calendar value, $Res Function(Calendar) _then) = _$CalendarCopyWithImpl;
@useResult
$Res call({
@HiveField(0) Pagination pagination,@HiveField(1) List<Timer> timers,@HiveField(2) String date
});


$PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$CalendarCopyWithImpl<$Res>
    implements $CalendarCopyWith<$Res> {
  _$CalendarCopyWithImpl(this._self, this._then);

  final Calendar _self;
  final $Res Function(Calendar) _then;

/// Create a copy of Calendar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pagination = null,Object? timers = null,Object? date = null,}) {
  return _then(_self.copyWith(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,timers: null == timers ? _self.timers : timers // ignore: cast_nullable_to_non_nullable
as List<Timer>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Calendar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [Calendar].
extension CalendarPatterns on Calendar {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Calendar value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Calendar() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Calendar value)  $default,){
final _that = this;
switch (_that) {
case _Calendar():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Calendar value)?  $default,){
final _that = this;
switch (_that) {
case _Calendar() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  Pagination pagination, @HiveField(1)  List<Timer> timers, @HiveField(2)  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Calendar() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  Pagination pagination, @HiveField(1)  List<Timer> timers, @HiveField(2)  String date)  $default,) {final _that = this;
switch (_that) {
case _Calendar():
return $default(_that.pagination,_that.timers,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  Pagination pagination, @HiveField(1)  List<Timer> timers, @HiveField(2)  String date)?  $default,) {final _that = this;
switch (_that) {
case _Calendar() when $default != null:
return $default(_that.pagination,_that.timers,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Calendar implements Calendar {
  const _Calendar({@HiveField(0) this.pagination = const Pagination(), @HiveField(1) final  List<Timer> timers = const [], @HiveField(2) this.date = ""}): _timers = timers;
  factory _Calendar.fromJson(Map<String, dynamic> json) => _$CalendarFromJson(json);

@override@JsonKey()@HiveField(0) final  Pagination pagination;
 final  List<Timer> _timers;
@override@JsonKey()@HiveField(1) List<Timer> get timers {
  if (_timers is EqualUnmodifiableListView) return _timers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timers);
}

@override@JsonKey()@HiveField(2) final  String date;

/// Create a copy of Calendar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarCopyWith<_Calendar> get copyWith => __$CalendarCopyWithImpl<_Calendar>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Calendar&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other._timers, _timers)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(_timers),date);

@override
String toString() {
  return 'Calendar(pagination: $pagination, timers: $timers, date: $date)';
}


}

/// @nodoc
abstract mixin class _$CalendarCopyWith<$Res> implements $CalendarCopyWith<$Res> {
  factory _$CalendarCopyWith(_Calendar value, $Res Function(_Calendar) _then) = __$CalendarCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) Pagination pagination,@HiveField(1) List<Timer> timers,@HiveField(2) String date
});


@override $PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$CalendarCopyWithImpl<$Res>
    implements _$CalendarCopyWith<$Res> {
  __$CalendarCopyWithImpl(this._self, this._then);

  final _Calendar _self;
  final $Res Function(_Calendar) _then;

/// Create a copy of Calendar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pagination = null,Object? timers = null,Object? date = null,}) {
  return _then(_Calendar(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,timers: null == timers ? _self._timers : timers // ignore: cast_nullable_to_non_nullable
as List<Timer>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Calendar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
