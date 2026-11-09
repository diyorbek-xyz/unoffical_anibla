// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryResponse {

 List<HistoryItem> get items;@JsonKey(name: "next_cursor") String get nextCursor;@JsonKey(name: "server_time") String get serverTime;
/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryResponseCopyWith<HistoryResponse> get copyWith => _$HistoryResponseCopyWithImpl<HistoryResponse>(this as HistoryResponse, _$identity);

  /// Serializes this HistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nextCursor,serverTime);

@override
String toString() {
  return 'HistoryResponse(items: $items, nextCursor: $nextCursor, serverTime: $serverTime)';
}


}

/// @nodoc
abstract mixin class $HistoryResponseCopyWith<$Res>  {
  factory $HistoryResponseCopyWith(HistoryResponse value, $Res Function(HistoryResponse) _then) = _$HistoryResponseCopyWithImpl;
@useResult
$Res call({
 List<HistoryItem> items,@JsonKey(name: "next_cursor") String nextCursor,@JsonKey(name: "server_time") String serverTime
});




}
/// @nodoc
class _$HistoryResponseCopyWithImpl<$Res>
    implements $HistoryResponseCopyWith<$Res> {
  _$HistoryResponseCopyWithImpl(this._self, this._then);

  final HistoryResponse _self;
  final $Res Function(HistoryResponse) _then;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextCursor = null,Object? serverTime = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,nextCursor: null == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryResponse].
extension HistoryResponsePatterns on HistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _HistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryItem> items, @JsonKey(name: "next_cursor")  String nextCursor, @JsonKey(name: "server_time")  String serverTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
return $default(_that.items,_that.nextCursor,_that.serverTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryItem> items, @JsonKey(name: "next_cursor")  String nextCursor, @JsonKey(name: "server_time")  String serverTime)  $default,) {final _that = this;
switch (_that) {
case _HistoryResponse():
return $default(_that.items,_that.nextCursor,_that.serverTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryItem> items, @JsonKey(name: "next_cursor")  String nextCursor, @JsonKey(name: "server_time")  String serverTime)?  $default,) {final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
return $default(_that.items,_that.nextCursor,_that.serverTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryResponse implements HistoryResponse {
  const _HistoryResponse({final  List<HistoryItem> items = const [], @JsonKey(name: "next_cursor") this.nextCursor = "", @JsonKey(name: "server_time") this.serverTime = ""}): _items = items;
  factory _HistoryResponse.fromJson(Map<String, dynamic> json) => _$HistoryResponseFromJson(json);

 final  List<HistoryItem> _items;
@override@JsonKey() List<HistoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: "next_cursor") final  String nextCursor;
@override@JsonKey(name: "server_time") final  String serverTime;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryResponseCopyWith<_HistoryResponse> get copyWith => __$HistoryResponseCopyWithImpl<_HistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextCursor,serverTime);

@override
String toString() {
  return 'HistoryResponse(items: $items, nextCursor: $nextCursor, serverTime: $serverTime)';
}


}

/// @nodoc
abstract mixin class _$HistoryResponseCopyWith<$Res> implements $HistoryResponseCopyWith<$Res> {
  factory _$HistoryResponseCopyWith(_HistoryResponse value, $Res Function(_HistoryResponse) _then) = __$HistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryItem> items,@JsonKey(name: "next_cursor") String nextCursor,@JsonKey(name: "server_time") String serverTime
});




}
/// @nodoc
class __$HistoryResponseCopyWithImpl<$Res>
    implements _$HistoryResponseCopyWith<$Res> {
  __$HistoryResponseCopyWithImpl(this._self, this._then);

  final _HistoryResponse _self;
  final $Res Function(_HistoryResponse) _then;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = null,Object? serverTime = null,}) {
  return _then(_HistoryResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,nextCursor: null == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
