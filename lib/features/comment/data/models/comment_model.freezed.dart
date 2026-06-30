// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentModel {

@JsonKey(name: "_id") String? get id;@JsonKey(name: "is_active") bool? get isActive; int? get likesCount; String? get message; int? get isCurrentUser;@JsonKey(name: "replies_count") int? get repliesCount; DateTime? get createdAt; ProfileModel? get user;@JsonKey(name: "user_id") ProfileModel? get userId;
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentModelCopyWith<CommentModel> get copyWith => _$CommentModelCopyWithImpl<CommentModel>(this as CommentModel, _$identity);

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.message, message) || other.message == message)&&(identical(other.isCurrentUser, isCurrentUser) || other.isCurrentUser == isCurrentUser)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isActive,likesCount,message,isCurrentUser,repliesCount,createdAt,user,userId);

@override
String toString() {
  return 'CommentModel(id: $id, isActive: $isActive, likesCount: $likesCount, message: $message, isCurrentUser: $isCurrentUser, repliesCount: $repliesCount, createdAt: $createdAt, user: $user, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res>  {
  factory $CommentModelCopyWith(CommentModel value, $Res Function(CommentModel) _then) = _$CommentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String? id,@JsonKey(name: "is_active") bool? isActive, int? likesCount, String? message, int? isCurrentUser,@JsonKey(name: "replies_count") int? repliesCount, DateTime? createdAt, ProfileModel? user,@JsonKey(name: "user_id") ProfileModel? userId
});


$ProfileModelCopyWith<$Res>? get user;$ProfileModelCopyWith<$Res>? get userId;

}
/// @nodoc
class _$CommentModelCopyWithImpl<$Res>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._self, this._then);

  final CommentModel _self;
  final $Res Function(CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? isActive = freezed,Object? likesCount = freezed,Object? message = freezed,Object? isCurrentUser = freezed,Object? repliesCount = freezed,Object? createdAt = freezed,Object? user = freezed,Object? userId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,likesCount: freezed == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isCurrentUser: freezed == isCurrentUser ? _self.isCurrentUser : isCurrentUser // ignore: cast_nullable_to_non_nullable
as int?,repliesCount: freezed == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as ProfileModel?,
  ));
}
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get userId {
    if (_self.userId == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.userId!, (value) {
    return _then(_self.copyWith(userId: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommentModel].
extension CommentModelPatterns on CommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String? id, @JsonKey(name: "is_active")  bool? isActive,  int? likesCount,  String? message,  int? isCurrentUser, @JsonKey(name: "replies_count")  int? repliesCount,  DateTime? createdAt,  ProfileModel? user, @JsonKey(name: "user_id")  ProfileModel? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.isActive,_that.likesCount,_that.message,_that.isCurrentUser,_that.repliesCount,_that.createdAt,_that.user,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String? id, @JsonKey(name: "is_active")  bool? isActive,  int? likesCount,  String? message,  int? isCurrentUser, @JsonKey(name: "replies_count")  int? repliesCount,  DateTime? createdAt,  ProfileModel? user, @JsonKey(name: "user_id")  ProfileModel? userId)  $default,) {final _that = this;
switch (_that) {
case _CommentModel():
return $default(_that.id,_that.isActive,_that.likesCount,_that.message,_that.isCurrentUser,_that.repliesCount,_that.createdAt,_that.user,_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String? id, @JsonKey(name: "is_active")  bool? isActive,  int? likesCount,  String? message,  int? isCurrentUser, @JsonKey(name: "replies_count")  int? repliesCount,  DateTime? createdAt,  ProfileModel? user, @JsonKey(name: "user_id")  ProfileModel? userId)?  $default,) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.isActive,_that.likesCount,_that.message,_that.isCurrentUser,_that.repliesCount,_that.createdAt,_that.user,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentModel implements CommentModel {
   _CommentModel({@JsonKey(name: "_id") this.id, @JsonKey(name: "is_active") this.isActive, this.likesCount, this.message, this.isCurrentUser, @JsonKey(name: "replies_count") this.repliesCount, this.createdAt, this.user, @JsonKey(name: "user_id") this.userId});
  factory _CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

@override@JsonKey(name: "_id") final  String? id;
@override@JsonKey(name: "is_active") final  bool? isActive;
@override final  int? likesCount;
@override final  String? message;
@override final  int? isCurrentUser;
@override@JsonKey(name: "replies_count") final  int? repliesCount;
@override final  DateTime? createdAt;
@override final  ProfileModel? user;
@override@JsonKey(name: "user_id") final  ProfileModel? userId;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentModelCopyWith<_CommentModel> get copyWith => __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.message, message) || other.message == message)&&(identical(other.isCurrentUser, isCurrentUser) || other.isCurrentUser == isCurrentUser)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isActive,likesCount,message,isCurrentUser,repliesCount,createdAt,user,userId);

@override
String toString() {
  return 'CommentModel(id: $id, isActive: $isActive, likesCount: $likesCount, message: $message, isCurrentUser: $isCurrentUser, repliesCount: $repliesCount, createdAt: $createdAt, user: $user, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res> implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(_CommentModel value, $Res Function(_CommentModel) _then) = __$CommentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String? id,@JsonKey(name: "is_active") bool? isActive, int? likesCount, String? message, int? isCurrentUser,@JsonKey(name: "replies_count") int? repliesCount, DateTime? createdAt, ProfileModel? user,@JsonKey(name: "user_id") ProfileModel? userId
});


@override $ProfileModelCopyWith<$Res>? get user;@override $ProfileModelCopyWith<$Res>? get userId;

}
/// @nodoc
class __$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(this._self, this._then);

  final _CommentModel _self;
  final $Res Function(_CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? isActive = freezed,Object? likesCount = freezed,Object? message = freezed,Object? isCurrentUser = freezed,Object? repliesCount = freezed,Object? createdAt = freezed,Object? user = freezed,Object? userId = freezed,}) {
  return _then(_CommentModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,likesCount: freezed == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isCurrentUser: freezed == isCurrentUser ? _self.isCurrentUser : isCurrentUser // ignore: cast_nullable_to_non_nullable
as int?,repliesCount: freezed == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as ProfileModel?,
  ));
}

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get userId {
    if (_self.userId == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.userId!, (value) {
    return _then(_self.copyWith(userId: value));
  });
}
}

// dart format on
