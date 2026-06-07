// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {

@HiveField(0)@JsonKey(name: "_id") String? get id;@HiveField(1)@JsonKey(name: "user_id") String? get userId;@HiveField(2)@JsonKey(name: "token_id") String? get tokenId;@HiveField(5)@JsonKey(name: "last_login") DateTime? get lastLogin;@HiveField(6)@JsonKey(name: "last_login_ip") String? get lastIp;@HiveField(7)@JsonKey(name: "platform_os") String? get platform;@HiveField(3) String? get device;@HiveField(4) String? get ip;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.lastIp, lastIp) || other.lastIp == lastIp)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.device, device) || other.device == device)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,tokenId,lastLogin,lastIp,platform,device,ip);

@override
String toString() {
  return 'SessionModel(id: $id, userId: $userId, tokenId: $tokenId, lastLogin: $lastLogin, lastIp: $lastIp, platform: $platform, device: $device, ip: $ip)';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1)@JsonKey(name: "user_id") String? userId,@HiveField(2)@JsonKey(name: "token_id") String? tokenId,@HiveField(5)@JsonKey(name: "last_login") DateTime? lastLogin,@HiveField(6)@JsonKey(name: "last_login_ip") String? lastIp,@HiveField(7)@JsonKey(name: "platform_os") String? platform,@HiveField(3) String? device,@HiveField(4) String? ip
});




}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? tokenId = freezed,Object? lastLogin = freezed,Object? lastIp = freezed,Object? platform = freezed,Object? device = freezed,Object? ip = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,tokenId: freezed == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String?,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,lastIp: freezed == lastIp ? _self.lastIp : lastIp // ignore: cast_nullable_to_non_nullable
as String?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)@JsonKey(name: "user_id")  String? userId, @HiveField(2)@JsonKey(name: "token_id")  String? tokenId, @HiveField(5)@JsonKey(name: "last_login")  DateTime? lastLogin, @HiveField(6)@JsonKey(name: "last_login_ip")  String? lastIp, @HiveField(7)@JsonKey(name: "platform_os")  String? platform, @HiveField(3)  String? device, @HiveField(4)  String? ip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.id,_that.userId,_that.tokenId,_that.lastLogin,_that.lastIp,_that.platform,_that.device,_that.ip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)@JsonKey(name: "user_id")  String? userId, @HiveField(2)@JsonKey(name: "token_id")  String? tokenId, @HiveField(5)@JsonKey(name: "last_login")  DateTime? lastLogin, @HiveField(6)@JsonKey(name: "last_login_ip")  String? lastIp, @HiveField(7)@JsonKey(name: "platform_os")  String? platform, @HiveField(3)  String? device, @HiveField(4)  String? ip)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.id,_that.userId,_that.tokenId,_that.lastLogin,_that.lastIp,_that.platform,_that.device,_that.ip);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String? id, @HiveField(1)@JsonKey(name: "user_id")  String? userId, @HiveField(2)@JsonKey(name: "token_id")  String? tokenId, @HiveField(5)@JsonKey(name: "last_login")  DateTime? lastLogin, @HiveField(6)@JsonKey(name: "last_login_ip")  String? lastIp, @HiveField(7)@JsonKey(name: "platform_os")  String? platform, @HiveField(3)  String? device, @HiveField(4)  String? ip)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.id,_that.userId,_that.tokenId,_that.lastLogin,_that.lastIp,_that.platform,_that.device,_that.ip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionModel implements SessionModel {
   _SessionModel({@HiveField(0)@JsonKey(name: "_id") this.id, @HiveField(1)@JsonKey(name: "user_id") this.userId, @HiveField(2)@JsonKey(name: "token_id") this.tokenId, @HiveField(5)@JsonKey(name: "last_login") this.lastLogin, @HiveField(6)@JsonKey(name: "last_login_ip") this.lastIp, @HiveField(7)@JsonKey(name: "platform_os") this.platform, @HiveField(3) this.device, @HiveField(4) this.ip});
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String? id;
@override@HiveField(1)@JsonKey(name: "user_id") final  String? userId;
@override@HiveField(2)@JsonKey(name: "token_id") final  String? tokenId;
@override@HiveField(5)@JsonKey(name: "last_login") final  DateTime? lastLogin;
@override@HiveField(6)@JsonKey(name: "last_login_ip") final  String? lastIp;
@override@HiveField(7)@JsonKey(name: "platform_os") final  String? platform;
@override@HiveField(3) final  String? device;
@override@HiveField(4) final  String? ip;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.lastIp, lastIp) || other.lastIp == lastIp)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.device, device) || other.device == device)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,tokenId,lastLogin,lastIp,platform,device,ip);

@override
String toString() {
  return 'SessionModel(id: $id, userId: $userId, tokenId: $tokenId, lastLogin: $lastLogin, lastIp: $lastIp, platform: $platform, device: $device, ip: $ip)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String? id,@HiveField(1)@JsonKey(name: "user_id") String? userId,@HiveField(2)@JsonKey(name: "token_id") String? tokenId,@HiveField(5)@JsonKey(name: "last_login") DateTime? lastLogin,@HiveField(6)@JsonKey(name: "last_login_ip") String? lastIp,@HiveField(7)@JsonKey(name: "platform_os") String? platform,@HiveField(3) String? device,@HiveField(4) String? ip
});




}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? tokenId = freezed,Object? lastLogin = freezed,Object? lastIp = freezed,Object? platform = freezed,Object? device = freezed,Object? ip = freezed,}) {
  return _then(_SessionModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,tokenId: freezed == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String?,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,lastIp: freezed == lastIp ? _self.lastIp : lastIp // ignore: cast_nullable_to_non_nullable
as String?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SessionsModel {

@HiveField(0)@JsonKey(name: "token_id") String? get tokenId;@HiveField(1) String? get name;@HiveField(2) int? get total;@HiveField(3) List<SessionModel>? get sessions;
/// Create a copy of SessionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsModelCopyWith<SessionsModel> get copyWith => _$SessionsModelCopyWithImpl<SessionsModel>(this as SessionsModel, _$identity);

  /// Serializes this SessionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsModel&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,name,total,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'SessionsModel(tokenId: $tokenId, name: $name, total: $total, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SessionsModelCopyWith<$Res>  {
  factory $SessionsModelCopyWith(SessionsModel value, $Res Function(SessionsModel) _then) = _$SessionsModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "token_id") String? tokenId,@HiveField(1) String? name,@HiveField(2) int? total,@HiveField(3) List<SessionModel>? sessions
});




}
/// @nodoc
class _$SessionsModelCopyWithImpl<$Res>
    implements $SessionsModelCopyWith<$Res> {
  _$SessionsModelCopyWithImpl(this._self, this._then);

  final SessionsModel _self;
  final $Res Function(SessionsModel) _then;

/// Create a copy of SessionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = freezed,Object? name = freezed,Object? total = freezed,Object? sessions = freezed,}) {
  return _then(_self.copyWith(
tokenId: freezed == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sessions: freezed == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionsModel].
extension SessionsModelPatterns on SessionsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionsModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "token_id")  String? tokenId, @HiveField(1)  String? name, @HiveField(2)  int? total, @HiveField(3)  List<SessionModel>? sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionsModel() when $default != null:
return $default(_that.tokenId,_that.name,_that.total,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "token_id")  String? tokenId, @HiveField(1)  String? name, @HiveField(2)  int? total, @HiveField(3)  List<SessionModel>? sessions)  $default,) {final _that = this;
switch (_that) {
case _SessionsModel():
return $default(_that.tokenId,_that.name,_that.total,_that.sessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "token_id")  String? tokenId, @HiveField(1)  String? name, @HiveField(2)  int? total, @HiveField(3)  List<SessionModel>? sessions)?  $default,) {final _that = this;
switch (_that) {
case _SessionsModel() when $default != null:
return $default(_that.tokenId,_that.name,_that.total,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionsModel implements SessionsModel {
   _SessionsModel({@HiveField(0)@JsonKey(name: "token_id") this.tokenId, @HiveField(1) this.name, @HiveField(2) this.total, @HiveField(3) final  List<SessionModel>? sessions}): _sessions = sessions;
  factory _SessionsModel.fromJson(Map<String, dynamic> json) => _$SessionsModelFromJson(json);

@override@HiveField(0)@JsonKey(name: "token_id") final  String? tokenId;
@override@HiveField(1) final  String? name;
@override@HiveField(2) final  int? total;
 final  List<SessionModel>? _sessions;
@override@HiveField(3) List<SessionModel>? get sessions {
  final value = _sessions;
  if (value == null) return null;
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SessionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionsModelCopyWith<_SessionsModel> get copyWith => __$SessionsModelCopyWithImpl<_SessionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionsModel&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,name,total,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'SessionsModel(tokenId: $tokenId, name: $name, total: $total, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$SessionsModelCopyWith<$Res> implements $SessionsModelCopyWith<$Res> {
  factory _$SessionsModelCopyWith(_SessionsModel value, $Res Function(_SessionsModel) _then) = __$SessionsModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "token_id") String? tokenId,@HiveField(1) String? name,@HiveField(2) int? total,@HiveField(3) List<SessionModel>? sessions
});




}
/// @nodoc
class __$SessionsModelCopyWithImpl<$Res>
    implements _$SessionsModelCopyWith<$Res> {
  __$SessionsModelCopyWithImpl(this._self, this._then);

  final _SessionsModel _self;
  final $Res Function(_SessionsModel) _then;

/// Create a copy of SessionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenId = freezed,Object? name = freezed,Object? total = freezed,Object? sessions = freezed,}) {
  return _then(_SessionsModel(
tokenId: freezed == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sessions: freezed == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionModel>?,
  ));
}


}

// dart format on
