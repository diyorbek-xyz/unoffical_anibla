// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

@HiveField(1) DateTime? get createdAt;@HiveField(2) String? get name;@HiveField(3) String? get email;@HiveField(4) double? get balance;@HiveField(5) dynamic get subscription;@HiveField(6) String? get role;@HiveField(7) bool? get activated;@HiveField(8) List? get transactions;@HiveField(9) DateTime? get updatedAt;@HiveField(10) List<SessionModel>? get sessions;@HiveField(11) int? get total;@HiveField(12)@JsonKey(name: "apple_id") String? get appleId;@HiveField(13)@JsonKey(name: "_id") String? get id;@HiveField(14)@JsonKey(name: "unique_id") int? get paymentId;@HiveField(15)@JsonKey(name: "phone_number") int? get phoneNumber;@HiveField(16)@JsonKey(name: "created_by_admin") bool? get createdByAdmin;@HiveField(17)@JsonKey(name: "telegram_token") String? get telegramToken;@HiveField(18)@JsonKey(name: "email_lc") String? get emailLC;@HiveField(19)@JsonKey(name: "last_anime_type") String? get lastAnimeType;@HiveField(20)@JsonKey(name: "name_lc") String? get nameLC;@HiveField(21)@JsonKey(name: "phone_str") String? get phoneStr;@HiveField(22)@JsonKey(name: "unique_id_str") String? get paymentIdStr;@HiveField(23)@JsonKey(name: "last_anime") AnimeModel? get lastAnime;@HiveField(24)@JsonKey(name: "token_id") String? get tokenId;@HiveField(25)@JsonKey(name: "saved_series") List<dynamic>? get savedSeries;@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic>? get savedMovies;@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? get image;@HiveField(28)@JsonKey(name: "privacy_settings") PrivacyModel? get privacySettings;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.subscription, subscription)&&(identical(other.role, role) || other.role == role)&&(identical(other.activated, activated) || other.activated == activated)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.total, total) || other.total == total)&&(identical(other.appleId, appleId) || other.appleId == appleId)&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdByAdmin, createdByAdmin) || other.createdByAdmin == createdByAdmin)&&(identical(other.telegramToken, telegramToken) || other.telegramToken == telegramToken)&&(identical(other.emailLC, emailLC) || other.emailLC == emailLC)&&(identical(other.lastAnimeType, lastAnimeType) || other.lastAnimeType == lastAnimeType)&&(identical(other.nameLC, nameLC) || other.nameLC == nameLC)&&(identical(other.phoneStr, phoneStr) || other.phoneStr == phoneStr)&&(identical(other.paymentIdStr, paymentIdStr) || other.paymentIdStr == paymentIdStr)&&(identical(other.lastAnime, lastAnime) || other.lastAnime == lastAnime)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other.savedSeries, savedSeries)&&const DeepCollectionEquality().equals(other.savedMovies, savedMovies)&&(identical(other.image, image) || other.image == image)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,name,email,balance,const DeepCollectionEquality().hash(subscription),role,activated,const DeepCollectionEquality().hash(transactions),updatedAt,const DeepCollectionEquality().hash(sessions),total,appleId,id,paymentId,phoneNumber,createdByAdmin,telegramToken,emailLC,lastAnimeType,nameLC,phoneStr,paymentIdStr,lastAnime,tokenId,const DeepCollectionEquality().hash(savedSeries),const DeepCollectionEquality().hash(savedMovies),image,privacySettings]);

@override
String toString() {
  return 'ProfileModel(createdAt: $createdAt, name: $name, email: $email, balance: $balance, subscription: $subscription, role: $role, activated: $activated, transactions: $transactions, updatedAt: $updatedAt, sessions: $sessions, total: $total, appleId: $appleId, id: $id, paymentId: $paymentId, phoneNumber: $phoneNumber, createdByAdmin: $createdByAdmin, telegramToken: $telegramToken, emailLC: $emailLC, lastAnimeType: $lastAnimeType, nameLC: $nameLC, phoneStr: $phoneStr, paymentIdStr: $paymentIdStr, lastAnime: $lastAnime, tokenId: $tokenId, savedSeries: $savedSeries, savedMovies: $savedMovies, image: $image, privacySettings: $privacySettings)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
@HiveField(1) DateTime? createdAt,@HiveField(2) String? name,@HiveField(3) String? email,@HiveField(4) double? balance,@HiveField(5) dynamic subscription,@HiveField(6) String? role,@HiveField(7) bool? activated,@HiveField(8) List? transactions,@HiveField(9) DateTime? updatedAt,@HiveField(10) List<SessionModel>? sessions,@HiveField(11) int? total,@HiveField(12)@JsonKey(name: "apple_id") String? appleId,@HiveField(13)@JsonKey(name: "_id") String? id,@HiveField(14)@JsonKey(name: "unique_id") int? paymentId,@HiveField(15)@JsonKey(name: "phone_number") int? phoneNumber,@HiveField(16)@JsonKey(name: "created_by_admin") bool? createdByAdmin,@HiveField(17)@JsonKey(name: "telegram_token") String? telegramToken,@HiveField(18)@JsonKey(name: "email_lc") String? emailLC,@HiveField(19)@JsonKey(name: "last_anime_type") String? lastAnimeType,@HiveField(20)@JsonKey(name: "name_lc") String? nameLC,@HiveField(21)@JsonKey(name: "phone_str") String? phoneStr,@HiveField(22)@JsonKey(name: "unique_id_str") String? paymentIdStr,@HiveField(23)@JsonKey(name: "last_anime") AnimeModel? lastAnime,@HiveField(24)@JsonKey(name: "token_id") String? tokenId,@HiveField(25)@JsonKey(name: "saved_series") List<dynamic>? savedSeries,@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic>? savedMovies,@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? image,@HiveField(28)@JsonKey(name: "privacy_settings") PrivacyModel? privacySettings
});


$PrivacyModelCopyWith<$Res>? get privacySettings;

}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? name = freezed,Object? email = freezed,Object? balance = freezed,Object? subscription = freezed,Object? role = freezed,Object? activated = freezed,Object? transactions = freezed,Object? updatedAt = freezed,Object? sessions = freezed,Object? total = freezed,Object? appleId = freezed,Object? id = freezed,Object? paymentId = freezed,Object? phoneNumber = freezed,Object? createdByAdmin = freezed,Object? telegramToken = freezed,Object? emailLC = freezed,Object? lastAnimeType = freezed,Object? nameLC = freezed,Object? phoneStr = freezed,Object? paymentIdStr = freezed,Object? lastAnime = freezed,Object? tokenId = freezed,Object? savedSeries = freezed,Object? savedMovies = freezed,Object? image = freezed,Object? privacySettings = freezed,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as dynamic,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,activated: freezed == activated ? _self.activated : activated // ignore: cast_nullable_to_non_nullable
as bool?,transactions: freezed == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sessions: freezed == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionModel>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,appleId: freezed == appleId ? _self.appleId : appleId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as int?,createdByAdmin: freezed == createdByAdmin ? _self.createdByAdmin : createdByAdmin // ignore: cast_nullable_to_non_nullable
as bool?,telegramToken: freezed == telegramToken ? _self.telegramToken : telegramToken // ignore: cast_nullable_to_non_nullable
as String?,emailLC: freezed == emailLC ? _self.emailLC : emailLC // ignore: cast_nullable_to_non_nullable
as String?,lastAnimeType: freezed == lastAnimeType ? _self.lastAnimeType : lastAnimeType // ignore: cast_nullable_to_non_nullable
as String?,nameLC: freezed == nameLC ? _self.nameLC : nameLC // ignore: cast_nullable_to_non_nullable
as String?,phoneStr: freezed == phoneStr ? _self.phoneStr : phoneStr // ignore: cast_nullable_to_non_nullable
as String?,paymentIdStr: freezed == paymentIdStr ? _self.paymentIdStr : paymentIdStr // ignore: cast_nullable_to_non_nullable
as String?,lastAnime: freezed == lastAnime ? _self.lastAnime : lastAnime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,tokenId: freezed == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String?,savedSeries: freezed == savedSeries ? _self.savedSeries : savedSeries // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,savedMovies: freezed == savedMovies ? _self.savedMovies : savedMovies // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,privacySettings: freezed == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as PrivacyModel?,
  ));
}
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacyModelCopyWith<$Res>? get privacySettings {
    if (_self.privacySettings == null) {
    return null;
  }

  return $PrivacyModelCopyWith<$Res>(_self.privacySettings!, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(1)  DateTime? createdAt, @HiveField(2)  String? name, @HiveField(3)  String? email, @HiveField(4)  double? balance, @HiveField(5)  dynamic subscription, @HiveField(6)  String? role, @HiveField(7)  bool? activated, @HiveField(8)  List? transactions, @HiveField(9)  DateTime? updatedAt, @HiveField(10)  List<SessionModel>? sessions, @HiveField(11)  int? total, @HiveField(12)@JsonKey(name: "apple_id")  String? appleId, @HiveField(13)@JsonKey(name: "_id")  String? id, @HiveField(14)@JsonKey(name: "unique_id")  int? paymentId, @HiveField(15)@JsonKey(name: "phone_number")  int? phoneNumber, @HiveField(16)@JsonKey(name: "created_by_admin")  bool? createdByAdmin, @HiveField(17)@JsonKey(name: "telegram_token")  String? telegramToken, @HiveField(18)@JsonKey(name: "email_lc")  String? emailLC, @HiveField(19)@JsonKey(name: "last_anime_type")  String? lastAnimeType, @HiveField(20)@JsonKey(name: "name_lc")  String? nameLC, @HiveField(21)@JsonKey(name: "phone_str")  String? phoneStr, @HiveField(22)@JsonKey(name: "unique_id_str")  String? paymentIdStr, @HiveField(23)@JsonKey(name: "last_anime")  AnimeModel? lastAnime, @HiveField(24)@JsonKey(name: "token_id")  String? tokenId, @HiveField(25)@JsonKey(name: "saved_series")  List<dynamic>? savedSeries, @HiveField(26)@JsonKey(name: "saved_movies")  List<dynamic>? savedMovies, @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? image, @HiveField(28)@JsonKey(name: "privacy_settings")  PrivacyModel? privacySettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(1)  DateTime? createdAt, @HiveField(2)  String? name, @HiveField(3)  String? email, @HiveField(4)  double? balance, @HiveField(5)  dynamic subscription, @HiveField(6)  String? role, @HiveField(7)  bool? activated, @HiveField(8)  List? transactions, @HiveField(9)  DateTime? updatedAt, @HiveField(10)  List<SessionModel>? sessions, @HiveField(11)  int? total, @HiveField(12)@JsonKey(name: "apple_id")  String? appleId, @HiveField(13)@JsonKey(name: "_id")  String? id, @HiveField(14)@JsonKey(name: "unique_id")  int? paymentId, @HiveField(15)@JsonKey(name: "phone_number")  int? phoneNumber, @HiveField(16)@JsonKey(name: "created_by_admin")  bool? createdByAdmin, @HiveField(17)@JsonKey(name: "telegram_token")  String? telegramToken, @HiveField(18)@JsonKey(name: "email_lc")  String? emailLC, @HiveField(19)@JsonKey(name: "last_anime_type")  String? lastAnimeType, @HiveField(20)@JsonKey(name: "name_lc")  String? nameLC, @HiveField(21)@JsonKey(name: "phone_str")  String? phoneStr, @HiveField(22)@JsonKey(name: "unique_id_str")  String? paymentIdStr, @HiveField(23)@JsonKey(name: "last_anime")  AnimeModel? lastAnime, @HiveField(24)@JsonKey(name: "token_id")  String? tokenId, @HiveField(25)@JsonKey(name: "saved_series")  List<dynamic>? savedSeries, @HiveField(26)@JsonKey(name: "saved_movies")  List<dynamic>? savedMovies, @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? image, @HiveField(28)@JsonKey(name: "privacy_settings")  PrivacyModel? privacySettings)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastAnimeType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.image,_that.privacySettings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(1)  DateTime? createdAt, @HiveField(2)  String? name, @HiveField(3)  String? email, @HiveField(4)  double? balance, @HiveField(5)  dynamic subscription, @HiveField(6)  String? role, @HiveField(7)  bool? activated, @HiveField(8)  List? transactions, @HiveField(9)  DateTime? updatedAt, @HiveField(10)  List<SessionModel>? sessions, @HiveField(11)  int? total, @HiveField(12)@JsonKey(name: "apple_id")  String? appleId, @HiveField(13)@JsonKey(name: "_id")  String? id, @HiveField(14)@JsonKey(name: "unique_id")  int? paymentId, @HiveField(15)@JsonKey(name: "phone_number")  int? phoneNumber, @HiveField(16)@JsonKey(name: "created_by_admin")  bool? createdByAdmin, @HiveField(17)@JsonKey(name: "telegram_token")  String? telegramToken, @HiveField(18)@JsonKey(name: "email_lc")  String? emailLC, @HiveField(19)@JsonKey(name: "last_anime_type")  String? lastAnimeType, @HiveField(20)@JsonKey(name: "name_lc")  String? nameLC, @HiveField(21)@JsonKey(name: "phone_str")  String? phoneStr, @HiveField(22)@JsonKey(name: "unique_id_str")  String? paymentIdStr, @HiveField(23)@JsonKey(name: "last_anime")  AnimeModel? lastAnime, @HiveField(24)@JsonKey(name: "token_id")  String? tokenId, @HiveField(25)@JsonKey(name: "saved_series")  List<dynamic>? savedSeries, @HiveField(26)@JsonKey(name: "saved_movies")  List<dynamic>? savedMovies, @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true)  String? image, @HiveField(28)@JsonKey(name: "privacy_settings")  PrivacyModel? privacySettings)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.createdAt,_that.name,_that.email,_that.balance,_that.subscription,_that.role,_that.activated,_that.transactions,_that.updatedAt,_that.sessions,_that.total,_that.appleId,_that.id,_that.paymentId,_that.phoneNumber,_that.createdByAdmin,_that.telegramToken,_that.emailLC,_that.lastAnimeType,_that.nameLC,_that.phoneStr,_that.paymentIdStr,_that.lastAnime,_that.tokenId,_that.savedSeries,_that.savedMovies,_that.image,_that.privacySettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
   _ProfileModel({@HiveField(1) this.createdAt, @HiveField(2) this.name, @HiveField(3) this.email, @HiveField(4) this.balance, @HiveField(5) this.subscription, @HiveField(6) this.role, @HiveField(7) this.activated, @HiveField(8) final  List? transactions, @HiveField(9) this.updatedAt, @HiveField(10) final  List<SessionModel>? sessions, @HiveField(11) this.total, @HiveField(12)@JsonKey(name: "apple_id") this.appleId, @HiveField(13)@JsonKey(name: "_id") this.id, @HiveField(14)@JsonKey(name: "unique_id") this.paymentId, @HiveField(15)@JsonKey(name: "phone_number") this.phoneNumber, @HiveField(16)@JsonKey(name: "created_by_admin") this.createdByAdmin, @HiveField(17)@JsonKey(name: "telegram_token") this.telegramToken, @HiveField(18)@JsonKey(name: "email_lc") this.emailLC, @HiveField(19)@JsonKey(name: "last_anime_type") this.lastAnimeType, @HiveField(20)@JsonKey(name: "name_lc") this.nameLC, @HiveField(21)@JsonKey(name: "phone_str") this.phoneStr, @HiveField(22)@JsonKey(name: "unique_id_str") this.paymentIdStr, @HiveField(23)@JsonKey(name: "last_anime") this.lastAnime, @HiveField(24)@JsonKey(name: "token_id") this.tokenId, @HiveField(25)@JsonKey(name: "saved_series") final  List<dynamic>? savedSeries, @HiveField(26)@JsonKey(name: "saved_movies") final  List<dynamic>? savedMovies, @HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) this.image, @HiveField(28)@JsonKey(name: "privacy_settings") this.privacySettings}): _transactions = transactions,_sessions = sessions,_savedSeries = savedSeries,_savedMovies = savedMovies;
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override@HiveField(1) final  DateTime? createdAt;
@override@HiveField(2) final  String? name;
@override@HiveField(3) final  String? email;
@override@HiveField(4) final  double? balance;
@override@HiveField(5) final  dynamic subscription;
@override@HiveField(6) final  String? role;
@override@HiveField(7) final  bool? activated;
 final  List? _transactions;
@override@HiveField(8) List? get transactions {
  final value = _transactions;
  if (value == null) return null;
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(9) final  DateTime? updatedAt;
 final  List<SessionModel>? _sessions;
@override@HiveField(10) List<SessionModel>? get sessions {
  final value = _sessions;
  if (value == null) return null;
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(11) final  int? total;
@override@HiveField(12)@JsonKey(name: "apple_id") final  String? appleId;
@override@HiveField(13)@JsonKey(name: "_id") final  String? id;
@override@HiveField(14)@JsonKey(name: "unique_id") final  int? paymentId;
@override@HiveField(15)@JsonKey(name: "phone_number") final  int? phoneNumber;
@override@HiveField(16)@JsonKey(name: "created_by_admin") final  bool? createdByAdmin;
@override@HiveField(17)@JsonKey(name: "telegram_token") final  String? telegramToken;
@override@HiveField(18)@JsonKey(name: "email_lc") final  String? emailLC;
@override@HiveField(19)@JsonKey(name: "last_anime_type") final  String? lastAnimeType;
@override@HiveField(20)@JsonKey(name: "name_lc") final  String? nameLC;
@override@HiveField(21)@JsonKey(name: "phone_str") final  String? phoneStr;
@override@HiveField(22)@JsonKey(name: "unique_id_str") final  String? paymentIdStr;
@override@HiveField(23)@JsonKey(name: "last_anime") final  AnimeModel? lastAnime;
@override@HiveField(24)@JsonKey(name: "token_id") final  String? tokenId;
 final  List<dynamic>? _savedSeries;
@override@HiveField(25)@JsonKey(name: "saved_series") List<dynamic>? get savedSeries {
  final value = _savedSeries;
  if (value == null) return null;
  if (_savedSeries is EqualUnmodifiableListView) return _savedSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _savedMovies;
@override@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic>? get savedMovies {
  final value = _savedMovies;
  if (value == null) return null;
  if (_savedMovies is EqualUnmodifiableListView) return _savedMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) final  String? image;
@override@HiveField(28)@JsonKey(name: "privacy_settings") final  PrivacyModel? privacySettings;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.subscription, subscription)&&(identical(other.role, role) || other.role == role)&&(identical(other.activated, activated) || other.activated == activated)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.total, total) || other.total == total)&&(identical(other.appleId, appleId) || other.appleId == appleId)&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdByAdmin, createdByAdmin) || other.createdByAdmin == createdByAdmin)&&(identical(other.telegramToken, telegramToken) || other.telegramToken == telegramToken)&&(identical(other.emailLC, emailLC) || other.emailLC == emailLC)&&(identical(other.lastAnimeType, lastAnimeType) || other.lastAnimeType == lastAnimeType)&&(identical(other.nameLC, nameLC) || other.nameLC == nameLC)&&(identical(other.phoneStr, phoneStr) || other.phoneStr == phoneStr)&&(identical(other.paymentIdStr, paymentIdStr) || other.paymentIdStr == paymentIdStr)&&(identical(other.lastAnime, lastAnime) || other.lastAnime == lastAnime)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other._savedSeries, _savedSeries)&&const DeepCollectionEquality().equals(other._savedMovies, _savedMovies)&&(identical(other.image, image) || other.image == image)&&(identical(other.privacySettings, privacySettings) || other.privacySettings == privacySettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,name,email,balance,const DeepCollectionEquality().hash(subscription),role,activated,const DeepCollectionEquality().hash(_transactions),updatedAt,const DeepCollectionEquality().hash(_sessions),total,appleId,id,paymentId,phoneNumber,createdByAdmin,telegramToken,emailLC,lastAnimeType,nameLC,phoneStr,paymentIdStr,lastAnime,tokenId,const DeepCollectionEquality().hash(_savedSeries),const DeepCollectionEquality().hash(_savedMovies),image,privacySettings]);

@override
String toString() {
  return 'ProfileModel(createdAt: $createdAt, name: $name, email: $email, balance: $balance, subscription: $subscription, role: $role, activated: $activated, transactions: $transactions, updatedAt: $updatedAt, sessions: $sessions, total: $total, appleId: $appleId, id: $id, paymentId: $paymentId, phoneNumber: $phoneNumber, createdByAdmin: $createdByAdmin, telegramToken: $telegramToken, emailLC: $emailLC, lastAnimeType: $lastAnimeType, nameLC: $nameLC, phoneStr: $phoneStr, paymentIdStr: $paymentIdStr, lastAnime: $lastAnime, tokenId: $tokenId, savedSeries: $savedSeries, savedMovies: $savedMovies, image: $image, privacySettings: $privacySettings)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(1) DateTime? createdAt,@HiveField(2) String? name,@HiveField(3) String? email,@HiveField(4) double? balance,@HiveField(5) dynamic subscription,@HiveField(6) String? role,@HiveField(7) bool? activated,@HiveField(8) List? transactions,@HiveField(9) DateTime? updatedAt,@HiveField(10) List<SessionModel>? sessions,@HiveField(11) int? total,@HiveField(12)@JsonKey(name: "apple_id") String? appleId,@HiveField(13)@JsonKey(name: "_id") String? id,@HiveField(14)@JsonKey(name: "unique_id") int? paymentId,@HiveField(15)@JsonKey(name: "phone_number") int? phoneNumber,@HiveField(16)@JsonKey(name: "created_by_admin") bool? createdByAdmin,@HiveField(17)@JsonKey(name: "telegram_token") String? telegramToken,@HiveField(18)@JsonKey(name: "email_lc") String? emailLC,@HiveField(19)@JsonKey(name: "last_anime_type") String? lastAnimeType,@HiveField(20)@JsonKey(name: "name_lc") String? nameLC,@HiveField(21)@JsonKey(name: "phone_str") String? phoneStr,@HiveField(22)@JsonKey(name: "unique_id_str") String? paymentIdStr,@HiveField(23)@JsonKey(name: "last_anime") AnimeModel? lastAnime,@HiveField(24)@JsonKey(name: "token_id") String? tokenId,@HiveField(25)@JsonKey(name: "saved_series") List<dynamic>? savedSeries,@HiveField(26)@JsonKey(name: "saved_movies") List<dynamic>? savedMovies,@HiveField(27)@JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? image,@HiveField(28)@JsonKey(name: "privacy_settings") PrivacyModel? privacySettings
});


@override $PrivacyModelCopyWith<$Res>? get privacySettings;

}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? name = freezed,Object? email = freezed,Object? balance = freezed,Object? subscription = freezed,Object? role = freezed,Object? activated = freezed,Object? transactions = freezed,Object? updatedAt = freezed,Object? sessions = freezed,Object? total = freezed,Object? appleId = freezed,Object? id = freezed,Object? paymentId = freezed,Object? phoneNumber = freezed,Object? createdByAdmin = freezed,Object? telegramToken = freezed,Object? emailLC = freezed,Object? lastAnimeType = freezed,Object? nameLC = freezed,Object? phoneStr = freezed,Object? paymentIdStr = freezed,Object? lastAnime = freezed,Object? tokenId = freezed,Object? savedSeries = freezed,Object? savedMovies = freezed,Object? image = freezed,Object? privacySettings = freezed,}) {
  return _then(_ProfileModel(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as dynamic,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,activated: freezed == activated ? _self.activated : activated // ignore: cast_nullable_to_non_nullable
as bool?,transactions: freezed == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sessions: freezed == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionModel>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,appleId: freezed == appleId ? _self.appleId : appleId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as int?,createdByAdmin: freezed == createdByAdmin ? _self.createdByAdmin : createdByAdmin // ignore: cast_nullable_to_non_nullable
as bool?,telegramToken: freezed == telegramToken ? _self.telegramToken : telegramToken // ignore: cast_nullable_to_non_nullable
as String?,emailLC: freezed == emailLC ? _self.emailLC : emailLC // ignore: cast_nullable_to_non_nullable
as String?,lastAnimeType: freezed == lastAnimeType ? _self.lastAnimeType : lastAnimeType // ignore: cast_nullable_to_non_nullable
as String?,nameLC: freezed == nameLC ? _self.nameLC : nameLC // ignore: cast_nullable_to_non_nullable
as String?,phoneStr: freezed == phoneStr ? _self.phoneStr : phoneStr // ignore: cast_nullable_to_non_nullable
as String?,paymentIdStr: freezed == paymentIdStr ? _self.paymentIdStr : paymentIdStr // ignore: cast_nullable_to_non_nullable
as String?,lastAnime: freezed == lastAnime ? _self.lastAnime : lastAnime // ignore: cast_nullable_to_non_nullable
as AnimeModel?,tokenId: freezed == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String?,savedSeries: freezed == savedSeries ? _self._savedSeries : savedSeries // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,savedMovies: freezed == savedMovies ? _self._savedMovies : savedMovies // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,privacySettings: freezed == privacySettings ? _self.privacySettings : privacySettings // ignore: cast_nullable_to_non_nullable
as PrivacyModel?,
  ));
}

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacyModelCopyWith<$Res>? get privacySettings {
    if (_self.privacySettings == null) {
    return null;
  }

  return $PrivacyModelCopyWith<$Res>(_self.privacySettings!, (value) {
    return _then(_self.copyWith(privacySettings: value));
  });
}
}

// dart format on
