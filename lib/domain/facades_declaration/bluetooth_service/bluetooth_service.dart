import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../entities/bt_connection_state/bt_connection_state_entity.dart';
import '../../entities/bt_device/bt_device_entity.dart';
import '../../entities/bt_hardware_state/bt_hardware_state_entity.dart';

part 'bluetooth_service.freezed.dart';

abstract class BluetoothServiceDec {
  const BluetoothServiceDec();

  Future<Either<BondBtDeviceFailure, void>> bondBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Future<Either<ConnectToBtDeviceFailure, void>> connectToBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Future<Either<DisconnectFromBtDeviceFailure, void>> disconnectFromBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Future<Either<SendDataToBtDeviceFailure, void>> sendDataToBtDevice({
    @required BtDeviceEntity btDevice,
    @required String dataString,
  });
  Future<Either<StopBtDevicesWatchingFailure, void>> stopBtDevicesWatching();
  Stream<Either<WatchBtConnectionFailure, BtConnectionStateEntity>>
      watchBtConnectionState({
    @required BtDeviceEntity btDevice,
  });
  Stream<Either<WatchBtDevicesFailure, BtDeviceEntity>> watchBtDevices();
  Stream<Either<WatchBtHardwareStateFailure, BtHardwareStateEntity>>
      watchBtHardwareState();
  Stream<Either<WatchReceivedDataFromBtDeviceFailure, Uint8List>>
      watchReceivedDataFromBtDevice({
    @required BtDeviceEntity btDevice,
  });
}

@freezed
abstract class BondBtDeviceFailure with _$BondBtDeviceFailure {
  const factory BondBtDeviceFailure.couldNotBond() =
      _BondBtDeviceFailureCouldNotBond;
  const factory BondBtDeviceFailure.unexpected() =
      _BondBtDeviceFailureUnexpected;
}

@freezed
abstract class ConnectToBtDeviceFailure with _$ConnectToBtDeviceFailure {
  const factory ConnectToBtDeviceFailure.notBonded() =
      _ConnectToBtDeviceFailureNotBonded;
  const factory ConnectToBtDeviceFailure.unexpected() =
      _ConnectToBtDeviceFailureUnexpected;
}

@freezed
abstract class DisconnectFromBtDeviceFailure
    with _$DisconnectFromBtDeviceFailure {
  const factory DisconnectFromBtDeviceFailure.unexpected() =
      _DisconnectFromBtDeviceFailureUnexpected;
}

@freezed
abstract class SendDataToBtDeviceFailure with _$SendDataToBtDeviceFailure {
  const factory SendDataToBtDeviceFailure.notConnected() =
      _SendDataToBtDeviceFailureNotConnected;
  const factory SendDataToBtDeviceFailure.unexpected() =
      _SendDataToBtDeviceFailureUnexpected;
}

@freezed
abstract class StopBtDevicesWatchingFailure
    with _$StopBtDevicesWatchingFailure {
  const factory StopBtDevicesWatchingFailure.unexpected() =
      _StopBtDevicesWatchingFailureUnexpected;
}

@freezed
abstract class WatchBtConnectionFailure with _$WatchBtConnectionFailure {
  const factory WatchBtConnectionFailure.unexpected() =
      _WatchBtDeviceConnectionFailureUnexpected;
}

@freezed
abstract class WatchBtDevicesFailure with _$WatchBtDevicesFailure {
  const factory WatchBtDevicesFailure.unexpected() =
      _WatchBtDevicesFailureUnexpected;
}

@freezed
abstract class WatchBtHardwareStateFailure with _$WatchBtHardwareStateFailure {
  const factory WatchBtHardwareStateFailure.unexpected() =
      _WatchStatusFailureUnexpected;
}

@freezed
abstract class WatchReceivedDataFromBtDeviceFailure
    with _$WatchReceivedDataFromBtDeviceFailure {
  const factory WatchReceivedDataFromBtDeviceFailure.unexpected() =
      _WatchReceivedDataFromBtDeviceFailureUnexpected;
}
