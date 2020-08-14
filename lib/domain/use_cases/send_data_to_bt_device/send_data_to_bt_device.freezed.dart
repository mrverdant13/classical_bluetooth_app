// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'send_data_to_bt_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SendDataToBtDeviceUseCaseParametersTearOff {
  const _$SendDataToBtDeviceUseCaseParametersTearOff();

// ignore: unused_element
  _SendDataToBtDeviceUseCaseParameters call(
      {@required BtDeviceEntity btDevice, @required String dataString}) {
    return _SendDataToBtDeviceUseCaseParameters(
      btDevice: btDevice,
      dataString: dataString,
    );
  }
}

// ignore: unused_element
const $SendDataToBtDeviceUseCaseParameters =
    _$SendDataToBtDeviceUseCaseParametersTearOff();

mixin _$SendDataToBtDeviceUseCaseParameters {
  BtDeviceEntity get btDevice;
  String get dataString;

  $SendDataToBtDeviceUseCaseParametersCopyWith<
      SendDataToBtDeviceUseCaseParameters> get copyWith;
}

abstract class $SendDataToBtDeviceUseCaseParametersCopyWith<$Res> {
  factory $SendDataToBtDeviceUseCaseParametersCopyWith(
          SendDataToBtDeviceUseCaseParameters value,
          $Res Function(SendDataToBtDeviceUseCaseParameters) then) =
      _$SendDataToBtDeviceUseCaseParametersCopyWithImpl<$Res>;
  $Res call({BtDeviceEntity btDevice, String dataString});

  $BtDeviceEntityCopyWith<$Res> get btDevice;
}

class _$SendDataToBtDeviceUseCaseParametersCopyWithImpl<$Res>
    implements $SendDataToBtDeviceUseCaseParametersCopyWith<$Res> {
  _$SendDataToBtDeviceUseCaseParametersCopyWithImpl(this._value, this._then);

  final SendDataToBtDeviceUseCaseParameters _value;
  // ignore: unused_field
  final $Res Function(SendDataToBtDeviceUseCaseParameters) _then;

  @override
  $Res call({
    Object btDevice = freezed,
    Object dataString = freezed,
  }) {
    return _then(_value.copyWith(
      btDevice:
          btDevice == freezed ? _value.btDevice : btDevice as BtDeviceEntity,
      dataString:
          dataString == freezed ? _value.dataString : dataString as String,
    ));
  }

  @override
  $BtDeviceEntityCopyWith<$Res> get btDevice {
    if (_value.btDevice == null) {
      return null;
    }
    return $BtDeviceEntityCopyWith<$Res>(_value.btDevice, (value) {
      return _then(_value.copyWith(btDevice: value));
    });
  }
}

abstract class _$SendDataToBtDeviceUseCaseParametersCopyWith<$Res>
    implements $SendDataToBtDeviceUseCaseParametersCopyWith<$Res> {
  factory _$SendDataToBtDeviceUseCaseParametersCopyWith(
          _SendDataToBtDeviceUseCaseParameters value,
          $Res Function(_SendDataToBtDeviceUseCaseParameters) then) =
      __$SendDataToBtDeviceUseCaseParametersCopyWithImpl<$Res>;
  @override
  $Res call({BtDeviceEntity btDevice, String dataString});

  @override
  $BtDeviceEntityCopyWith<$Res> get btDevice;
}

class __$SendDataToBtDeviceUseCaseParametersCopyWithImpl<$Res>
    extends _$SendDataToBtDeviceUseCaseParametersCopyWithImpl<$Res>
    implements _$SendDataToBtDeviceUseCaseParametersCopyWith<$Res> {
  __$SendDataToBtDeviceUseCaseParametersCopyWithImpl(
      _SendDataToBtDeviceUseCaseParameters _value,
      $Res Function(_SendDataToBtDeviceUseCaseParameters) _then)
      : super(_value, (v) => _then(v as _SendDataToBtDeviceUseCaseParameters));

  @override
  _SendDataToBtDeviceUseCaseParameters get _value =>
      super._value as _SendDataToBtDeviceUseCaseParameters;

  @override
  $Res call({
    Object btDevice = freezed,
    Object dataString = freezed,
  }) {
    return _then(_SendDataToBtDeviceUseCaseParameters(
      btDevice:
          btDevice == freezed ? _value.btDevice : btDevice as BtDeviceEntity,
      dataString:
          dataString == freezed ? _value.dataString : dataString as String,
    ));
  }
}

class _$_SendDataToBtDeviceUseCaseParameters
    implements _SendDataToBtDeviceUseCaseParameters {
  const _$_SendDataToBtDeviceUseCaseParameters(
      {@required this.btDevice, @required this.dataString})
      : assert(btDevice != null),
        assert(dataString != null);

  @override
  final BtDeviceEntity btDevice;
  @override
  final String dataString;

  @override
  String toString() {
    return 'SendDataToBtDeviceUseCaseParameters(btDevice: $btDevice, dataString: $dataString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendDataToBtDeviceUseCaseParameters &&
            (identical(other.btDevice, btDevice) ||
                const DeepCollectionEquality()
                    .equals(other.btDevice, btDevice)) &&
            (identical(other.dataString, dataString) ||
                const DeepCollectionEquality()
                    .equals(other.dataString, dataString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(btDevice) ^
      const DeepCollectionEquality().hash(dataString);

  @override
  _$SendDataToBtDeviceUseCaseParametersCopyWith<
          _SendDataToBtDeviceUseCaseParameters>
      get copyWith => __$SendDataToBtDeviceUseCaseParametersCopyWithImpl<
          _SendDataToBtDeviceUseCaseParameters>(this, _$identity);
}

abstract class _SendDataToBtDeviceUseCaseParameters
    implements SendDataToBtDeviceUseCaseParameters {
  const factory _SendDataToBtDeviceUseCaseParameters(
      {@required BtDeviceEntity btDevice,
      @required String dataString}) = _$_SendDataToBtDeviceUseCaseParameters;

  @override
  BtDeviceEntity get btDevice;
  @override
  String get dataString;
  @override
  _$SendDataToBtDeviceUseCaseParametersCopyWith<
      _SendDataToBtDeviceUseCaseParameters> get copyWith;
}
