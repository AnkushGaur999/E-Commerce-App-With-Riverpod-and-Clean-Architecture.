// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthInitial value)?  initial,TResult Function( _AuthLoading value)?  loading,TResult Function( _AuthLoginSucess value)?  loginSuccess,TResult Function( _AuthLoginError value)?  loginError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthLoading() when loading != null:
return loading(_that);case _AuthLoginSucess() when loginSuccess != null:
return loginSuccess(_that);case _AuthLoginError() when loginError != null:
return loginError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthInitial value)  initial,required TResult Function( _AuthLoading value)  loading,required TResult Function( _AuthLoginSucess value)  loginSuccess,required TResult Function( _AuthLoginError value)  loginError,}){
final _that = this;
switch (_that) {
case _AuthInitial():
return initial(_that);case _AuthLoading():
return loading(_that);case _AuthLoginSucess():
return loginSuccess(_that);case _AuthLoginError():
return loginError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthInitial value)?  initial,TResult? Function( _AuthLoading value)?  loading,TResult? Function( _AuthLoginSucess value)?  loginSuccess,TResult? Function( _AuthLoginError value)?  loginError,}){
final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial(_that);case _AuthLoading() when loading != null:
return loading(_that);case _AuthLoginSucess() when loginSuccess != null:
return loginSuccess(_that);case _AuthLoginError() when loginError != null:
return loginError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LoginResponse data)?  loginSuccess,TResult Function( String message)?  loginError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial();case _AuthLoading() when loading != null:
return loading();case _AuthLoginSucess() when loginSuccess != null:
return loginSuccess(_that.data);case _AuthLoginError() when loginError != null:
return loginError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LoginResponse data)  loginSuccess,required TResult Function( String message)  loginError,}) {final _that = this;
switch (_that) {
case _AuthInitial():
return initial();case _AuthLoading():
return loading();case _AuthLoginSucess():
return loginSuccess(_that.data);case _AuthLoginError():
return loginError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LoginResponse data)?  loginSuccess,TResult? Function( String message)?  loginError,}) {final _that = this;
switch (_that) {
case _AuthInitial() when initial != null:
return initial();case _AuthLoading() when loading != null:
return loading();case _AuthLoginSucess() when loginSuccess != null:
return loginSuccess(_that.data);case _AuthLoginError() when loginError != null:
return loginError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AuthInitial implements AuthState {
  const _AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _AuthLoading implements AuthState {
  const _AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _AuthLoginSucess implements AuthState {
  const _AuthLoginSucess({required this.data});
  

 final  LoginResponse data;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthLoginSucessCopyWith<_AuthLoginSucess> get copyWith => __$AuthLoginSucessCopyWithImpl<_AuthLoginSucess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoginSucess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AuthState.loginSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthLoginSucessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthLoginSucessCopyWith(_AuthLoginSucess value, $Res Function(_AuthLoginSucess) _then) = __$AuthLoginSucessCopyWithImpl;
@useResult
$Res call({
 LoginResponse data
});


$LoginResponseCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthLoginSucessCopyWithImpl<$Res>
    implements _$AuthLoginSucessCopyWith<$Res> {
  __$AuthLoginSucessCopyWithImpl(this._self, this._then);

  final _AuthLoginSucess _self;
  final $Res Function(_AuthLoginSucess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_AuthLoginSucess(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginResponse,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<$Res> get data {
  
  return $LoginResponseCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class _AuthLoginError implements AuthState {
  const _AuthLoginError({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthLoginErrorCopyWith<_AuthLoginError> get copyWith => __$AuthLoginErrorCopyWithImpl<_AuthLoginError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoginError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.loginError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AuthLoginErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthLoginErrorCopyWith(_AuthLoginError value, $Res Function(_AuthLoginError) _then) = __$AuthLoginErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AuthLoginErrorCopyWithImpl<$Res>
    implements _$AuthLoginErrorCopyWith<$Res> {
  __$AuthLoginErrorCopyWithImpl(this._self, this._then);

  final _AuthLoginError _self;
  final $Res Function(_AuthLoginError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AuthLoginError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
