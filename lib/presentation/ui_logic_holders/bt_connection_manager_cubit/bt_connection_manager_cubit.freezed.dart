// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bt_connection_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BtConnectionManagerStateTearOff {
  const _$BtConnectionManagerStateTearOff();

// ignore: unused_element
  _BtConnectionManagerStateIdle idle() {
    return const _BtConnectionManagerStateIdle();
  }

// ignore: unused_element
  _BtConnectionManagerStateMessage message(String message) {
    return _BtConnectionManagerStateMessage(
      message,
    );
  }
}

// ignore: unused_element
const $BtConnectionManagerState = _$BtConnectionManagerStateTearOff();

mixin _$BtConnectionManagerState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result message(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result message(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(_BtConnectionManagerStateIdle value),
    @required Result message(_BtConnectionManagerStateMessage value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_BtConnectionManagerStateIdle value),
    Result message(_BtConnectionManagerStateMessage value),
    @required Result orElse(),
  });
}

abstract class $BtConnectionManagerStateCopyWith<$Res> {
  factory $BtConnectionManagerStateCopyWith(BtConnectionManagerState value,
          $Res Function(BtConnectionManagerState) then) =
      _$BtConnectionManagerStateCopyWithImpl<$Res>;
}

class _$BtConnectionManagerStateCopyWithImpl<$Res>
    implements $BtConnectionManagerStateCopyWith<$Res> {
  _$BtConnectionManagerStateCopyWithImpl(this._value, this._then);

  final BtConnectionManagerState _value;
  // ignore: unused_field
  final $Res Function(BtConnectionManagerState) _then;
}

abstract class _$BtConnectionManagerStateIdleCopyWith<$Res> {
  factory _$BtConnectionManagerStateIdleCopyWith(
          _BtConnectionManagerStateIdle value,
          $Res Function(_BtConnectionManagerStateIdle) then) =
      __$BtConnectionManagerStateIdleCopyWithImpl<$Res>;
}

class __$BtConnectionManagerStateIdleCopyWithImpl<$Res>
    extends _$BtConnectionManagerStateCopyWithImpl<$Res>
    implements _$BtConnectionManagerStateIdleCopyWith<$Res> {
  __$BtConnectionManagerStateIdleCopyWithImpl(
      _BtConnectionManagerStateIdle _value,
      $Res Function(_BtConnectionManagerStateIdle) _then)
      : super(_value, (v) => _then(v as _BtConnectionManagerStateIdle));

  @override
  _BtConnectionManagerStateIdle get _value =>
      super._value as _BtConnectionManagerStateIdle;
}

class _$_BtConnectionManagerStateIdle implements _BtConnectionManagerStateIdle {
  const _$_BtConnectionManagerStateIdle();

  @override
  String toString() {
    return 'BtConnectionManagerState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _BtConnectionManagerStateIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result message(String message),
  }) {
    assert(idle != null);
    assert(message != null);
    return idle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result message(String message),
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
    @required Result idle(_BtConnectionManagerStateIdle value),
    @required Result message(_BtConnectionManagerStateMessage value),
  }) {
    assert(idle != null);
    assert(message != null);
    return idle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_BtConnectionManagerStateIdle value),
    Result message(_BtConnectionManagerStateMessage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _BtConnectionManagerStateIdle
    implements BtConnectionManagerState {
  const factory _BtConnectionManagerStateIdle() =
      _$_BtConnectionManagerStateIdle;
}

abstract class _$BtConnectionManagerStateMessageCopyWith<$Res> {
  factory _$BtConnectionManagerStateMessageCopyWith(
          _BtConnectionManagerStateMessage value,
          $Res Function(_BtConnectionManagerStateMessage) then) =
      __$BtConnectionManagerStateMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$BtConnectionManagerStateMessageCopyWithImpl<$Res>
    extends _$BtConnectionManagerStateCopyWithImpl<$Res>
    implements _$BtConnectionManagerStateMessageCopyWith<$Res> {
  __$BtConnectionManagerStateMessageCopyWithImpl(
      _BtConnectionManagerStateMessage _value,
      $Res Function(_BtConnectionManagerStateMessage) _then)
      : super(_value, (v) => _then(v as _BtConnectionManagerStateMessage));

  @override
  _BtConnectionManagerStateMessage get _value =>
      super._value as _BtConnectionManagerStateMessage;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_BtConnectionManagerStateMessage(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_BtConnectionManagerStateMessage
    implements _BtConnectionManagerStateMessage {
  const _$_BtConnectionManagerStateMessage(this.message)
      : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'BtConnectionManagerState.message(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BtConnectionManagerStateMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$BtConnectionManagerStateMessageCopyWith<_BtConnectionManagerStateMessage>
      get copyWith => __$BtConnectionManagerStateMessageCopyWithImpl<
          _BtConnectionManagerStateMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result message(String message),
  }) {
    assert(idle != null);
    assert(message != null);
    return message(this.message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result message(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (message != null) {
      return message(this.message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(_BtConnectionManagerStateIdle value),
    @required Result message(_BtConnectionManagerStateMessage value),
  }) {
    assert(idle != null);
    assert(message != null);
    return message(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(_BtConnectionManagerStateIdle value),
    Result message(_BtConnectionManagerStateMessage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class _BtConnectionManagerStateMessage
    implements BtConnectionManagerState {
  const factory _BtConnectionManagerStateMessage(String message) =
      _$_BtConnectionManagerStateMessage;

  String get message;
  _$BtConnectionManagerStateMessageCopyWith<_BtConnectionManagerStateMessage>
      get copyWith;
}
