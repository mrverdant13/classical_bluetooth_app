import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/bluetooth_state/bluetooth_state_entity.dart';
import '../../entities/bt_device/bt_device_entity.dart';

part 'bluetooth_service.freezed.dart';

@freezed
abstract class WatchStatusFailure with _$WatchStatusFailure {
  const factory WatchStatusFailure.unexpected() = _WatchStatusFailureUnexpected;
}

@freezed
abstract class WatchBtDevicesFailure with _$WatchBtDevicesFailure {
  const factory WatchBtDevicesFailure.unexpected() =
      _WatchBtDevicesFailureUnexpected;
}

@freezed
abstract class StopBtDevicesWatchingFailure
    with _$StopBtDevicesWatchingFailure {
  const factory StopBtDevicesWatchingFailure.unexpected() =
      _StopBtDevicesWatchingFailureUnexpected;
}

abstract class BluetoothServiceDec {
  const BluetoothServiceDec();

  Stream<Either<WatchStatusFailure, BluetoothStateEntity>> watchStatus();
  Stream<Either<WatchBtDevicesFailure, BtDeviceEntity>> watchBtDevices();
  Future<Either<StopBtDevicesWatchingFailure, void>> stopBtDevicesWatching();
}
