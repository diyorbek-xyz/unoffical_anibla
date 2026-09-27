// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Session {

@HiveField(0)@JsonKey(name: "_id") String get id;@HiveField(1)@JsonKey(name: "user_id") String get userId;@HiveField(2)@JsonKey(name: "token_id") String get tokenId;@HiveField(5)@JsonKey(name: "last_login") String get lastLogin;@HiveField(6)@JsonKey(name: "last_login_ip") String get lastIp;@HiveField(7)@JsonKey(name: "platform_os") String get platform;@HiveField(3) String get device;@HiveField(4) String get ip;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.lastIp, lastIp) || other.lastIp == lastIp)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.device, device) || other.device == device)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,tokenId,lastLogin,lastIp,platform,device,ip);

@override
String toString() {
  return 'Session(id: $id, userId: $userId, tokenId: $tokenId, lastLogin: $lastLogin, lastIp: $lastIp, platform: $platform, device: $device, ip: $ip)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String id,@HiveField(1)@JsonKey(name: "user_id") String userId,@HiveField(2)@JsonKey(name: "token_id") String tokenId,@HiveField(5)@JsonKey(name: "last_login") String lastLogin,@HiveField(6)@JsonKey(name: "last_login_ip") String lastIp,@HiveField(7)@JsonKey(name: "platform_os") String platform,@HiveField(3) String device,@HiveField(4) String ip
});




}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? tokenId = null,Object? lastLogin = null,Object? lastIp = null,Object? platform = null,Object? device = null,Object? ip = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,lastLogin: null == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String,lastIp: null == lastIp ? _self.lastIp : lastIp // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(name: "user_id")  String userId, @HiveField(2)@JsonKey(name: "token_id")  String tokenId, @HiveField(5)@JsonKey(name: "last_login")  String lastLogin, @HiveField(6)@JsonKey(name: "last_login_ip")  String lastIp, @HiveField(7)@JsonKey(name: "platform_os")  String platform, @HiveField(3)  String device, @HiveField(4)  String ip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(name: "user_id")  String userId, @HiveField(2)@JsonKey(name: "token_id")  String tokenId, @HiveField(5)@JsonKey(name: "last_login")  String lastLogin, @HiveField(6)@JsonKey(name: "last_login_ip")  String lastIp, @HiveField(7)@JsonKey(name: "platform_os")  String platform, @HiveField(3)  String device, @HiveField(4)  String ip)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.id,_that.userId,_that.tokenId,_that.lastLogin,_that.lastIp,_that.platform,_that.device,_that.ip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "_id")  String id, @HiveField(1)@JsonKey(name: "user_id")  String userId, @HiveField(2)@JsonKey(name: "token_id")  String tokenId, @HiveField(5)@JsonKey(name: "last_login")  String lastLogin, @HiveField(6)@JsonKey(name: "last_login_ip")  String lastIp, @HiveField(7)@JsonKey(name: "platform_os")  String platform, @HiveField(3)  String device, @HiveField(4)  String ip)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.userId,_that.tokenId,_that.lastLogin,_that.lastIp,_that.platform,_that.device,_that.ip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Session implements Session {
   _Session({@HiveField(0)@JsonKey(name: "_id") this.id = "", @HiveField(1)@JsonKey(name: "user_id") this.userId = "", @HiveField(2)@JsonKey(name: "token_id") this.tokenId = "", @HiveField(5)@JsonKey(name: "last_login") this.lastLogin = "", @HiveField(6)@JsonKey(name: "last_login_ip") this.lastIp = "", @HiveField(7)@JsonKey(name: "platform_os") this.platform = "", @HiveField(3) this.device = "", @HiveField(4) this.ip = ""});
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override@HiveField(0)@JsonKey(name: "_id") final  String id;
@override@HiveField(1)@JsonKey(name: "user_id") final  String userId;
@override@HiveField(2)@JsonKey(name: "token_id") final  String tokenId;
@override@HiveField(5)@JsonKey(name: "last_login") final  String lastLogin;
@override@HiveField(6)@JsonKey(name: "last_login_ip") final  String lastIp;
@override@HiveField(7)@JsonKey(name: "platform_os") final  String platform;
@override@JsonKey()@HiveField(3) final  String device;
@override@JsonKey()@HiveField(4) final  String ip;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.lastIp, lastIp) || other.lastIp == lastIp)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.device, device) || other.device == device)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,tokenId,lastLogin,lastIp,platform,device,ip);

@override
String toString() {
  return 'Session(id: $id, userId: $userId, tokenId: $tokenId, lastLogin: $lastLogin, lastIp: $lastIp, platform: $platform, device: $device, ip: $ip)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "_id") String id,@HiveField(1)@JsonKey(name: "user_id") String userId,@HiveField(2)@JsonKey(name: "token_id") String tokenId,@HiveField(5)@JsonKey(name: "last_login") String lastLogin,@HiveField(6)@JsonKey(name: "last_login_ip") String lastIp,@HiveField(7)@JsonKey(name: "platform_os") String platform,@HiveField(3) String device,@HiveField(4) String ip
});




}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? tokenId = null,Object? lastLogin = null,Object? lastIp = null,Object? platform = null,Object? device = null,Object? ip = null,}) {
  return _then(_Session(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,lastLogin: null == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String,lastIp: null == lastIp ? _self.lastIp : lastIp // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Sessions {

@HiveField(0)@JsonKey(name: "token_id") String get tokenId;@HiveField(1) String get name;@HiveField(2) int get total;@HiveField(3) List<Session> get sessions;
/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsCopyWith<Sessions> get copyWith => _$SessionsCopyWithImpl<Sessions>(this as Sessions, _$identity);

  /// Serializes this Sessions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sessions&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,name,total,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'Sessions(tokenId: $tokenId, name: $name, total: $total, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SessionsCopyWith<$Res>  {
  factory $SessionsCopyWith(Sessions value, $Res Function(Sessions) _then) = _$SessionsCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: "token_id") String tokenId,@HiveField(1) String name,@HiveField(2) int total,@HiveField(3) List<Session> sessions
});




}
/// @nodoc
class _$SessionsCopyWithImpl<$Res>
    implements $SessionsCopyWith<$Res> {
  _$SessionsCopyWithImpl(this._self, this._then);

  final Sessions _self;
  final $Res Function(Sessions) _then;

/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = null,Object? name = null,Object? total = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sessions].
extension SessionsPatterns on Sessions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sessions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sessions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sessions value)  $default,){
final _that = this;
switch (_that) {
case _Sessions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sessions value)?  $default,){
final _that = this;
switch (_that) {
case _Sessions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "token_id")  String tokenId, @HiveField(1)  String name, @HiveField(2)  int total, @HiveField(3)  List<Session> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sessions() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: "token_id")  String tokenId, @HiveField(1)  String name, @HiveField(2)  int total, @HiveField(3)  List<Session> sessions)  $default,) {final _that = this;
switch (_that) {
case _Sessions():
return $default(_that.tokenId,_that.name,_that.total,_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: "token_id")  String tokenId, @HiveField(1)  String name, @HiveField(2)  int total, @HiveField(3)  List<Session> sessions)?  $default,) {final _that = this;
switch (_that) {
case _Sessions() when $default != null:
return $default(_that.tokenId,_that.name,_that.total,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sessions implements Sessions {
   _Sessions({@HiveField(0)@JsonKey(name: "token_id") this.tokenId = "", @HiveField(1) this.name = "", @HiveField(2) this.total = 0, @HiveField(3) final  List<Session> sessions = const []}): _sessions = sessions;
  factory _Sessions.fromJson(Map<String, dynamic> json) => _$SessionsFromJson(json);

@override@HiveField(0)@JsonKey(name: "token_id") final  String tokenId;
@override@JsonKey()@HiveField(1) final  String name;
@override@JsonKey()@HiveField(2) final  int total;
 final  List<Session> _sessions;
@override@JsonKey()@HiveField(3) List<Session> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionsCopyWith<_Sessions> get copyWith => __$SessionsCopyWithImpl<_Sessions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sessions&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,name,total,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'Sessions(tokenId: $tokenId, name: $name, total: $total, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$SessionsCopyWith<$Res> implements $SessionsCopyWith<$Res> {
  factory _$SessionsCopyWith(_Sessions value, $Res Function(_Sessions) _then) = __$SessionsCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: "token_id") String tokenId,@HiveField(1) String name,@HiveField(2) int total,@HiveField(3) List<Session> sessions
});




}
/// @nodoc
class __$SessionsCopyWithImpl<$Res>
    implements _$SessionsCopyWith<$Res> {
  __$SessionsCopyWithImpl(this._self, this._then);

  final _Sessions _self;
  final $Res Function(_Sessions) _then;

/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? name = null,Object? total = null,Object? sessions = null,}) {
  return _then(_Sessions(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}


}

// dart format on
