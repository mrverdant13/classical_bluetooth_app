// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'discovered_bt_devices_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DiscoveredBtDevicesStateTearOff {
  const _$DiscoveredBtDevicesStateTearOff();

// ignore: unused_element
  DiscoveredBtDevicesStateFailure failure({@required String message}) {
    return DiscoveredBtDevicesStateFailure(
      message: message,
    );
  }

// ignore: unused_element
  DiscoveredBtDevicesStateLoaded loaded(
      {@required Set<BtDeviceEntity> discoveredBtDevices,
      @required bool discovering}) {
    return DiscoveredBtDevicesStateLoaded(
      discoveredBtDevices: discoveredBtDevices,
      discovering: discovering,
    );
  }
}

// ignore: unused_element
const $DiscoveredBtDevicesState = _$DiscoveredBtDevicesStateTearOff();

mixin _$DiscoveredBtDevicesState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result failure(String message),
    @required
        Result loaded(
            Set<BtDeviceEntity> discoveredBtDevices, bool discovering),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result failure(String message),
    Result loaded(Set<BtDeviceEntity> discoveredBtDevices, bool discovering),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result failure(DiscoveredBtDevicesStateFailure value),
    @required Result loaded(DiscoveredBtDevicesStateLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result failure(DiscoveredBtDevicesStateFailure value),
    Result loaded(DiscoveredBtDevicesStateLoaded value),
    @required Result orElse(),
  });
}

abstract class $DiscoveredBtDevicesStateCopyWith<$Res> {
  factory $DiscoveredBtDevicesStateCopyWith(DiscoveredBtDevicesState value,
          $Res Function(DiscoveredBtDevicesState) then) =
      _$DiscoveredBtDevicesStateCopyWithImpl<$Res>;
}

class _$DiscoveredBtDevicesStateCopyWithImpl<$Res>
    implements $DiscoveredBtDevicesStateCopyWith<$Res> {
  _$DiscoveredBtDevicesStateCopyWithImpl(this._value, this._then);

  final DiscoveredBtDevicesState _value;
  // ignore: unused_field
  final $Res Function(DiscoveredBtDevicesState) _then;
}

abstract class $DiscoveredBtDevicesStateFailureCopyWith<$Res> {
  factory $DiscoveredBtDevicesStateFailureCopyWith(
          DiscoveredBtDevicesStateFailure value,
          $Res Function(DiscoveredBtDevicesStateFailure) then) =
      _$DiscoveredBtDevicesStateFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$DiscoveredBtDevicesStateFailureCopyWithImpl<$Res>
    extends _$DiscoveredBtDevicesStateCopyWithImpl<$Res>
    implements $DiscoveredBtDevicesStateFailureCopyWith<$Res> {
  _$DiscoveredBtDevicesStateFailureCopyWithImpl(
      DiscoveredBtDevicesStateFailure _value,
      $Res Function(DiscoveredBtDevicesStateFailure) _then)
      : super(_value, (v) => _then(v as DiscoveredBtDevicesStateFailure));

  @override
  DiscoveredBtDevicesStateFailure get _value =>
      super._value as DiscoveredBtDevicesStateFailure;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(DiscoveredBtDevicesStateFailure(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$DiscoveredBtDevicesStateFailure
    implements DiscoveredBtDevicesStateFailure {
  const _$DiscoveredBtDevicesStateFailure({@required this.message})
      : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'DiscoveredBtDevicesState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiscoveredBtDevicesStateFailure &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $DiscoveredBtDevicesStateFailureCopyWith<DiscoveredBtDevicesStateFailure>
      get copyWith => _$DiscoveredBtDevicesStateFailureCopyWithImpl<
          DiscoveredBtDevicesStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result failure(String message),
    @required
        Result loaded(
            Set<BtDeviceEntity> discoveredBtDevices, bool discovering),
  }) {
    assert(failure != null);
    assert(loaded != null);
    return failure(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result failure(String message),
    Result loaded(Set<BtDeviceEntity> discoveredBtDevices, bool discovering),
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
    @required Result failure(DiscoveredBtDevicesStateFailure value),
    @required Result loaded(DiscoveredBtDevicesStateLoaded value),
  }) {
    assert(failure != null);
    assert(loaded != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result failure(DiscoveredBtDevicesStateFailure value),
    Result loaded(DiscoveredBtDevicesStateLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class DiscoveredBtDevicesStateFailure
    implements DiscoveredBtDevicesState {
  const factory DiscoveredBtDevicesStateFailure({@required String message}) =
      _$DiscoveredBtDevicesStateFailure;

  String get message;
  $DiscoveredBtDevicesStateFailureCopyWith<DiscoveredBtDevicesStateFailure>
      get copyWith;
}

abstract class $DiscoveredBtDevicesStateLoadedCopyWith<$Res> {
  factory $DiscoveredBtDevicesStateLoadedCopyWith(
          DiscoveredBtDevicesStateLoaded value,
          $Res Function(DiscoveredBtDevicesStateLoaded) then) =
      _$DiscoveredBtDevicesStateLoadedCopyWithImpl<$Res>;
  $Res call({Set<BtDeviceEntity> discoveredBtDevices, bool discovering});
}

class _$DiscoveredBtDevicesStateLoadedCopyWithImpl<$Res>
    extends _$DiscoveredBtDevicesStateCopyWithImpl<$Res>
    implements $DiscoveredBtDevicesStateLoadedCopyWith<$Res> {
  _$DiscoveredBtDevicesStateLoadedCopyWithImpl(
      DiscoveredBtDevicesStateLoaded _value,
      $Res Function(DiscoveredBtDevicesStateLoaded) _then)
      : super(_value, (v) => _then(v as DiscoveredBtDevicesStateLoaded));

  @override
  DiscoveredBtDevicesStateLoaded get _value =>
      super._value as DiscoveredBtDevicesStateLoaded;

  @override
  $Res call({
    Object discoveredBtDevices = freezed,
    Object discovering = freezed,
  }) {
    return _then(DiscoveredBtDevicesStateLoaded(
      discoveredBtDevices: discoveredBtDevices == freezed
          ? _value.discoveredBtDevices
          : discoveredBtDevices as Set<BtDeviceEntity>,
      discovering:
          discovering == freezed ? _value.discovering : discovering as bool,
    ));
  }
}

class _$DiscoveredBtDevicesStateLoaded
    implements DiscoveredBtDevicesStateLoaded {
  const _$DiscoveredBtDevicesStateLoaded(
      {@required this.discoveredBtDevices, @required this.discovering})
      : assert(discoveredBtDevices != null),
        assert(discovering != null);

  @override
  final Set<BtDeviceEntity> discoveredBtDevices;
  @override
  final bool discovering;

  @override
  String toString() {
    return 'DiscoveredBtDevicesState.loaded(discoveredBtDevices: $discoveredBtDevices, discovering: $discovering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiscoveredBtDevicesStateLoaded &&
            (identical(other.discoveredBtDevices, discoveredBtDevices) ||
                const DeepCollectionEquality()
                    .equals(other.discoveredBtDevices, discoveredBtDevices)) &&
            (identical(other.discovering, discovering) ||
                const DeepCollectionEquality()
                    .equals(other.discovering, discovering)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(discoveredBtDevices) ^
      const DeepCollectionEquality().hash(discovering);

  @override
  $DiscoveredBtDevicesStateLoadedCopyWith<DiscoveredBtDevicesStateLoaded>
      get copyWith => _$DiscoveredBtDevicesStateLoadedCopyWithImpl<
          DiscoveredBtDevicesStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result failure(String message),
    @required
        Result loaded(
            Set<BtDeviceEntity> discoveredBtDevices, bool discovering),
  }) {
    assert(failure != null);
    assert(loaded != null);
    return loaded(discoveredBtDevices, discovering);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result failure(String message),
    Result loaded(Set<BtDeviceEntity> discoveredBtDevices, bool discovering),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(discoveredBtDevices, discovering);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result failure(DiscoveredBtDevicesStateFailure value),
    @required Result loaded(DiscoveredBtDevicesStateLoaded value),
  }) {
    assert(failure != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result failure(DiscoveredBtDevicesStateFailure value),
    Result loaded(DiscoveredBtDevicesStateLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DiscoveredBtDevicesStateLoaded
    implements DiscoveredBtDevicesState {
  const factory DiscoveredBtDevicesStateLoaded(
      {@required Set<BtDeviceEntity> discoveredBtDevices,
      @required bool discovering}) = _$DiscoveredBtDevicesStateLoaded;

  Set<BtDeviceEntity> get discoveredBtDevices;
  bool get discovering;
  $DiscoveredBtDevicesStateLoadedCopyWith<DiscoveredBtDevicesStateLoaded>
      get copyWith;
}
