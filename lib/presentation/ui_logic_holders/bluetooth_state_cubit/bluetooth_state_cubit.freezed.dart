// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bluetooth_state_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BluetoothStateStateTearOff {
  const _$BluetoothStateStateTearOff();

// ignore: unused_element
  _BluetoothStateStateFailure failure({@required String message}) {
    return _BluetoothStateStateFailure(
      message: message,
    );
  }

// ignore: unused_element
  _BluetoothStateStateObtained obtained(
      {@required BluetoothStateEntity bluetoothState}) {
    return _BluetoothStateStateObtained(
      bluetoothState: bluetoothState,
    );
  }

// ignore: unused_element
  _BluetoothStateStateObtaining obtaining() {
    return const _BluetoothStateStateObtaining();
  }
}

// ignore: unused_element
const $BluetoothStateState = _$BluetoothStateStateTearOff();

mixin _$BluetoothStateState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result failure(String message),
    @required Result obtained(BluetoothStateEntity bluetoothState),
    @required Result obtaining(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result failure(String message),
    Result obtained(BluetoothStateEntity bluetoothState),
    Result obtaining(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result failure(_BluetoothStateStateFailure value),
    @required Result obtained(_BluetoothStateStateObtained value),
    @required Result obtaining(_BluetoothStateStateObtaining value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result failure(_BluetoothStateStateFailure value),
    Result obtained(_BluetoothStateStateObtained value),
    Result obtaining(_BluetoothStateStateObtaining value),
    @required Result orElse(),
  });
}

abstract class $BluetoothStateStateCopyWith<$Res> {
  factory $BluetoothStateStateCopyWith(
          BluetoothStateState value, $Res Function(BluetoothStateState) then) =
      _$BluetoothStateStateCopyWithImpl<$Res>;
}

class _$BluetoothStateStateCopyWithImpl<$Res>
    implements $BluetoothStateStateCopyWith<$Res> {
  _$BluetoothStateStateCopyWithImpl(this._value, this._then);

  final BluetoothStateState _value;
  // ignore: unused_field
  final $Res Function(BluetoothStateState) _then;
}

abstract class _$BluetoothStateStateFailureCopyWith<$Res> {
  factory _$BluetoothStateStateFailureCopyWith(
          _BluetoothStateStateFailure value,
          $Res Function(_BluetoothStateStateFailure) then) =
      __$BluetoothStateStateFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$BluetoothStateStateFailureCopyWithImpl<$Res>
    extends _$BluetoothStateStateCopyWithImpl<$Res>
    implements _$BluetoothStateStateFailureCopyWith<$Res> {
  __$BluetoothStateStateFailureCopyWithImpl(_BluetoothStateStateFailure _value,
      $Res Function(_BluetoothStateStateFailure) _then)
      : super(_value, (v) => _then(v as _BluetoothStateStateFailure));

  @override
  _BluetoothStateStateFailure get _value =>
      super._value as _BluetoothStateStateFailure;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_BluetoothStateStateFailure(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_BluetoothStateStateFailure implements _BluetoothStateStateFailure {
  const _$_BluetoothStateStateFailure({@required this.message})
      : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'BluetoothStateState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BluetoothStateStateFailure &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$BluetoothStateStateFailureCopyWith<_BluetoothStateStateFailure>
      get copyWith => __$BluetoothStateStateFailureCopyWithImpl<
          _BluetoothStateStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result failure(String message),
    @required Result obtained(BluetoothStateEntity bluetoothState),
    @required Result obtaining(),
  }) {
    assert(failure != null);
    assert(obtained != null);
    assert(obtaining != null);
    return failure(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result failure(String message),
    Result obtained(BluetoothStateEntity bluetoothState),
    Result obtaining(),
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
    @required Result failure(_BluetoothStateStateFailure value),
    @required Result obtained(_BluetoothStateStateObtained value),
    @required Result obtaining(_BluetoothStateStateObtaining value),
  }) {
    assert(failure != null);
    assert(obtained != null);
    assert(obtaining != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result failure(_BluetoothStateStateFailure value),
    Result obtained(_BluetoothStateStateObtained value),
    Result obtaining(_BluetoothStateStateObtaining value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _BluetoothStateStateFailure implements BluetoothStateState {
  const factory _BluetoothStateStateFailure({@required String message}) =
      _$_BluetoothStateStateFailure;

  String get message;
  _$BluetoothStateStateFailureCopyWith<_BluetoothStateStateFailure>
      get copyWith;
}

abstract class _$BluetoothStateStateObtainedCopyWith<$Res> {
  factory _$BluetoothStateStateObtainedCopyWith(
          _BluetoothStateStateObtained value,
          $Res Function(_BluetoothStateStateObtained) then) =
      __$BluetoothStateStateObtainedCopyWithImpl<$Res>;
  $Res call({BluetoothStateEntity bluetoothState});

  $BluetoothStateEntityCopyWith<$Res> get bluetoothState;
}

class __$BluetoothStateStateObtainedCopyWithImpl<$Res>
    extends _$BluetoothStateStateCopyWithImpl<$Res>
    implements _$BluetoothStateStateObtainedCopyWith<$Res> {
  __$BluetoothStateStateObtainedCopyWithImpl(
      _BluetoothStateStateObtained _value,
      $Res Function(_BluetoothStateStateObtained) _then)
      : super(_value, (v) => _then(v as _BluetoothStateStateObtained));

  @override
  _BluetoothStateStateObtained get _value =>
      super._value as _BluetoothStateStateObtained;

  @override
  $Res call({
    Object bluetoothState = freezed,
  }) {
    return _then(_BluetoothStateStateObtained(
      bluetoothState: bluetoothState == freezed
          ? _value.bluetoothState
          : bluetoothState as BluetoothStateEntity,
    ));
  }

  @override
  $BluetoothStateEntityCopyWith<$Res> get bluetoothState {
    if (_value.bluetoothState == null) {
      return null;
    }
    return $BluetoothStateEntityCopyWith<$Res>(_value.bluetoothState, (value) {
      return _then(_value.copyWith(bluetoothState: value));
    });
  }
}

class _$_BluetoothStateStateObtained implements _BluetoothStateStateObtained {
  const _$_BluetoothStateStateObtained({@required this.bluetoothState})
      : assert(bluetoothState != null);

  @override
  final BluetoothStateEntity bluetoothState;

  @override
  String toString() {
    return 'BluetoothStateState.obtained(bluetoothState: $bluetoothState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BluetoothStateStateObtained &&
            (identical(other.bluetoothState, bluetoothState) ||
                const DeepCollectionEquality()
                    .equals(other.bluetoothState, bluetoothState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bluetoothState);

  @override
  _$BluetoothStateStateObtainedCopyWith<_BluetoothStateStateObtained>
      get copyWith => __$BluetoothStateStateObtainedCopyWithImpl<
          _BluetoothStateStateObtained>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result failure(String message),
    @required Result obtained(BluetoothStateEntity bluetoothState),
    @required Result obtaining(),
  }) {
    assert(failure != null);
    assert(obtained != null);
    assert(obtaining != null);
    return obtained(bluetoothState);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result failure(String message),
    Result obtained(BluetoothStateEntity bluetoothState),
    Result obtaining(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (obtained != null) {
      return obtained(bluetoothState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result failure(_BluetoothStateStateFailure value),
    @required Result obtained(_BluetoothStateStateObtained value),
    @required Result obtaining(_BluetoothStateStateObtaining value),
  }) {
    assert(failure != null);
    assert(obtained != null);
    assert(obtaining != null);
    return obtained(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result failure(_BluetoothStateStateFailure value),
    Result obtained(_BluetoothStateStateObtained value),
    Result obtaining(_BluetoothStateStateObtaining value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (obtained != null) {
      return obtained(this);
    }
    return orElse();
  }
}

abstract class _BluetoothStateStateObtained implements BluetoothStateState {
  const factory _BluetoothStateStateObtained(
          {@required BluetoothStateEntity bluetoothState}) =
      _$_BluetoothStateStateObtained;

  BluetoothStateEntity get bluetoothState;
  _$BluetoothStateStateObtainedCopyWith<_BluetoothStateStateObtained>
      get copyWith;
}

abstract class _$BluetoothStateStateObtainingCopyWith<$Res> {
  factory _$BluetoothStateStateObtainingCopyWith(
          _BluetoothStateStateObtaining value,
          $Res Function(_BluetoothStateStateObtaining) then) =
      __$BluetoothStateStateObtainingCopyWithImpl<$Res>;
}

class __$BluetoothStateStateObtainingCopyWithImpl<$Res>
    extends _$BluetoothStateStateCopyWithImpl<$Res>
    implements _$BluetoothStateStateObtainingCopyWith<$Res> {
  __$BluetoothStateStateObtainingCopyWithImpl(
      _BluetoothStateStateObtaining _value,
      $Res Function(_BluetoothStateStateObtaining) _then)
      : super(_value, (v) => _then(v as _BluetoothStateStateObtaining));

  @override
  _BluetoothStateStateObtaining get _value =>
      super._value as _BluetoothStateStateObtaining;
}

class _$_BluetoothStateStateObtaining implements _BluetoothStateStateObtaining {
  const _$_BluetoothStateStateObtaining();

  @override
  String toString() {
    return 'BluetoothStateState.obtaining()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _BluetoothStateStateObtaining);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result failure(String message),
    @required Result obtained(BluetoothStateEntity bluetoothState),
    @required Result obtaining(),
  }) {
    assert(failure != null);
    assert(obtained != null);
    assert(obtaining != null);
    return obtaining();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result failure(String message),
    Result obtained(BluetoothStateEntity bluetoothState),
    Result obtaining(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (obtaining != null) {
      return obtaining();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result failure(_BluetoothStateStateFailure value),
    @required Result obtained(_BluetoothStateStateObtained value),
    @required Result obtaining(_BluetoothStateStateObtaining value),
  }) {
    assert(failure != null);
    assert(obtained != null);
    assert(obtaining != null);
    return obtaining(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result failure(_BluetoothStateStateFailure value),
    Result obtained(_BluetoothStateStateObtained value),
    Result obtaining(_BluetoothStateStateObtaining value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (obtaining != null) {
      return obtaining(this);
    }
    return orElse();
  }
}

abstract class _BluetoothStateStateObtaining implements BluetoothStateState {
  const factory _BluetoothStateStateObtaining() =
      _$_BluetoothStateStateObtaining;
}
