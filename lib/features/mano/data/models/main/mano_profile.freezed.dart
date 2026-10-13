// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mano_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManoProfile {

@HiveField(0) String get id;@HiveField(1) String get role;@HiveField(2) String get balance;@HiveField(3) int get warning;@HiveField(4) bool get banned;@HiveField(5)@JsonKey(name: "created_at") String get createdDate;@HiveField(6)@JsonKey(name: "external_user_id") int get paymentId;@HiveField(7)@JsonKey(name: "first_name") String get name;@HiveField(8)@JsonKey(name: "phone_number") String get phoneNumber;@HiveField(9)@JsonKey(name: "picture_link") String get avatar;@HiveField(10)@JsonKey(name: "admin_scope") String get adminScope;
/// Create a copy of ManoProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManoProfileCopyWith<ManoProfile> get copyWith => _$ManoProfileCopyWithImpl<ManoProfile>(this as ManoProfile, _$identity);

  /// Serializes this ManoProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManoProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.warning, warning) || other.warning == warning)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.adminScope, adminScope) || other.adminScope == adminScope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,balance,warning,banned,createdDate,paymentId,name,phoneNumber,avatar,adminScope);

@override
String toString() {
  return 'ManoProfile(id: $id, role: $role, balance: $balance, warning: $warning, banned: $banned, createdDate: $createdDate, paymentId: $paymentId, name: $name, phoneNumber: $phoneNumber, avatar: $avatar, adminScope: $adminScope)';
}


}

/// @nodoc
abstract mixin class $ManoProfileCopyWith<$Res>  {
  factory $ManoProfileCopyWith(ManoProfile value, $Res Function(ManoProfile) _then) = _$ManoProfileCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String role,@HiveField(2) String balance,@HiveField(3) int warning,@HiveField(4) bool banned,@HiveField(5)@JsonKey(name: "created_at") String createdDate,@HiveField(6)@JsonKey(name: "external_user_id") int paymentId,@HiveField(7)@JsonKey(name: "first_name") String name,@HiveField(8)@JsonKey(name: "phone_number") String phoneNumber,@HiveField(9)@JsonKey(name: "picture_link") String avatar,@HiveField(10)@JsonKey(name: "admin_scope") String adminScope
});




}
/// @nodoc
class _$ManoProfileCopyWithImpl<$Res>
    implements $ManoProfileCopyWith<$Res> {
  _$ManoProfileCopyWithImpl(this._self, this._then);

  final ManoProfile _self;
  final $Res Function(ManoProfile) _then;

/// Create a copy of ManoProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? balance = null,Object? warning = null,Object? banned = null,Object? createdDate = null,Object? paymentId = null,Object? name = null,Object? phoneNumber = null,Object? avatar = null,Object? adminScope = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,warning: null == warning ? _self.warning : warning // ignore: cast_nullable_to_non_nullable
as int,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,adminScope: null == adminScope ? _self.adminScope : adminScope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManoProfile].
extension ManoProfilePatterns on ManoProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManoProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManoProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManoProfile value)  $default,){
final _that = this;
switch (_that) {
case _ManoProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManoProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ManoProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String role, @HiveField(2)  String balance, @HiveField(3)  int warning, @HiveField(4)  bool banned, @HiveField(5)@JsonKey(name: "created_at")  String createdDate, @HiveField(6)@JsonKey(name: "external_user_id")  int paymentId, @HiveField(7)@JsonKey(name: "first_name")  String name, @HiveField(8)@JsonKey(name: "phone_number")  String phoneNumber, @HiveField(9)@JsonKey(name: "picture_link")  String avatar, @HiveField(10)@JsonKey(name: "admin_scope")  String adminScope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManoProfile() when $default != null:
return $default(_that.id,_that.role,_that.balance,_that.warning,_that.banned,_that.createdDate,_that.paymentId,_that.name,_that.phoneNumber,_that.avatar,_that.adminScope);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String role, @HiveField(2)  String balance, @HiveField(3)  int warning, @HiveField(4)  bool banned, @HiveField(5)@JsonKey(name: "created_at")  String createdDate, @HiveField(6)@JsonKey(name: "external_user_id")  int paymentId, @HiveField(7)@JsonKey(name: "first_name")  String name, @HiveField(8)@JsonKey(name: "phone_number")  String phoneNumber, @HiveField(9)@JsonKey(name: "picture_link")  String avatar, @HiveField(10)@JsonKey(name: "admin_scope")  String adminScope)  $default,) {final _that = this;
switch (_that) {
case _ManoProfile():
return $default(_that.id,_that.role,_that.balance,_that.warning,_that.banned,_that.createdDate,_that.paymentId,_that.name,_that.phoneNumber,_that.avatar,_that.adminScope);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String role, @HiveField(2)  String balance, @HiveField(3)  int warning, @HiveField(4)  bool banned, @HiveField(5)@JsonKey(name: "created_at")  String createdDate, @HiveField(6)@JsonKey(name: "external_user_id")  int paymentId, @HiveField(7)@JsonKey(name: "first_name")  String name, @HiveField(8)@JsonKey(name: "phone_number")  String phoneNumber, @HiveField(9)@JsonKey(name: "picture_link")  String avatar, @HiveField(10)@JsonKey(name: "admin_scope")  String adminScope)?  $default,) {final _that = this;
switch (_that) {
case _ManoProfile() when $default != null:
return $default(_that.id,_that.role,_that.balance,_that.warning,_that.banned,_that.createdDate,_that.paymentId,_that.name,_that.phoneNumber,_that.avatar,_that.adminScope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManoProfile extends ManoProfile {
  const _ManoProfile({@HiveField(0) this.id = "", @HiveField(1) this.role = "", @HiveField(2) this.balance = "0.0", @HiveField(3) this.warning = 0, @HiveField(4) this.banned = false, @HiveField(5)@JsonKey(name: "created_at") this.createdDate = "", @HiveField(6)@JsonKey(name: "external_user_id") this.paymentId = 0, @HiveField(7)@JsonKey(name: "first_name") this.name = "", @HiveField(8)@JsonKey(name: "phone_number") this.phoneNumber = "", @HiveField(9)@JsonKey(name: "picture_link") this.avatar = "", @HiveField(10)@JsonKey(name: "admin_scope") this.adminScope = ""}): super._();
  factory _ManoProfile.fromJson(Map<String, dynamic> json) => _$ManoProfileFromJson(json);

@override@JsonKey()@HiveField(0) final  String id;
@override@JsonKey()@HiveField(1) final  String role;
@override@JsonKey()@HiveField(2) final  String balance;
@override@JsonKey()@HiveField(3) final  int warning;
@override@JsonKey()@HiveField(4) final  bool banned;
@override@HiveField(5)@JsonKey(name: "created_at") final  String createdDate;
@override@HiveField(6)@JsonKey(name: "external_user_id") final  int paymentId;
@override@HiveField(7)@JsonKey(name: "first_name") final  String name;
@override@HiveField(8)@JsonKey(name: "phone_number") final  String phoneNumber;
@override@HiveField(9)@JsonKey(name: "picture_link") final  String avatar;
@override@HiveField(10)@JsonKey(name: "admin_scope") final  String adminScope;

/// Create a copy of ManoProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManoProfileCopyWith<_ManoProfile> get copyWith => __$ManoProfileCopyWithImpl<_ManoProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManoProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManoProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.warning, warning) || other.warning == warning)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.adminScope, adminScope) || other.adminScope == adminScope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,balance,warning,banned,createdDate,paymentId,name,phoneNumber,avatar,adminScope);

@override
String toString() {
  return 'ManoProfile(id: $id, role: $role, balance: $balance, warning: $warning, banned: $banned, createdDate: $createdDate, paymentId: $paymentId, name: $name, phoneNumber: $phoneNumber, avatar: $avatar, adminScope: $adminScope)';
}


}

/// @nodoc
abstract mixin class _$ManoProfileCopyWith<$Res> implements $ManoProfileCopyWith<$Res> {
  factory _$ManoProfileCopyWith(_ManoProfile value, $Res Function(_ManoProfile) _then) = __$ManoProfileCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String role,@HiveField(2) String balance,@HiveField(3) int warning,@HiveField(4) bool banned,@HiveField(5)@JsonKey(name: "created_at") String createdDate,@HiveField(6)@JsonKey(name: "external_user_id") int paymentId,@HiveField(7)@JsonKey(name: "first_name") String name,@HiveField(8)@JsonKey(name: "phone_number") String phoneNumber,@HiveField(9)@JsonKey(name: "picture_link") String avatar,@HiveField(10)@JsonKey(name: "admin_scope") String adminScope
});




}
/// @nodoc
class __$ManoProfileCopyWithImpl<$Res>
    implements _$ManoProfileCopyWith<$Res> {
  __$ManoProfileCopyWithImpl(this._self, this._then);

  final _ManoProfile _self;
  final $Res Function(_ManoProfile) _then;

/// Create a copy of ManoProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? balance = null,Object? warning = null,Object? banned = null,Object? createdDate = null,Object? paymentId = null,Object? name = null,Object? phoneNumber = null,Object? avatar = null,Object? adminScope = null,}) {
  return _then(_ManoProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,warning: null == warning ? _self.warning : warning // ignore: cast_nullable_to_non_nullable
as int,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,adminScope: null == adminScope ? _self.adminScope : adminScope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
