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
Profile _$ProfileFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'anibla':
          return _AniblaProfile.fromJson(
            json
          );
                case 'mano':
          return _ManoProfile.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Profile',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Profile {

@JsonKey(name: "first_name") String get name; double get balance; String get role;@JsonKey(name: "_id") String get id;@JsonKey(name: "unique_id")@JsonKey(name: "external_user_id") int get paymentId;@JsonKey(name: "phone_number") Object get phoneNumber;@JsonKey(fromJson: addBaseUrl, includeFromJson: true)@JsonKey(name: "picture_link") String get avatar;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.role, role) || other.role == role)&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&const DeepCollectionEquality().equals(other.phoneNumber, phoneNumber)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,role,id,paymentId,const DeepCollectionEquality().hash(phoneNumber),avatar);

@override
String toString() {
  return 'Profile(name: $name, balance: $balance, role: $role, id: $id, paymentId: $paymentId, phoneNumber: $phoneNumber, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 String name, double balance, String role,@JsonKey(name: "_id") String id,@JsonKey(name: "unique_id") int paymentId,@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String avatar
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? balance = null,Object? role = null,Object? id = null,Object? paymentId = null,Object? avatar = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AniblaProfile value)?  anibla,TResult Function( _ManoProfile value)?  mano,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AniblaProfile() when anibla != null:
return anibla(_that);case _ManoProfile() when mano != null:
return mano(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AniblaProfile value)  anibla,required TResult Function( _ManoProfile value)  mano,}){
final _that = this;
switch (_that) {
case _AniblaProfile():
return anibla(_that);case _ManoProfile():
return mano(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AniblaProfile value)?  anibla,TResult? Function( _ManoProfile value)?  mano,}){
final _that = this;
switch (_that) {
case _AniblaProfile() when anibla != null:
return anibla(_that);case _ManoProfile() when mano != null:
return mano(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String createdAt,  String name,  String email,  double balance,  dynamic subscription,  String role,  bool activated,  List transactions,  String updatedAt,  List<Session> sessions,  int total, @JsonKey(name: "apple_id")  String appleId, @JsonKey(name: "_id")  String id, @JsonKey(name: "unique_id")  int paymentId, @JsonKey(name: "phone_number")  int phoneNumber, @JsonKey(name: "created_by_admin")  bool createdByAdmin, @JsonKey(name: "telegram_token")  String telegramToken, @JsonKey(name: "email_lc")  String emailLC, @JsonKey(name: "last_anime_type")  String lastMediaType, @JsonKey(name: "name_lc")  String nameLC, @JsonKey(name: "phone_str")  String phoneStr, @JsonKey(name: "unique_id_str")  String paymentIdStr, @JsonKey(name: "last_anime")  Anime lastAnime, @JsonKey(name: "token_id")  String tokenId, @JsonKey(name: "saved_series")  List<dynamic> savedSeries, @JsonKey(name: "saved_movies")  List<dynamic> savedMovies, @JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String avatar, @JsonKey(name: "privacy_settings")  Privacy privacySettings)?  anibla,TResult Function( String id,  String role,  double balance,  int warning,  bool banned,  String createdDate, @JsonKey(name: "external_user_id")  int paymentId, @JsonKey(name: "first_name")  String name, @JsonKey(name: "phone_number")  String phoneNumber, @JsonKey(name: "picture_link")  String avatar, @JsonKey(name: "admin_scope")  String adminScope)?  mano,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AniblaProfile() when anibla != null:
return anibla(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastMediaType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.avatar,_that.privacySettings);case _ManoProfile() when mano != null:
return mano(_that.id,_that.role,_that.balance,_that.warning,_that.banned,_that.createdDate,_that.paymentId,_that.name,_that.phoneNumber,_that.avatar,_that.adminScope);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String createdAt,  String name,  String email,  double balance,  dynamic subscription,  String role,  bool activated,  List transactions,  String updatedAt,  List<Session> sessions,  int total, @JsonKey(name: "apple_id")  String appleId, @JsonKey(name: "_id")  String id, @JsonKey(name: "unique_id")  int paymentId, @JsonKey(name: "phone_number")  int phoneNumber, @JsonKey(name: "created_by_admin")  bool createdByAdmin, @JsonKey(name: "telegram_token")  String telegramToken, @JsonKey(name: "email_lc")  String emailLC, @JsonKey(name: "last_anime_type")  String lastMediaType, @JsonKey(name: "name_lc")  String nameLC, @JsonKey(name: "phone_str")  String phoneStr, @JsonKey(name: "unique_id_str")  String paymentIdStr, @JsonKey(name: "last_anime")  Anime lastAnime, @JsonKey(name: "token_id")  String tokenId, @JsonKey(name: "saved_series")  List<dynamic> savedSeries, @JsonKey(name: "saved_movies")  List<dynamic> savedMovies, @JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String avatar, @JsonKey(name: "privacy_settings")  Privacy privacySettings)  anibla,required TResult Function( String id,  String role,  double balance,  int warning,  bool banned,  String createdDate, @JsonKey(name: "external_user_id")  int paymentId, @JsonKey(name: "first_name")  String name, @JsonKey(name: "phone_number")  String phoneNumber, @JsonKey(name: "picture_link")  String avatar, @JsonKey(name: "admin_scope")  String adminScope)  mano,}) {final _that = this;
switch (_that) {
case _AniblaProfile():
return anibla(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastMediaType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.avatar,_that.privacySettings);case _ManoProfile():
return mano(_that.id,_that.role,_that.balance,_that.warning,_that.banned,_that.createdDate,_that.paymentId,_that.name,_that.phoneNumber,_that.avatar,_that.adminScope);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String createdAt,  String name,  String email,  double balance,  dynamic subscription,  String role,  bool activated,  List transactions,  String updatedAt,  List<Session> sessions,  int total, @JsonKey(name: "apple_id")  String appleId, @JsonKey(name: "_id")  String id, @JsonKey(name: "unique_id")  int paymentId, @JsonKey(name: "phone_number")  int phoneNumber, @JsonKey(name: "created_by_admin")  bool createdByAdmin, @JsonKey(name: "telegram_token")  String telegramToken, @JsonKey(name: "email_lc")  String emailLC, @JsonKey(name: "last_anime_type")  String lastMediaType, @JsonKey(name: "name_lc")  String nameLC, @JsonKey(name: "phone_str")  String phoneStr, @JsonKey(name: "unique_id_str")  String paymentIdStr, @JsonKey(name: "last_anime")  Anime lastAnime, @JsonKey(name: "token_id")  String tokenId, @JsonKey(name: "saved_series")  List<dynamic> savedSeries, @JsonKey(name: "saved_movies")  List<dynamic> savedMovies, @JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String avatar, @JsonKey(name: "privacy_settings")  Privacy privacySettings)?  anibla,TResult? Function( String id,  String role,  double balance,  int warning,  bool banned,  String createdDate, @JsonKey(name: "external_user_id")  int paymentId, @JsonKey(name: "first_name")  String name, @JsonKey(name: "phone_number")  String phoneNumber, @JsonKey(name: "picture_link")  String avatar, @JsonKey(name: "admin_scope")  String adminScope)?  mano,}) {final _that = this;
switch (_that) {
case _AniblaProfile() when anibla != null:
return anibla(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastMediaType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.avatar,_that.privacySettings);case _ManoProfile() when mano != null:
return mano(_that.id,_that.role,_that.balance,_that.warning,_that.banned,_that.createdDate,_that.paymentId,_that.name,_that.phoneNumber,_that.avatar,_that.adminScope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AniblaProfile implements Profile {
  const _AniblaProfile({this.createdAt = "", this.name = "", this.email = "", this.balance = 0.0, this.subscription = "", this.role = "", this.activated = false, final  List transactions = const [], this.updatedAt = "", final  List<Session> sessions = const [], this.total = 0, @JsonKey(name: "apple_id") this.appleId = "", @JsonKey(name: "_id") this.id = "", @JsonKey(name: "unique_id") this.paymentId = 0, @JsonKey(name: "phone_number") this.phoneNumber = 0, @JsonKey(name: "created_by_admin") this.createdByAdmin = false, @JsonKey(name: "telegram_token") this.telegramToken = "", @JsonKey(name: "email_lc") this.emailLC = "", @JsonKey(name: "last_anime_type") this.lastMediaType = "", @JsonKey(name: "name_lc") this.nameLC = "", @JsonKey(name: "phone_str") this.phoneStr = "", @JsonKey(name: "unique_id_str") this.paymentIdStr = "", @JsonKey(name: "last_anime") this.lastAnime = const Anime(), @JsonKey(name: "token_id") this.tokenId = "", @JsonKey(name: "saved_series") final  List<dynamic> savedSeries = const [], @JsonKey(name: "saved_movies") final  List<dynamic> savedMovies = const [], @JsonKey(fromJson: addBaseUrl, includeFromJson: true) this.avatar = "", @JsonKey(name: "privacy_settings") this.privacySettings = const Privacy(), final  String? $type}): _transactions = transactions,_sessions = sessions,_savedSeries = savedSeries,_savedMovies = savedMovies,$type = $type ?? 'anibla';
  factory _AniblaProfile.fromJson(Map<String, dynamic> json) => _$AniblaProfileFromJson(json);

@JsonKey() final  String createdAt;
@override@JsonKey() final  String name;
@JsonKey() final  String email;
@override@JsonKey() final  double balance;
@JsonKey() final  dynamic subscription;
@override@JsonKey() final  String role;
@JsonKey() final  bool activated;
 final  List _transactions;
@JsonKey() List get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@JsonKey() final  String updatedAt;
 final  List<Session> _sessions;
@JsonKey() List<Session> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@JsonKey() final  int total;
@JsonKey(name: "apple_id") final  String appleId;
@override@JsonKey(name: "_id") final  String id;
@override@JsonKey(name: "unique_id") final  int paymentId;
@override@JsonKey(name: "phone_number") final  int phoneNumber;
@JsonKey(name: "created_by_admin") final  bool createdByAdmin;
@JsonKey(name: "telegram_token") final  String telegramToken;
@JsonKey(name: "email_lc") final  String emailLC;
@JsonKey(name: "last_anime_type") final  String lastMediaType;
@JsonKey(name: "name_lc") final  String nameLC;
@JsonKey(name: "phone_str") final  String phoneStr;
@JsonKey(name: "unique_id_str") final  String paymentIdStr;
@JsonKey(name: "last_anime") final  Anime lastAnime;
@JsonKey(name: "token_id") final  String tokenId;
 final  List<dynamic> _savedSeries;
@JsonKey(name: "saved_series") List<dynamic> get savedSeries {
  if (_savedSeries is EqualUnmodifiableListView) return _savedSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedSeries);
}

 final  List<dynamic> _savedMovies;
@JsonKey(name: "saved_movies") List<dynamic> get savedMovies {
  if (_savedMovies is EqualUnmodifiableListView) return _savedMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedMovies);
}

@override@JsonKey(fromJson: addBaseUrl, includeFromJson: true) final  String avatar;
@JsonKey(name: "privacy_settings") final  Privacy privacySettings;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AniblaProfileCopyWith<_AniblaProfile> get copyWith => __$AniblaProfileCopyWithImpl<_AniblaProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AniblaProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AniblaProfile&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.subscription, subscription)&&(identical(other.role, role) || other.role == role)&&(identical(other.activated, activated) || other.activated == activated)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.total, total) || other.total == total)&&(identical(other.appleId, appleId) || other.appleId == appleId)&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdByAdmin, createdByAdmin) || other.createdByAdmin == createdByAdmin)&&(identical(other.telegramToken, telegramToken) || other.telegramToken == telegramToken)&&(identical(other.emailLC, emailLC) || other.emailLC == emailLC)&&(identical(other.lastMediaType, lastMediaType) || other.lastMediaType == lastMediaType)&&(identical(other.nameLC, nameLC) || other.nameLC == nameLC)&&(identical(other.phoneStr, phoneStr) || other.phoneStr == phoneStr)&&(identical(other.paymentIdStr, paymentIdStr) || other.paymentIdStr == paymentIdStr)&&(identical(other.lastAnime, lastAnime) || other.lastAnime == lastAnime)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other._savedSeries, _savedSeries)&&const DeepCollectionEquality().equals(other._savedMovies, _savedMovies)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,name,email,balance,const DeepCollectionEquality().hash(subscription),role,activated,const DeepCollectionEquality().hash(_transactions),updatedAt,const DeepCollectionEquality().hash(_sessions),total,appleId,id,paymentId,phoneNumber,createdByAdmin,telegramToken,emailLC,lastMediaType,nameLC,phoneStr,paymentIdStr,lastAnime,tokenId,const DeepCollectionEquality().hash(_savedSeries),const DeepCollectionEquality().hash(_savedMovies),avatar,privacySettings]);

@override
String toString() {
  return 'Profile.anibla(createdAt: $createdAt, name: $name, email: $email, balance: $balance, subscription: $subscription, role: $role, activated: $activated, transactions: $transactions, updatedAt: $updatedAt, sessions: $sessions, total: $total, appleId: $appleId, id: $id, paymentId: $paymentId, phoneNumber: $phoneNumber, createdByAdmin: $createdByAdmin, telegramToken: $telegramToken, emailLC: $emailLC, lastMediaType: $lastMediaType, nameLC: $nameLC, phoneStr: $phoneStr, paymentIdStr: $paymentIdStr, lastAnime: $lastAnime, tokenId: $tokenId, savedSeries: $savedSeries, savedMovies: $savedMovies, avatar: $avatar, privacySettings: $privacySettings)';
}


}

/// @nodoc
abstract mixin class _$AniblaProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$AniblaProfileCopyWith(_AniblaProfile value, $Res Function(_AniblaProfile) _then) = __$AniblaProfileCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String name, String email, double balance, dynamic subscription, String role, bool activated, List transactions, String updatedAt, List<Session> sessions, int total,@JsonKey(name: "apple_id") String appleId,@JsonKey(name: "_id") String id,@JsonKey(name: "unique_id") int paymentId,@JsonKey(name: "phone_number") int phoneNumber,@JsonKey(name: "created_by_admin") bool createdByAdmin,@JsonKey(name: "telegram_token") String telegramToken,@JsonKey(name: "email_lc") String emailLC,@JsonKey(name: "last_anime_type") String lastMediaType,@JsonKey(name: "name_lc") String nameLC,@JsonKey(name: "phone_str") String phoneStr,@JsonKey(name: "unique_id_str") String paymentIdStr,@JsonKey(name: "last_anime") Anime lastAnime,@JsonKey(name: "token_id") String tokenId,@JsonKey(name: "saved_series") List<dynamic> savedSeries,@JsonKey(name: "saved_movies") List<dynamic> savedMovies,@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String avatar,@JsonKey(name: "privacy_settings") Privacy privacySettings
});


$AnimeCopyWith<$Res> get lastAnime;$PrivacyCopyWith<$Res> get privacySettings;

}
/// @nodoc
class __$AniblaProfileCopyWithImpl<$Res>
    implements _$AniblaProfileCopyWith<$Res> {
  __$AniblaProfileCopyWithImpl(this._self, this._then);

  final _AniblaProfile _self;
  final $Res Function(_AniblaProfile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? name = null,Object? email = null,Object? balance = null,Object? subscription = freezed,Object? role = null,Object? activated = null,Object? transactions = null,Object? updatedAt = null,Object? sessions = null,Object? total = null,Object? appleId = null,Object? id = null,Object? paymentId = null,Object? phoneNumber = null,Object? createdByAdmin = null,Object? telegramToken = null,Object? emailLC = null,Object? lastMediaType = null,Object? nameLC = null,Object? phoneStr = null,Object? paymentIdStr = null,Object? lastAnime = null,Object? tokenId = null,Object? savedSeries = null,Object? savedMovies = null,Object? avatar = null,Object? privacySettings = null,}) {
  return _then(_AniblaProfile(
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
as String,lastMediaType: null == lastMediaType ? _self.lastMediaType : lastMediaType // ignore: cast_nullable_to_non_nullable
as String,nameLC: null == nameLC ? _self.nameLC : nameLC // ignore: cast_nullable_to_non_nullable
as String,phoneStr: null == phoneStr ? _self.phoneStr : phoneStr // ignore: cast_nullable_to_non_nullable
as String,paymentIdStr: null == paymentIdStr ? _self.paymentIdStr : paymentIdStr // ignore: cast_nullable_to_non_nullable
as String,lastAnime: null == lastAnime ? _self.lastAnime : lastAnime // ignore: cast_nullable_to_non_nullable
as Anime,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,savedSeries: null == savedSeries ? _self._savedSeries : savedSeries // ignore: cast_nullable_to_non_nullable
as List<dynamic>,savedMovies: null == savedMovies ? _self._savedMovies : savedMovies // ignore: cast_nullable_to_non_nullable
as List<dynamic>,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
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

/// @nodoc
@JsonSerializable()

class _ManoProfile implements Profile {
  const _ManoProfile({this.id = "", this.role = "", this.balance = 0, this.warning = 0, this.banned = false, this.createdDate = "", @JsonKey(name: "external_user_id") this.paymentId = 0, @JsonKey(name: "first_name") this.name = "", @JsonKey(name: "phone_number") this.phoneNumber = "", @JsonKey(name: "picture_link") this.avatar = "", @JsonKey(name: "admin_scope") this.adminScope = "", final  String? $type}): $type = $type ?? 'mano';
  factory _ManoProfile.fromJson(Map<String, dynamic> json) => _$ManoProfileFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String role;
@override@JsonKey() final  double balance;
@JsonKey() final  int warning;
@JsonKey() final  bool banned;
@JsonKey() final  String createdDate;
@override@JsonKey(name: "external_user_id") final  int paymentId;
@override@JsonKey(name: "first_name") final  String name;
@override@JsonKey(name: "phone_number") final  String phoneNumber;
@override@JsonKey(name: "picture_link") final  String avatar;
@JsonKey(name: "admin_scope") final  String adminScope;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Profile
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
  return 'Profile.mano(id: $id, role: $role, balance: $balance, warning: $warning, banned: $banned, createdDate: $createdDate, paymentId: $paymentId, name: $name, phoneNumber: $phoneNumber, avatar: $avatar, adminScope: $adminScope)';
}


}

/// @nodoc
abstract mixin class _$ManoProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ManoProfileCopyWith(_ManoProfile value, $Res Function(_ManoProfile) _then) = __$ManoProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String role, double balance, int warning, bool banned, String createdDate,@JsonKey(name: "external_user_id") int paymentId,@JsonKey(name: "first_name") String name,@JsonKey(name: "phone_number") String phoneNumber,@JsonKey(name: "picture_link") String avatar,@JsonKey(name: "admin_scope") String adminScope
});




}
/// @nodoc
class __$ManoProfileCopyWithImpl<$Res>
    implements _$ManoProfileCopyWith<$Res> {
  __$ManoProfileCopyWithImpl(this._self, this._then);

  final _ManoProfile _self;
  final $Res Function(_ManoProfile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? balance = null,Object? warning = null,Object? banned = null,Object? createdDate = null,Object? paymentId = null,Object? name = null,Object? phoneNumber = null,Object? avatar = null,Object? adminScope = null,}) {
  return _then(_ManoProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,warning: null == warning ? _self.warning : warning // ignore: cast_nullable_to_non_nullable
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
