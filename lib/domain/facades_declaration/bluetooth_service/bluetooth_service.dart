import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../entities/bluetooth_state/bluetooth_state_entity.dart';
import '../../entities/bt_device/bt_device_entity.dart';

part 'bluetooth_service.freezed.dart';

@freezed
abstract class BondBtDeviceFailure with _$BondBtDeviceFailure {
  const factory BondBtDeviceFailure.notFound() = _BondBtDeviceFailureNotFound;
  const factory BondBtDeviceFailure.unexpected() =
      _BondBtDeviceFailureUnexpected;
}

@freezed
abstract class ConnectToBtDeviceFailure with _$ConnectToBtDeviceFailure {
  const factory ConnectToBtDeviceFailure.notPaired() =
      _ConnectToBtDeviceFailureNotPaired;
  const factory ConnectToBtDeviceFailure.unexpected() =
      _ConnectToBtDeviceFailureUnexpected;
}

@freezed
abstract class StopBtDevicesWatchingFailure
    with _$StopBtDevicesWatchingFailure {
  const factory StopBtDevicesWatchingFailure.unexpected() =
      _StopBtDevicesWatchingFailureUnexpected;
}

@freezed
abstract class SendDataToBtDeviceFailure with _$SendDataToBtDeviceFailure {
  const factory SendDataToBtDeviceFailure.notConnected() =
      _SendDataToBtDeviceFailureNotConnected;
  const factory SendDataToBtDeviceFailure.unexpected() =
      _SendDataToBtDeviceFailureUnexpected;
}

@freezed
abstract class WatchBtDevicesFailure with _$WatchBtDevicesFailure {
  const factory WatchBtDevicesFailure.unexpected() =
      _WatchBtDevicesFailureUnexpected;
}

@freezed
abstract class WatchStatusFailure with _$WatchStatusFailure {
  const factory WatchStatusFailure.unexpected() = _WatchStatusFailureUnexpected;
}

abstract class BluetoothServiceDec {
  const BluetoothServiceDec();

  Future<Either<BondBtDeviceFailure, void>> bondBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Future<Either<ConnectToBtDeviceFailure, void>> connectToBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Future<Either<SendDataToBtDeviceFailure, void>> sendDataToBtDevice({
    @required BtDeviceEntity btDevice,
    @required String dataString,
  });
  Future<Either<StopBtDevicesWatchingFailure, void>> stopBtDevicesWatching();
  Stream<Either<WatchStatusFailure, BluetoothStateEntity>> watchBtStatus();
  Stream<Either<WatchBtDevicesFailure, BtDeviceEntity>> watchBtDevices();
}
