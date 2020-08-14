// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bt_connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BtConnectionStateTearOff {
  const _$BtConnectionStateTearOff();

// ignore: unused_element
  _BtConnectionStateConnected connected() {
    return const _BtConnectionStateConnected();
  }

// ignore: unused_element
  _BtConnectionStateConnecting connecting() {
    return const _BtConnectionStateConnecting();
  }

// ignore: unused_element
  _BtConnectionStateDisconnected disconnected() {
    return const _BtConnectionStateDisconnected();
  }

// ignore: unused_element
  _BtConnectionStateFailure failure({@required String message}) {
    return _BtConnectionStateFailure(
      message: message,
    );
  }
}

// ignore: unused_element
const $BtConnectionState = _$BtConnectionStateTearOff();

mixin _$BtConnectionState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connected(),
    @required Result connecting(),
    @required Result disconnected(),
    @required Result failure(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connected(),
    Result connecting(),
    Result disconnected(),
    Result failure(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connected(_BtConnectionStateConnected value),
    @required Result connecting(_BtConnectionStateConnecting value),
    @required Result disconnected(_BtConnectionStateDisconnected value),
    @required Result failure(_BtConnectionStateFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connected(_BtConnectionStateConnected value),
    Result connecting(_BtConnectionStateConnecting value),
    Result disconnected(_BtConnectionStateDisconnected value),
    Result failure(_BtConnectionStateFailure value),
    @required Result orElse(),
  });
}

abstract class $BtConnectionStateCopyWith<$Res> {
  factory $BtConnectionStateCopyWith(
          BtConnectionState value, $Res Function(BtConnectionState) then) =
      _$BtConnectionStateCopyWithImpl<$Res>;
}

class _$BtConnectionStateCopyWithImpl<$Res>
    implements $BtConnectionStateCopyWith<$Res> {
  _$BtConnectionStateCopyWithImpl(this._value, this._then);

  final BtConnectionState _value;
  // ignore: unused_field
  final $Res Function(BtConnectionState) _then;
}

abstract class _$BtConnectionStateConnectedCopyWith<$Res> {
  factory _$BtConnectionStateConnectedCopyWith(
          _BtConnectionStateConnected value,
          $Res Function(_BtConnectionStateConnected) then) =
      __$BtConnectionStateConnectedCopyWithImpl<$Res>;
}

class __$BtConnectionStateConnectedCopyWithImpl<$Res>
    extends _$BtConnectionStateCopyWithImpl<$Res>
    implements _$BtConnectionStateConnectedCopyWith<$Res> {
  __$BtConnectionStateConnectedCopyWithImpl(_BtConnectionStateConnected _value,
      $Res Function(_BtConnectionStateConnected) _then)
      : super(_value, (v) => _then(v as _BtConnectionStateConnected));

  @override
  _BtConnectionStateConnected get _value =>
      super._value as _BtConnectionStateConnected;
}

class _$_BtConnectionStateConnected implements _BtConnectionStateConnected {
  const _$_BtConnectionStateConnected();

  @override
  String toString() {
    return 'BtConnectionState.connected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _BtConnectionStateConnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connected(),
    @required Result connecting(),
    @required Result disconnected(),
    @required Result failure(String message),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return connected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connected(),
    Result connecting(),
    Result disconnected(),
    Result failure(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connected(_BtConnectionStateConnected value),
    @required Result connecting(_BtConnectionStateConnecting value),
    @required Result disconnected(_BtConnectionStateDisconnected value),
    @required Result failure(_BtConnectionStateFailure value),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return connected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connected(_BtConnectionStateConnected value),
    Result connecting(_BtConnectionStateConnecting value),
    Result disconnected(_BtConnectionStateDisconnected value),
    Result failure(_BtConnectionStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _BtConnectionStateConnected implements BtConnectionState {
  const factory _BtConnectionStateConnected() = _$_BtConnectionStateConnected;
}

abstract class _$BtConnectionStateConnectingCopyWith<$Res> {
  factory _$BtConnectionStateConnectingCopyWith(
          _BtConnectionStateConnecting value,
          $Res Function(_BtConnectionStateConnecting) then) =
      __$BtConnectionStateConnectingCopyWithImpl<$Res>;
}

class __$BtConnectionStateConnectingCopyWithImpl<$Res>
    extends _$BtConnectionStateCopyWithImpl<$Res>
    implements _$BtConnectionStateConnectingCopyWith<$Res> {
  __$BtConnectionStateConnectingCopyWithImpl(
      _BtConnectionStateConnecting _value,
      $Res Function(_BtConnectionStateConnecting) _then)
      : super(_value, (v) => _then(v as _BtConnectionStateConnecting));

  @override
  _BtConnectionStateConnecting get _value =>
      super._value as _BtConnectionStateConnecting;
}

class _$_BtConnectionStateConnecting implements _BtConnectionStateConnecting {
  const _$_BtConnectionStateConnecting();

  @override
  String toString() {
    return 'BtConnectionState.connecting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _BtConnectionStateConnecting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connected(),
    @required Result connecting(),
    @required Result disconnected(),
    @required Result failure(String message),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return connecting();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connected(),
    Result connecting(),
    Result disconnected(),
    Result failure(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connected(_BtConnectionStateConnected value),
    @required Result connecting(_BtConnectionStateConnecting value),
    @required Result disconnected(_BtConnectionStateDisconnected value),
    @required Result failure(_BtConnectionStateFailure value),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connected(_BtConnectionStateConnected value),
    Result connecting(_BtConnectionStateConnecting value),
    Result disconnected(_BtConnectionStateDisconnected value),
    Result failure(_BtConnectionStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _BtConnectionStateConnecting implements BtConnectionState {
  const factory _BtConnectionStateConnecting() = _$_BtConnectionStateConnecting;
}

abstract class _$BtConnectionStateDisconnectedCopyWith<$Res> {
  factory _$BtConnectionStateDisconnectedCopyWith(
          _BtConnectionStateDisconnected value,
          $Res Function(_BtConnectionStateDisconnected) then) =
      __$BtConnectionStateDisconnectedCopyWithImpl<$Res>;
}

class __$BtConnectionStateDisconnectedCopyWithImpl<$Res>
    extends _$BtConnectionStateCopyWithImpl<$Res>
    implements _$BtConnectionStateDisconnectedCopyWith<$Res> {
  __$BtConnectionStateDisconnectedCopyWithImpl(
      _BtConnectionStateDisconnected _value,
      $Res Function(_BtConnectionStateDisconnected) _then)
      : super(_value, (v) => _then(v as _BtConnectionStateDisconnected));

  @override
  _BtConnectionStateDisconnected get _value =>
      super._value as _BtConnectionStateDisconnected;
}

class _$_BtConnectionStateDisconnected
    implements _BtConnectionStateDisconnected {
  const _$_BtConnectionStateDisconnected();

  @override
  String toString() {
    return 'BtConnectionState.disconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _BtConnectionStateDisconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connected(),
    @required Result connecting(),
    @required Result disconnected(),
    @required Result failure(String message),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return disconnected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connected(),
    Result connecting(),
    Result disconnected(),
    Result failure(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connected(_BtConnectionStateConnected value),
    @required Result connecting(_BtConnectionStateConnecting value),
    @required Result disconnected(_BtConnectionStateDisconnected value),
    @required Result failure(_BtConnectionStateFailure value),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connected(_BtConnectionStateConnected value),
    Result connecting(_BtConnectionStateConnecting value),
    Result disconnected(_BtConnectionStateDisconnected value),
    Result failure(_BtConnectionStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _BtConnectionStateDisconnected implements BtConnectionState {
  const factory _BtConnectionStateDisconnected() =
      _$_BtConnectionStateDisconnected;
}

abstract class _$BtConnectionStateFailureCopyWith<$Res> {
  factory _$BtConnectionStateFailureCopyWith(_BtConnectionStateFailure value,
          $Res Function(_BtConnectionStateFailure) then) =
      __$BtConnectionStateFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$BtConnectionStateFailureCopyWithImpl<$Res>
    extends _$BtConnectionStateCopyWithImpl<$Res>
    implements _$BtConnectionStateFailureCopyWith<$Res> {
  __$BtConnectionStateFailureCopyWithImpl(_BtConnectionStateFailure _value,
      $Res Function(_BtConnectionStateFailure) _then)
      : super(_value, (v) => _then(v as _BtConnectionStateFailure));

  @override
  _BtConnectionStateFailure get _value =>
      super._value as _BtConnectionStateFailure;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_BtConnectionStateFailure(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_BtConnectionStateFailure implements _BtConnectionStateFailure {
  const _$_BtConnectionStateFailure({@required this.message})
      : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'BtConnectionState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BtConnectionStateFailure &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$BtConnectionStateFailureCopyWith<_BtConnectionStateFailure> get copyWith =>
      __$BtConnectionStateFailureCopyWithImpl<_BtConnectionStateFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result connected(),
    @required Result connecting(),
    @required Result disconnected(),
    @required Result failure(String message),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return failure(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result connected(),
    Result connecting(),
    Result disconnected(),
    Result failure(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result connected(_BtConnectionStateConnected value),
    @required Result connecting(_BtConnectionStateConnecting value),
    @required Result disconnected(_BtConnectionStateDisconnected value),
    @required Result failure(_BtConnectionStateFailure value),
  }) {
    assert(connected != null);
    assert(connecting != null);
    assert(disconnected != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result connected(_BtConnectionStateConnected value),
    Result connecting(_BtConnectionStateConnecting value),
    Result disconnected(_BtConnectionStateDisconnected value),
    Result failure(_BtConnectionStateFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _BtConnectionStateFailure implements BtConnectionState {
  const factory _BtConnectionStateFailure({@required String message}) =
      _$_BtConnectionStateFailure;

  String get message;
  _$BtConnectionStateFailureCopyWith<_BtConnectionStateFailure> get copyWith;
}
