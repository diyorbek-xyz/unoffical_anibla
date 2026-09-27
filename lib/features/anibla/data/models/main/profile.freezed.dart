// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {

@HiveField(1) String get createdAt;@HiveField(2) String get name;@HiveField(3) String get email;@HiveField(4) double get balance;@HiveField(5) dynamic get subscription;@HiveField(6) String get role;@HiveField(7) bool get activated;@HiveField(8) List get transactions;@HiveField(9) String get updatedAt;@HiveField(10) List<Session> get sessions;@HiveField(11) int get total;@HiveField(12)@JsonKey(name: "apple_id") String get appleId;@HiveField(13)@JsonKey(name: "_id") String get id;@HiveField(14)@JsonKey(name: "unique_id") int get paymentId;@HiveField(15)@JsonKey(name: "phone_number") int get phoneNumber;@HiveField(16)@JsonKey(name: "created_by_admin") bool get createdByAdmin;@HiveField(17)@JsonKey(name: "telegram_token") String get telegramToken;@HiveField(18)@JsonKey(name: "email_lc") String get emailLC;@HiveField(19)@JsonKey(name: "last_anime_type") String get lastAnimeType;@HiveField(20)@JsonKey(name: "name_lc") String get nameLC;@HiveField(21)@JsonKey(name: "phone_str") String get phoneStr;@HiveField(22)@JsonKey(name: "unique_id_str") String get paymentIdStr;@HiveField(23)@JsonKey(name: "last_anime") Anime get lastAnime;@HiveField(24)@JsonKey(name: "token_id") String get tokenId;@HiveField(25)@JsonKey(name: "saved_series") List<dynamic> get savedSeries;@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic> get savedMovies;@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String get image;@HiveField(28)@JsonKey(name: "privacy_settings") Privacy get privacySettings;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.subscription, subscription)&&(identical(other.role, role) || other.role == role)&&(identical(other.activated, activated) || other.activated == activated)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.total, total) || other.total == total)&&(identical(other.appleId, appleId) || other.appleId == appleId)&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdByAdmin, createdByAdmin) || other.createdByAdmin == createdByAdmin)&&(identical(other.telegramToken, telegramToken) || other.telegramToken == telegramToken)&&(identical(other.emailLC, emailLC) || other.emailLC == emailLC)&&(identical(other.lastAnimeType, lastAnimeType) || other.lastAnimeType == lastAnimeType)&&(identical(other.nameLC, nameLC) || other.nameLC == nameLC)&&(identical(other.phoneStr, phoneStr) || other.phoneStr == phoneStr)&&(identical(other.paymentIdStr, paymentIdStr) || other.paymentIdStr == paymentIdStr)&&(identical(other.lastAnime, lastAnime) || other.lastAnime == lastAnime)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other.savedSeries, savedSeries)&&const DeepCollectionEquality().equals(other.savedMovies, savedMovies)&&(identical(other.image, image) || other.image == image)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,name,email,balance,const DeepCollectionEquality().hash(subscription),role,activated,const DeepCollectionEquality().hash(transactions),updatedAt,const DeepCollectionEquality().hash(sessions),total,appleId,id,paymentId,phoneNumber,createdByAdmin,telegramToken,emailLC,lastAnimeType,nameLC,phoneStr,paymentIdStr,lastAnime,tokenId,const DeepCollectionEquality().hash(savedSeries),const DeepCollectionEquality().hash(savedMovies),image,privacySettings]);

@override
String toString() {
  return 'Profile(createdAt: $createdAt, name: $name, email: $email, balance: $balance, subscription: $subscription, role: $role, activated: $activated, transactions: $transactions, updatedAt: $updatedAt, sessions: $sessions, total: $total, appleId: $appleId, id: $id, paymentId: $paymentId, phoneNumber: $phoneNumber, createdByAdmin: $createdByAdmin, telegramToken: $telegramToken, emailLC: $emailLC, lastAnimeType: $lastAnimeType, nameLC: $nameLC, phoneStr: $phoneStr, paymentIdStr: $paymentIdStr, lastAnime: $lastAnime, tokenId: $tokenId, savedSeries: $savedSeries, savedMovies: $savedMovies, image: $image, privacySettings: $privacySettings)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
@HiveField(1) String createdAt,@HiveField(2) String name,@HiveField(3) String email,@HiveField(4) double balance,@HiveField(5) dynamic subscription,@HiveField(6) String role,@HiveField(7) bool activated,@HiveField(8) List transactions,@HiveField(9) String updatedAt,@HiveField(10) List<Session> sessions,@HiveField(11) int total,@HiveField(12)@JsonKey(name: "apple_id") String appleId,@HiveField(13)@JsonKey(name: "_id") String id,@HiveField(14)@JsonKey(name: "unique_id") int paymentId,@HiveField(15)@JsonKey(name: "phone_number") int phoneNumber,@HiveField(16)@JsonKey(name: "created_by_admin") bool createdByAdmin,@HiveField(17)@JsonKey(name: "telegram_token") String telegramToken,@HiveField(18)@JsonKey(name: "email_lc") String emailLC,@HiveField(19)@JsonKey(name: "last_anime_type") String lastAnimeType,@HiveField(20)@JsonKey(name: "name_lc") String nameLC,@HiveField(21)@JsonKey(name: "phone_str") String phoneStr,@HiveField(22)@JsonKey(name: "unique_id_str") String paymentIdStr,@HiveField(23)@JsonKey(name: "last_anime") Anime lastAnime,@HiveField(24)@JsonKey(name: "token_id") String tokenId,@HiveField(25)@JsonKey(name: "saved_series") List<dynamic> savedSeries,@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic> savedMovies,@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String image,@HiveField(28)@JsonKey(name: "privacy_settings") Privacy privacySettings
});


$AnimeCopyWith<$Res> get lastAnime;$PrivacyCopyWith<$Res> get privacySettings;

}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? name = null,Object? email = null,Object? balance = null,Object? subscription = freezed,Object? role = null,Object? activated = null,Object? transactions = null,Object? updatedAt = null,Object? sessions = null,Object? total = null,Object? appleId = null,Object? id = null,Object? paymentId = null,Object? phoneNumber = null,Object? createdByAdmin = null,Object? telegramToken = null,Object? emailLC = null,Object? lastAnimeType = null,Object? nameLC = null,Object? phoneStr = null,Object? paymentIdStr = null,Object? lastAnime = null,Object? tokenId = null,Object? savedSeries = null,Object? savedMovies = null,Object? image = null,Object? privacySettings = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as dynamic,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,activated: null == activated ? _self.activated : activated // ignore: cast_nullable_to_non_nullable
as bool,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,appleId: null == appleId ? _self.appleId : appleId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as int,createdByAdmin: null == createdByAdmin ? _self.createdByAdmin : createdByAdmin // ignore: cast_nullable_to_non_nullable
as bool,telegramToken: null == telegramToken ? _self.telegramToken : telegramToken // ignore: cast_nullable_to_non_nullable
as String,emailLC: null == emailLC ? _self.emailLC : emailLC // ignore: cast_nullable_to_non_nullable
as String,lastAnimeType: null == lastAnimeType ? _self.lastAnimeType : lastAnimeType // ignore: cast_nullable_to_non_nullable
as String,nameLC: null == nameLC ? _self.nameLC : nameLC // ignore: cast_nullable_to_non_nullable
as String,phoneStr: null == phoneStr ? _self.phoneStr : phoneStr // ignore: cast_nullable_to_non_nullable
as String,paymentIdStr: null == paymentIdStr ? _self.paymentIdStr : paymentIdStr // ignore: cast_nullable_to_non_nullable
as String,lastAnime: null == lastAnime ? _self.lastAnime : lastAnime // ignore: cast_nullable_to_non_nullable
as Anime,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,savedSeries: null == savedSeries ? _self.savedSeries : savedSeries // ignore: cast_nullable_to_non_nullable
as List<dynamic>,savedMovies: null == savedMovies ? _self.savedMovies : savedMovies // ignore: cast_nullable_to_non_nullable
as List<dynamic>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,privacySettings: null == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as Privacy,
  ));
}
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get lastAnime {
  
  return $AnimeCopyWith<$Res>(_self.lastAnime, (value) {
    return _then(_self.copyWith(lastAnime: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacyCopyWith<$Res> get privacySettings {
  
  return $PrivacyCopyWith<$Res>(_self.privacySettings, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(1)  String createdAt, @HiveField(2)  String name, @HiveField(3)  String email, @HiveField(4)  double balance, @HiveField(5)  dynamic subscription, @HiveField(6)  String role, @HiveField(7)  bool activated, @HiveField(8)  List transactions, @HiveField(9)  String updatedAt, @HiveField(10)  List<Session> sessions, @HiveField(11)  int total, @HiveField(12)@JsonKey(name: "apple_id")  String appleId, @HiveField(13)@JsonKey(name: "_id")  String id, @HiveField(14)@JsonKey(name: "unique_id")  int paymentId, @HiveField(15)@JsonKey(name: "phone_number")  int phoneNumber, @HiveField(16)@JsonKey(name: "created_by_admin")  bool createdByAdmin, @HiveField(17)@JsonKey(name: "telegram_token")  String telegramToken, @HiveField(18)@JsonKey(name: "email_lc")  String emailLC, @HiveField(19)@JsonKey(name: "last_anime_type")  String lastAnimeType, @HiveField(20)@JsonKey(name: "name_lc")  String nameLC, @HiveField(21)@JsonKey(name: "phone_str")  String phoneStr, @HiveField(22)@JsonKey(name: "unique_id_str")  String paymentIdStr, @HiveField(23)@JsonKey(name: "last_anime")  Anime lastAnime, @HiveField(24)@JsonKey(name: "token_id")  String tokenId, @HiveField(25)@JsonKey(name: "saved_series")  List<dynamic> savedSeries, @HiveField(26)@JsonKey(name: "saved_movies")  List<dynamic> savedMovies, @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String image, @HiveField(28)@JsonKey(name: "privacy_settings")  Privacy privacySettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastAnimeType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.image,_that.privacySettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(1)  String createdAt, @HiveField(2)  String name, @HiveField(3)  String email, @HiveField(4)  double balance, @HiveField(5)  dynamic subscription, @HiveField(6)  String role, @HiveField(7)  bool activated, @HiveField(8)  List transactions, @HiveField(9)  String updatedAt, @HiveField(10)  List<Session> sessions, @HiveField(11)  int total, @HiveField(12)@JsonKey(name: "apple_id")  String appleId, @HiveField(13)@JsonKey(name: "_id")  String id, @HiveField(14)@JsonKey(name: "unique_id")  int paymentId, @HiveField(15)@JsonKey(name: "phone_number")  int phoneNumber, @HiveField(16)@JsonKey(name: "created_by_admin")  bool createdByAdmin, @HiveField(17)@JsonKey(name: "telegram_token")  String telegramToken, @HiveField(18)@JsonKey(name: "email_lc")  String emailLC, @HiveField(19)@JsonKey(name: "last_anime_type")  String lastAnimeType, @HiveField(20)@JsonKey(name: "name_lc")  String nameLC, @HiveField(21)@JsonKey(name: "phone_str")  String phoneStr, @HiveField(22)@JsonKey(name: "unique_id_str")  String paymentIdStr, @HiveField(23)@JsonKey(name: "last_anime")  Anime lastAnime, @HiveField(24)@JsonKey(name: "token_id")  String tokenId, @HiveField(25)@JsonKey(name: "saved_series")  List<dynamic> savedSeries, @HiveField(26)@JsonKey(name: "saved_movies")  List<dynamic> savedMovies, @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String image, @HiveField(28)@JsonKey(name: "privacy_settings")  Privacy privacySettings)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastAnimeType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.image,_that.privacySettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(1)  String createdAt, @HiveField(2)  String name, @HiveField(3)  String email, @HiveField(4)  double balance, @HiveField(5)  dynamic subscription, @HiveField(6)  String role, @HiveField(7)  bool activated, @HiveField(8)  List transactions, @HiveField(9)  String updatedAt, @HiveField(10)  List<Session> sessions, @HiveField(11)  int total, @HiveField(12)@JsonKey(name: "apple_id")  String appleId, @HiveField(13)@JsonKey(name: "_id")  String id, @HiveField(14)@JsonKey(name: "unique_id")  int paymentId, @HiveField(15)@JsonKey(name: "phone_number")  int phoneNumber, @HiveField(16)@JsonKey(name: "created_by_admin")  bool createdByAdmin, @HiveField(17)@JsonKey(name: "telegram_token")  String telegramToken, @HiveField(18)@JsonKey(name: "email_lc")  String emailLC, @HiveField(19)@JsonKey(name: "last_anime_type")  String lastAnimeType, @HiveField(20)@JsonKey(name: "name_lc")  String nameLC, @HiveField(21)@JsonKey(name: "phone_str")  String phoneStr, @HiveField(22)@JsonKey(name: "unique_id_str")  String paymentIdStr, @HiveField(23)@JsonKey(name: "last_anime")  Anime lastAnime, @HiveField(24)@JsonKey(name: "token_id")  String tokenId, @HiveField(25)@JsonKey(name: "saved_series")  List<dynamic> savedSeries, @HiveField(26)@JsonKey(name: "saved_movies")  List<dynamic> savedMovies, @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String image, @HiveField(28)@JsonKey(name: "privacy_settings")  Privacy privacySettings)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastAnimeType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.image,_that.privacySettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Profile implements Profile {
  const _Profile({@HiveField(1) this.createdAt = "", @HiveField(2) this.name = "", @HiveField(3) this.email = "", @HiveField(4) this.balance = 0.0, @HiveField(5) this.subscription = "", @HiveField(6) this.role = "", @HiveField(7) this.activated = false, @HiveField(8) final  List transactions = const [], @HiveField(9) this.updatedAt = "", @HiveField(10) final  List<Session> sessions = const [], @HiveField(11) this.total = 0, @HiveField(12)@JsonKey(name: "apple_id") this.appleId = "", @HiveField(13)@JsonKey(name: "_id") this.id = "", @HiveField(14)@JsonKey(name: "unique_id") this.paymentId = 0, @HiveField(15)@JsonKey(name: "phone_number") this.phoneNumber = 0, @HiveField(16)@JsonKey(name: "created_by_admin") this.createdByAdmin = false, @HiveField(17)@JsonKey(name: "telegram_token") this.telegramToken = "", @HiveField(18)@JsonKey(name: "email_lc") this.emailLC = "", @HiveField(19)@JsonKey(name: "last_anime_type") this.lastAnimeType = "", @HiveField(20)@JsonKey(name: "name_lc") this.nameLC = "", @HiveField(21)@JsonKey(name: "phone_str") this.phoneStr = "", @HiveField(22)@JsonKey(name: "unique_id_str") this.paymentIdStr = "", @HiveField(23)@JsonKey(name: "last_anime") this.lastAnime = const Anime(), @HiveField(24)@JsonKey(name: "token_id") this.tokenId = "", @HiveField(25)@JsonKey(name: "saved_series") final  List<dynamic> savedSeries = const [], @HiveField(26)@JsonKey(name: "saved_movies") final  List<dynamic> savedMovies = const [], @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) this.image = "", @HiveField(28)@JsonKey(name: "privacy_settings") this.privacySettings = const Privacy()}): _transactions = transactions,_sessions = sessions,_savedSeries = savedSeries,_savedMovies = savedMovies;
  factory _Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

@override@JsonKey()@HiveField(1) final  String createdAt;
@override@JsonKey()@HiveField(2) final  String name;
@override@JsonKey()@HiveField(3) final  String email;
@override@JsonKey()@HiveField(4) final  double balance;
@override@JsonKey()@HiveField(5) final  dynamic subscription;
@override@JsonKey()@HiveField(6) final  String role;
@override@JsonKey()@HiveField(7) final  bool activated;
 final  List _transactions;
@override@JsonKey()@HiveField(8) List get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey()@HiveField(9) final  String updatedAt;
 final  List<Session> _sessions;
@override@JsonKey()@HiveField(10) List<Session> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override@JsonKey()@HiveField(11) final  int total;
@override@HiveField(12)@JsonKey(name: "apple_id") final  String appleId;
@override@HiveField(13)@JsonKey(name: "_id") final  String id;
@override@HiveField(14)@JsonKey(name: "unique_id") final  int paymentId;
@override@HiveField(15)@JsonKey(name: "phone_number") final  int phoneNumber;
@override@HiveField(16)@JsonKey(name: "created_by_admin") final  bool createdByAdmin;
@override@HiveField(17)@JsonKey(name: "telegram_token") final  String telegramToken;
@override@HiveField(18)@JsonKey(name: "email_lc") final  String emailLC;
@override@HiveField(19)@JsonKey(name: "last_anime_type") final  String lastAnimeType;
@override@HiveField(20)@JsonKey(name: "name_lc") final  String nameLC;
@override@HiveField(21)@JsonKey(name: "phone_str") final  String phoneStr;
@override@HiveField(22)@JsonKey(name: "unique_id_str") final  String paymentIdStr;
@override@HiveField(23)@JsonKey(name: "last_anime") final  Anime lastAnime;
@override@HiveField(24)@JsonKey(name: "token_id") final  String tokenId;
 final  List<dynamic> _savedSeries;
@override@HiveField(25)@JsonKey(name: "saved_series") List<dynamic> get savedSeries {
  if (_savedSeries is EqualUnmodifiableListView) return _savedSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedSeries);
}

 final  List<dynamic> _savedMovies;
@override@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic> get savedMovies {
  if (_savedMovies is EqualUnmodifiableListView) return _savedMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedMovies);
}

@override@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) final  String image;
@override@HiveField(28)@JsonKey(name: "privacy_settings") final  Privacy privacySettings;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.subscription, subscription)&&(identical(other.role, role) || other.role == role)&&(identical(other.activated, activated) || other.activated == activated)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.total, total) || other.total == total)&&(identical(other.appleId, appleId) || other.appleId == appleId)&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdByAdmin, createdByAdmin) || other.createdByAdmin == createdByAdmin)&&(identical(other.telegramToken, telegramToken) || other.telegramToken == telegramToken)&&(identical(other.emailLC, emailLC) || other.emailLC == emailLC)&&(identical(other.lastAnimeType, lastAnimeType) || other.lastAnimeType == lastAnimeType)&&(identical(other.nameLC, nameLC) || other.nameLC == nameLC)&&(identical(other.phoneStr, phoneStr) || other.phoneStr == phoneStr)&&(identical(other.paymentIdStr, paymentIdStr) || other.paymentIdStr == paymentIdStr)&&(identical(other.lastAnime, lastAnime) || other.lastAnime == lastAnime)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other._savedSeries, _savedSeries)&&const DeepCollectionEquality().equals(other._savedMovies, _savedMovies)&&(identical(other.image, image) || other.image == image)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,name,email,balance,const DeepCollectionEquality().hash(subscription),role,activated,const DeepCollectionEquality().hash(_transactions),updatedAt,const DeepCollectionEquality().hash(_sessions),total,appleId,id,paymentId,phoneNumber,createdByAdmin,telegramToken,emailLC,lastAnimeType,nameLC,phoneStr,paymentIdStr,lastAnime,tokenId,const DeepCollectionEquality().hash(_savedSeries),const DeepCollectionEquality().hash(_savedMovies),image,privacySettings]);

@override
String toString() {
  return 'Profile(createdAt: $createdAt, name: $name, email: $email, balance: $balance, subscription: $subscription, role: $role, activated: $activated, transactions: $transactions, updatedAt: $updatedAt, sessions: $sessions, total: $total, appleId: $appleId, id: $id, paymentId: $paymentId, phoneNumber: $phoneNumber, createdByAdmin: $createdByAdmin, telegramToken: $telegramToken, emailLC: $emailLC, lastAnimeType: $lastAnimeType, nameLC: $nameLC, phoneStr: $phoneStr, paymentIdStr: $paymentIdStr, lastAnime: $lastAnime, tokenId: $tokenId, savedSeries: $savedSeries, savedMovies: $savedMovies, image: $image, privacySettings: $privacySettings)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
@HiveField(1) String createdAt,@HiveField(2) String name,@HiveField(3) String email,@HiveField(4) double balance,@HiveField(5) dynamic subscription,@HiveField(6) String role,@HiveField(7) bool activated,@HiveField(8) List transactions,@HiveField(9) String updatedAt,@HiveField(10) List<Session> sessions,@HiveField(11) int total,@HiveField(12)@JsonKey(name: "apple_id") String appleId,@HiveField(13)@JsonKey(name: "_id") String id,@HiveField(14)@JsonKey(name: "unique_id") int paymentId,@HiveField(15)@JsonKey(name: "phone_number") int phoneNumber,@HiveField(16)@JsonKey(name: "created_by_admin") bool createdByAdmin,@HiveField(17)@JsonKey(name: "telegram_token") String telegramToken,@HiveField(18)@JsonKey(name: "email_lc") String emailLC,@HiveField(19)@JsonKey(name: "last_anime_type") String lastAnimeType,@HiveField(20)@JsonKey(name: "name_lc") String nameLC,@HiveField(21)@JsonKey(name: "phone_str") String phoneStr,@HiveField(22)@JsonKey(name: "unique_id_str") String paymentIdStr,@HiveField(23)@JsonKey(name: "last_anime") Anime lastAnime,@HiveField(24)@JsonKey(name: "token_id") String tokenId,@HiveField(25)@JsonKey(name: "saved_series") List<dynamic> savedSeries,@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic> savedMovies,@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String image,@HiveField(28)@JsonKey(name: "privacy_settings") Privacy privacySettings
});


@override $AnimeCopyWith<$Res> get lastAnime;@override $PrivacyCopyWith<$Res> get privacySettings;

}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? name = null,Object? email = null,Object? balance = null,Object? subscription = freezed,Object? role = null,Object? activated = null,Object? transactions = null,Object? updatedAt = null,Object? sessions = null,Object? total = null,Object? appleId = null,Object? id = null,Object? paymentId = null,Object? phoneNumber = null,Object? createdByAdmin = null,Object? telegramToken = null,Object? emailLC = null,Object? lastAnimeType = null,Object? nameLC = null,Object? phoneStr = null,Object? paymentIdStr = null,Object? lastAnime = null,Object? tokenId = null,Object? savedSeries = null,Object? savedMovies = null,Object? image = null,Object? privacySettings = null,}) {
  return _then(_Profile(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as dynamic,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,activated: null == activated ? _self.activated : activated // ignore: cast_nullable_to_non_nullable
as bool,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,appleId: null == appleId ? _self.appleId : appleId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as int,createdByAdmin: null == createdByAdmin ? _self.createdByAdmin : createdByAdmin // ignore: cast_nullable_to_non_nullable
as bool,telegramToken: null == telegramToken ? _self.telegramToken : telegramToken // ignore: cast_nullable_to_non_nullable
as String,emailLC: null == emailLC ? _self.emailLC : emailLC // ignore: cast_nullable_to_non_nullable
as String,lastAnimeType: null == lastAnimeType ? _self.lastAnimeType : lastAnimeType // ignore: cast_nullable_to_non_nullable
as String,nameLC: null == nameLC ? _self.nameLC : nameLC // ignore: cast_nullable_to_non_nullable
as String,phoneStr: null == phoneStr ? _self.phoneStr : phoneStr // ignore: cast_nullable_to_non_nullable
as String,paymentIdStr: null == paymentIdStr ? _self.paymentIdStr : paymentIdStr // ignore: cast_nullable_to_non_nullable
as String,lastAnime: null == lastAnime ? _self.lastAnime : lastAnime // ignore: cast_nullable_to_non_nullable
as Anime,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,savedSeries: null == savedSeries ? _self._savedSeries : savedSeries // ignore: cast_nullable_to_non_nullable
as List<dynamic>,savedMovies: null == savedMovies ? _self._savedMovies : savedMovies // ignore: cast_nullable_to_non_nullable
as List<dynamic>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,privacySettings: null == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as Privacy,
  ));
}

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeCopyWith<$Res> get lastAnime {
  
  return $AnimeCopyWith<$Res>(_self.lastAnime, (value) {
    return _then(_self.copyWith(lastAnime: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacyCopyWith<$Res> get privacySettings {
  
  return $PrivacyCopyWith<$Res>(_self.privacySettings, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}

// dart format on
