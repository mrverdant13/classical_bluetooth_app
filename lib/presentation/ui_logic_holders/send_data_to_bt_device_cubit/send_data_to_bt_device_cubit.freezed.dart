// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'send_data_to_bt_device_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SendDataToBtDeviceStateTearOff {
  const _$SendDataToBtDeviceStateTearOff();

// ignore: unused_element
  _SendDataToBtDeviceStateIdle idle() {
    return const _SendDataToBtDeviceStateIdle();
  }

// ignore: unused_element
  _SendDataToBtDeviceStateSending sending() {
    return const _SendDataToBtDeviceStateSending();
  }

// ignore: unused_element
  _SendDataToBtDeviceStateSent sent() {
    return const _SendDataToBtDeviceStateSent();
  }

// ignore: unused_element
  _SendDataToBtDeviceStateFailure failure(
      {@required String message, @required bool isConnectionError}) {
    return _SendDataToBtDeviceStateFailure(
      message: message,
      isConnectionError: isConnectionError,
    );
  }
}

// ignore: unused_element
const $SendDataToBtDeviceState = _$SendDataToBtDeviceStateTearOff();

mixin _$SendDataToBtDeviceState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sending(),
    @required Result sent(),
    @required Result failure(String message, bool isConnectionError),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sending(),
    Result sent(),
    Result failure(String message, bool isConnectionError),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(_SendDataToBtDeviceStateIdle value),
    @required Result sending(_SendDataToBtDeviceStateSending value),
    @required Result sent(_SendDataToBtDeviceStateSent value),
    @required Result failure(_SendDataToBtDeviceStateFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_SendDataToBtDeviceStateIdle value),
    Result sending(_SendDataToBtDeviceStateSending value),
    Result sent(_SendDataToBtDeviceStateSent value),
    Result failure(_SendDataToBtDeviceStateFailure value),
    @required Result orElse(),
  });
}

abstract class $SendDataToBtDeviceStateCopyWith<$Res> {
  factory $SendDataToBtDeviceStateCopyWith(SendDataToBtDeviceState value,
          $Res Function(SendDataToBtDeviceState) then) =
      _$SendDataToBtDeviceStateCopyWithImpl<$Res>;
}

class _$SendDataToBtDeviceStateCopyWithImpl<$Res>
    implements $SendDataToBtDeviceStateCopyWith<$Res> {
  _$SendDataToBtDeviceStateCopyWithImpl(this._value, this._then);

  final SendDataToBtDeviceState _value;
  // ignore: unused_field
  final $Res Function(SendDataToBtDeviceState) _then;
}

abstract class _$SendDataToBtDeviceStateIdleCopyWith<$Res> {
  factory _$SendDataToBtDeviceStateIdleCopyWith(
          _SendDataToBtDeviceStateIdle value,
          $Res Function(_SendDataToBtDeviceStateIdle) then) =
      __$SendDataToBtDeviceStateIdleCopyWithImpl<$Res>;
}

class __$SendDataToBtDeviceStateIdleCopyWithImpl<$Res>
    extends _$SendDataToBtDeviceStateCopyWithImpl<$Res>
    implements _$SendDataToBtDeviceStateIdleCopyWith<$Res> {
  __$SendDataToBtDeviceStateIdleCopyWithImpl(
      _SendDataToBtDeviceStateIdle _value,
      $Res Function(_SendDataToBtDeviceStateIdle) _then)
      : super(_value, (v) => _then(v as _SendDataToBtDeviceStateIdle));

  @override
  _SendDataToBtDeviceStateIdle get _value =>
      super._value as _SendDataToBtDeviceStateIdle;
}

class _$_SendDataToBtDeviceStateIdle implements _SendDataToBtDeviceStateIdle {
  const _$_SendDataToBtDeviceStateIdle();

  @override
  String toString() {
    return 'SendDataToBtDeviceState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SendDataToBtDeviceStateIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sending(),
    @required Result sent(),
    @required Result failure(String message, bool isConnectionError),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return idle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sending(),
    Result sent(),
    Result failure(String message, bool isConnectionError),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(_SendDataToBtDeviceStateIdle value),
    @required Result sending(_SendDataToBtDeviceStateSending value),
    @required Result sent(_SendDataToBtDeviceStateSent value),
    @required Result failure(_SendDataToBtDeviceStateFailure value),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return idle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_SendDataToBtDeviceStateIdle value),
    Result sending(_SendDataToBtDeviceStateSending value),
    Result sent(_SendDataToBtDeviceStateSent value),
    Result failure(_SendDataToBtDeviceStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _SendDataToBtDeviceStateIdle implements SendDataToBtDeviceState {
  const factory _SendDataToBtDeviceStateIdle() = _$_SendDataToBtDeviceStateIdle;
}

abstract class _$SendDataToBtDeviceStateSendingCopyWith<$Res> {
  factory _$SendDataToBtDeviceStateSendingCopyWith(
          _SendDataToBtDeviceStateSending value,
          $Res Function(_SendDataToBtDeviceStateSending) then) =
      __$SendDataToBtDeviceStateSendingCopyWithImpl<$Res>;
}

class __$SendDataToBtDeviceStateSendingCopyWithImpl<$Res>
    extends _$SendDataToBtDeviceStateCopyWithImpl<$Res>
    implements _$SendDataToBtDeviceStateSendingCopyWith<$Res> {
  __$SendDataToBtDeviceStateSendingCopyWithImpl(
      _SendDataToBtDeviceStateSending _value,
      $Res Function(_SendDataToBtDeviceStateSending) _then)
      : super(_value, (v) => _then(v as _SendDataToBtDeviceStateSending));

  @override
  _SendDataToBtDeviceStateSending get _value =>
      super._value as _SendDataToBtDeviceStateSending;
}

class _$_SendDataToBtDeviceStateSending
    implements _SendDataToBtDeviceStateSending {
  const _$_SendDataToBtDeviceStateSending();

  @override
  String toString() {
    return 'SendDataToBtDeviceState.sending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SendDataToBtDeviceStateSending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sending(),
    @required Result sent(),
    @required Result failure(String message, bool isConnectionError),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return sending();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sending(),
    Result sent(),
    Result failure(String message, bool isConnectionError),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sending != null) {
      return sending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(_SendDataToBtDeviceStateIdle value),
    @required Result sending(_SendDataToBtDeviceStateSending value),
    @required Result sent(_SendDataToBtDeviceStateSent value),
    @required Result failure(_SendDataToBtDeviceStateFailure value),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return sending(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_SendDataToBtDeviceStateIdle value),
    Result sending(_SendDataToBtDeviceStateSending value),
    Result sent(_SendDataToBtDeviceStateSent value),
    Result failure(_SendDataToBtDeviceStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class _SendDataToBtDeviceStateSending
    implements SendDataToBtDeviceState {
  const factory _SendDataToBtDeviceStateSending() =
      _$_SendDataToBtDeviceStateSending;
}

abstract class _$SendDataToBtDeviceStateSentCopyWith<$Res> {
  factory _$SendDataToBtDeviceStateSentCopyWith(
          _SendDataToBtDeviceStateSent value,
          $Res Function(_SendDataToBtDeviceStateSent) then) =
      __$SendDataToBtDeviceStateSentCopyWithImpl<$Res>;
}

class __$SendDataToBtDeviceStateSentCopyWithImpl<$Res>
    extends _$SendDataToBtDeviceStateCopyWithImpl<$Res>
    implements _$SendDataToBtDeviceStateSentCopyWith<$Res> {
  __$SendDataToBtDeviceStateSentCopyWithImpl(
      _SendDataToBtDeviceStateSent _value,
      $Res Function(_SendDataToBtDeviceStateSent) _then)
      : super(_value, (v) => _then(v as _SendDataToBtDeviceStateSent));

  @override
  _SendDataToBtDeviceStateSent get _value =>
      super._value as _SendDataToBtDeviceStateSent;
}

class _$_SendDataToBtDeviceStateSent implements _SendDataToBtDeviceStateSent {
  const _$_SendDataToBtDeviceStateSent();

  @override
  String toString() {
    return 'SendDataToBtDeviceState.sent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SendDataToBtDeviceStateSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sending(),
    @required Result sent(),
    @required Result failure(String message, bool isConnectionError),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return sent();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sending(),
    Result sent(),
    Result failure(String message, bool isConnectionError),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sent != null) {
      return sent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(_SendDataToBtDeviceStateIdle value),
    @required Result sending(_SendDataToBtDeviceStateSending value),
    @required Result sent(_SendDataToBtDeviceStateSent value),
    @required Result failure(_SendDataToBtDeviceStateFailure value),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return sent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_SendDataToBtDeviceStateIdle value),
    Result sending(_SendDataToBtDeviceStateSending value),
    Result sent(_SendDataToBtDeviceStateSent value),
    Result failure(_SendDataToBtDeviceStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sent != null) {
      return sent(this);
    }
    return orElse();
  }
}

abstract class _SendDataToBtDeviceStateSent implements SendDataToBtDeviceState {
  const factory _SendDataToBtDeviceStateSent() = _$_SendDataToBtDeviceStateSent;
}

abstract class _$SendDataToBtDeviceStateFailureCopyWith<$Res> {
  factory _$SendDataToBtDeviceStateFailureCopyWith(
          _SendDataToBtDeviceStateFailure value,
          $Res Function(_SendDataToBtDeviceStateFailure) then) =
      __$SendDataToBtDeviceStateFailureCopyWithImpl<$Res>;
  $Res call({String message, bool isConnectionError});
}

class __$SendDataToBtDeviceStateFailureCopyWithImpl<$Res>
    extends _$SendDataToBtDeviceStateCopyWithImpl<$Res>
    implements _$SendDataToBtDeviceStateFailureCopyWith<$Res> {
  __$SendDataToBtDeviceStateFailureCopyWithImpl(
      _SendDataToBtDeviceStateFailure _value,
      $Res Function(_SendDataToBtDeviceStateFailure) _then)
      : super(_value, (v) => _then(v as _SendDataToBtDeviceStateFailure));

  @override
  _SendDataToBtDeviceStateFailure get _value =>
      super._value as _SendDataToBtDeviceStateFailure;

  @override
  $Res call({
    Object message = freezed,
    Object isConnectionError = freezed,
  }) {
    return _then(_SendDataToBtDeviceStateFailure(
      message: message == freezed ? _value.message : message as String,
      isConnectionError: isConnectionError == freezed
          ? _value.isConnectionError
          : isConnectionError as bool,
    ));
  }
}

class _$_SendDataToBtDeviceStateFailure
    implements _SendDataToBtDeviceStateFailure {
  const _$_SendDataToBtDeviceStateFailure(
      {@required this.message, @required this.isConnectionError})
      : assert(message != null),
        assert(isConnectionError != null);

  @override
  final String message;
  @override
  final bool isConnectionError;

  @override
  String toString() {
    return 'SendDataToBtDeviceState.failure(message: $message, isConnectionError: $isConnectionError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendDataToBtDeviceStateFailure &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.isConnectionError, isConnectionError) ||
                const DeepCollectionEquality()
                    .equals(other.isConnectionError, isConnectionError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(isConnectionError);

  @override
  _$SendDataToBtDeviceStateFailureCopyWith<_SendDataToBtDeviceStateFailure>
      get copyWith => __$SendDataToBtDeviceStateFailureCopyWithImpl<
          _SendDataToBtDeviceStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sending(),
    @required Result sent(),
    @required Result failure(String message, bool isConnectionError),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return failure(message, isConnectionError);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sending(),
    Result sent(),
    Result failure(String message, bool isConnectionError),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(message, isConnectionError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(_SendDataToBtDeviceStateIdle value),
    @required Result sending(_SendDataToBtDeviceStateSending value),
    @required Result sent(_SendDataToBtDeviceStateSent value),
    @required Result failure(_SendDataToBtDeviceStateFailure value),
  }) {
    assert(idle != null);
    assert(sending != null);
    assert(sent != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_SendDataToBtDeviceStateIdle value),
    Result sending(_SendDataToBtDeviceStateSending value),
    Result sent(_SendDataToBtDeviceStateSent value),
    Result failure(_SendDataToBtDeviceStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _SendDataToBtDeviceStateFailure
    implements SendDataToBtDeviceState {
  const factory _SendDataToBtDeviceStateFailure(
      {@required String message,
      @required bool isConnectionError}) = _$_SendDataToBtDeviceStateFailure;

  String get message;
  bool get isConnectionError;
  _$SendDataToBtDeviceStateFailureCopyWith<_SendDataToBtDeviceStateFailure>
      get copyWith;
}
