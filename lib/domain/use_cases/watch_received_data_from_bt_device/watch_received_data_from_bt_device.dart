import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:classical_bluetooth_app/core/use_cases/types/stream_use_case.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_device/bt_device_entity.dart';
import 'package:classical_bluetooth_app/domain/facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class WatchReceivedDataFromBtDeviceUseCase extends StreamUseCase<
    WatchReceivedDataFromBtDeviceFailure, Uint8List, BtDeviceEntity> {
  final BluetoothServiceDec bluetoothService;

  const WatchReceivedDataFromBtDeviceUseCase({
    @required this.bluetoothService,
  });

  @override
  Stream<Either<WatchReceivedDataFromBtDeviceFailure, Uint8List>> call(
    BtDeviceEntity btDevice,
  ) =>
      bluetoothService.watchReceivedDataFromBtDevice(
        btDevice: btDevice,
      );
}
