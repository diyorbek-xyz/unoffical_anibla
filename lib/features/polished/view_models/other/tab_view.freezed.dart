// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabView {

 TabItem get tab; Widget get view;
/// Create a copy of TabView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabViewCopyWith<TabView> get copyWith => _$TabViewCopyWithImpl<TabView>(this as TabView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabView&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,tab,view);

@override
String toString() {
  return 'TabView(tab: $tab, view: $view)';
}


}

/// @nodoc
abstract mixin class $TabViewCopyWith<$Res>  {
  factory $TabViewCopyWith(TabView value, $Res Function(TabView) _then) = _$TabViewCopyWithImpl;
@useResult
$Res call({
 TabItem tab, Widget view
});


$TabItemCopyWith<$Res> get tab;

}
/// @nodoc
class _$TabViewCopyWithImpl<$Res>
    implements $TabViewCopyWith<$Res> {
  _$TabViewCopyWithImpl(this._self, this._then);

  final TabView _self;
  final $Res Function(TabView) _then;

/// Create a copy of TabView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tab = null,Object? view = null,}) {
  return _then(_self.copyWith(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as TabItem,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}
/// Create a copy of TabView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabItemCopyWith<$Res> get tab {
  
  return $TabItemCopyWith<$Res>(_self.tab, (value) {
    return _then(_self.copyWith(tab: value));
  });
}
}


/// Adds pattern-matching-related methods to [TabView].
extension TabViewPatterns on TabView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabView value)  $default,){
final _that = this;
switch (_that) {
case _TabView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabView value)?  $default,){
final _that = this;
switch (_that) {
case _TabView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TabItem tab,  Widget view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabView() when $default != null:
return $default(_that.tab,_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TabItem tab,  Widget view)  $default,) {final _that = this;
switch (_that) {
case _TabView():
return $default(_that.tab,_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TabItem tab,  Widget view)?  $default,) {final _that = this;
switch (_that) {
case _TabView() when $default != null:
return $default(_that.tab,_that.view);case _:
  return null;

}
}

}

/// @nodoc


class _TabView implements TabView {
  const _TabView(this.tab, this.view);
  

@override final  TabItem tab;
@override final  Widget view;

/// Create a copy of TabView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabViewCopyWith<_TabView> get copyWith => __$TabViewCopyWithImpl<_TabView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabView&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode => Object.hash(runtimeType,tab,view);

@override
String toString() {
  return 'TabView(tab: $tab, view: $view)';
}


}

/// @nodoc
abstract mixin class _$TabViewCopyWith<$Res> implements $TabViewCopyWith<$Res> {
  factory _$TabViewCopyWith(_TabView value, $Res Function(_TabView) _then) = __$TabViewCopyWithImpl;
@override @useResult
$Res call({
 TabItem tab, Widget view
});


@override $TabItemCopyWith<$Res> get tab;

}
/// @nodoc
class __$TabViewCopyWithImpl<$Res>
    implements _$TabViewCopyWith<$Res> {
  __$TabViewCopyWithImpl(this._self, this._then);

  final _TabView _self;
  final $Res Function(_TabView) _then;

/// Create a copy of TabView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? view = null,}) {
  return _then(_TabView(
null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as TabItem,null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}

/// Create a copy of TabView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabItemCopyWith<$Res> get tab {
  
  return $TabItemCopyWith<$Res>(_self.tab, (value) {
    return _then(_self.copyWith(tab: value));
  });
}
}

/// @nodoc
mixin _$TabItem {

 IconData get activeIcon; IconData get icon; String get label;
/// Create a copy of TabItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabItemCopyWith<TabItem> get copyWith => _$TabItemCopyWithImpl<TabItem>(this as TabItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabItem&&(identical(other.activeIcon, activeIcon) || other.activeIcon == activeIcon)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,activeIcon,icon,label);

@override
String toString() {
  return 'TabItem(activeIcon: $activeIcon, icon: $icon, label: $label)';
}


}

/// @nodoc
abstract mixin class $TabItemCopyWith<$Res>  {
  factory $TabItemCopyWith(TabItem value, $Res Function(TabItem) _then) = _$TabItemCopyWithImpl;
@useResult
$Res call({
 IconData activeIcon, IconData icon, String label
});




}
/// @nodoc
class _$TabItemCopyWithImpl<$Res>
    implements $TabItemCopyWith<$Res> {
  _$TabItemCopyWithImpl(this._self, this._then);

  final TabItem _self;
  final $Res Function(TabItem) _then;

/// Create a copy of TabItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeIcon = null,Object? icon = null,Object? label = null,}) {
  return _then(_self.copyWith(
activeIcon: null == activeIcon ? _self.activeIcon : activeIcon // ignore: cast_nullable_to_non_nullable
as IconData,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TabItem].
extension TabItemPatterns on TabItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabItem value)  $default,){
final _that = this;
switch (_that) {
case _TabItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabItem value)?  $default,){
final _that = this;
switch (_that) {
case _TabItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IconData activeIcon,  IconData icon,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabItem() when $default != null:
return $default(_that.activeIcon,_that.icon,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IconData activeIcon,  IconData icon,  String label)  $default,) {final _that = this;
switch (_that) {
case _TabItem():
return $default(_that.activeIcon,_that.icon,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IconData activeIcon,  IconData icon,  String label)?  $default,) {final _that = this;
switch (_that) {
case _TabItem() when $default != null:
return $default(_that.activeIcon,_that.icon,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _TabItem implements TabItem {
  const _TabItem({this.activeIcon = Icons.abc, this.icon = Icons.abc, this.label = ""});
  

@override@JsonKey() final  IconData activeIcon;
@override@JsonKey() final  IconData icon;
@override@JsonKey() final  String label;

/// Create a copy of TabItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabItemCopyWith<_TabItem> get copyWith => __$TabItemCopyWithImpl<_TabItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabItem&&(identical(other.activeIcon, activeIcon) || other.activeIcon == activeIcon)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,activeIcon,icon,label);

@override
String toString() {
  return 'TabItem(activeIcon: $activeIcon, icon: $icon, label: $label)';
}


}

/// @nodoc
abstract mixin class _$TabItemCopyWith<$Res> implements $TabItemCopyWith<$Res> {
  factory _$TabItemCopyWith(_TabItem value, $Res Function(_TabItem) _then) = __$TabItemCopyWithImpl;
@override @useResult
$Res call({
 IconData activeIcon, IconData icon, String label
});




}
/// @nodoc
class __$TabItemCopyWithImpl<$Res>
    implements _$TabItemCopyWith<$Res> {
  __$TabItemCopyWithImpl(this._self, this._then);

  final _TabItem _self;
  final $Res Function(_TabItem) _then;

/// Create a copy of TabItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeIcon = null,Object? icon = null,Object? label = null,}) {
  return _then(_TabItem(
activeIcon: null == activeIcon ? _self.activeIcon : activeIcon // ignore: cast_nullable_to_non_nullable
as IconData,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
