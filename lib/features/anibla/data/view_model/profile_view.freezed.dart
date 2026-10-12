// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileView {

 String get name; String get email; String get phoneNumber; String get createdAt; String get paymentId; String get balance; String get id; String get role; String get avatar; String get tokenId; bool get hasSubscription; DataType get type;
/// Create a copy of ProfileView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileViewCopyWith<ProfileView> get copyWith => _$ProfileViewCopyWithImpl<ProfileView>(this as ProfileView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileView&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.hasSubscription, hasSubscription) || other.hasSubscription == hasSubscription)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,phoneNumber,createdAt,paymentId,balance,id,role,avatar,tokenId,hasSubscription,type);

@override
String toString() {
  return 'ProfileView(name: $name, email: $email, phoneNumber: $phoneNumber, createdAt: $createdAt, paymentId: $paymentId, balance: $balance, id: $id, role: $role, avatar: $avatar, tokenId: $tokenId, hasSubscription: $hasSubscription, type: $type)';
}


}

/// @nodoc
abstract mixin class $ProfileViewCopyWith<$Res>  {
  factory $ProfileViewCopyWith(ProfileView value, $Res Function(ProfileView) _then) = _$ProfileViewCopyWithImpl;
@useResult
$Res call({
 String name, String email, String phoneNumber, String createdAt, String paymentId, String balance, String id, String role, String avatar, String tokenId, bool hasSubscription, DataType type
});




}
/// @nodoc
class _$ProfileViewCopyWithImpl<$Res>
    implements $ProfileViewCopyWith<$Res> {
  _$ProfileViewCopyWithImpl(this._self, this._then);

  final ProfileView _self;
  final $Res Function(ProfileView) _then;

/// Create a copy of ProfileView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? phoneNumber = null,Object? createdAt = null,Object? paymentId = null,Object? balance = null,Object? id = null,Object? role = null,Object? avatar = null,Object? tokenId = null,Object? hasSubscription = null,Object? type = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,hasSubscription: null == hasSubscription ? _self.hasSubscription : hasSubscription // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DataType,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileView].
extension ProfileViewPatterns on ProfileView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileView value)  $default,){
final _that = this;
switch (_that) {
case _ProfileView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileView value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String phoneNumber,  String createdAt,  String paymentId,  String balance,  String id,  String role,  String avatar,  String tokenId,  bool hasSubscription,  DataType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileView() when $default != null:
return $default(_that.name,_that.email,_that.phoneNumber,_that.createdAt,_that.paymentId,_that.balance,_that.id,_that.role,_that.avatar,_that.tokenId,_that.hasSubscription,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String phoneNumber,  String createdAt,  String paymentId,  String balance,  String id,  String role,  String avatar,  String tokenId,  bool hasSubscription,  DataType type)  $default,) {final _that = this;
switch (_that) {
case _ProfileView():
return $default(_that.name,_that.email,_that.phoneNumber,_that.createdAt,_that.paymentId,_that.balance,_that.id,_that.role,_that.avatar,_that.tokenId,_that.hasSubscription,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String phoneNumber,  String createdAt,  String paymentId,  String balance,  String id,  String role,  String avatar,  String tokenId,  bool hasSubscription,  DataType type)?  $default,) {final _that = this;
switch (_that) {
case _ProfileView() when $default != null:
return $default(_that.name,_that.email,_that.phoneNumber,_that.createdAt,_that.paymentId,_that.balance,_that.id,_that.role,_that.avatar,_that.tokenId,_that.hasSubscription,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileView implements ProfileView {
  const _ProfileView({this.name = "Mavjud emas", this.email = "Mavjud emas", this.phoneNumber = "Mavjud emas", this.createdAt = "Noma'lum", this.paymentId = "Noma'lum", this.balance = "0 so'm", this.id = "", this.role = "", this.avatar = "", this.tokenId = "", this.hasSubscription = false, this.type = DataType.anibla});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String paymentId;
@override@JsonKey() final  String balance;
@override@JsonKey() final  String id;
@override@JsonKey() final  String role;
@override@JsonKey() final  String avatar;
@override@JsonKey() final  String tokenId;
@override@JsonKey() final  bool hasSubscription;
@override@JsonKey() final  DataType type;

/// Create a copy of ProfileView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileViewCopyWith<_ProfileView> get copyWith => __$ProfileViewCopyWithImpl<_ProfileView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileView&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.hasSubscription, hasSubscription) || other.hasSubscription == hasSubscription)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,phoneNumber,createdAt,paymentId,balance,id,role,avatar,tokenId,hasSubscription,type);

@override
String toString() {
  return 'ProfileView(name: $name, email: $email, phoneNumber: $phoneNumber, createdAt: $createdAt, paymentId: $paymentId, balance: $balance, id: $id, role: $role, avatar: $avatar, tokenId: $tokenId, hasSubscription: $hasSubscription, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ProfileViewCopyWith<$Res> implements $ProfileViewCopyWith<$Res> {
  factory _$ProfileViewCopyWith(_ProfileView value, $Res Function(_ProfileView) _then) = __$ProfileViewCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String phoneNumber, String createdAt, String paymentId, String balance, String id, String role, String avatar, String tokenId, bool hasSubscription, DataType type
});




}
/// @nodoc
class __$ProfileViewCopyWithImpl<$Res>
    implements _$ProfileViewCopyWith<$Res> {
  __$ProfileViewCopyWithImpl(this._self, this._then);

  final _ProfileView _self;
  final $Res Function(_ProfileView) _then;

/// Create a copy of ProfileView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phoneNumber = null,Object? createdAt = null,Object? paymentId = null,Object? balance = null,Object? id = null,Object? role = null,Object? avatar = null,Object? tokenId = null,Object? hasSubscription = null,Object? type = null,}) {
  return _then(_ProfileView(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,hasSubscription: null == hasSubscription ? _self.hasSubscription : hasSubscription // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DataType,
  ));
}


}

// dart format on
