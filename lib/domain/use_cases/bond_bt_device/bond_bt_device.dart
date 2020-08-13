import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/types/future_use_case.dart';
import '../../entities/bt_device/bt_device_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class BondBtDeviceUseCase
    extends FutureUseCase<BondBtDeviceFailure, void, BtDeviceEntity> {
  final BluetoothServiceDec bluetoothService;

  const BondBtDeviceUseCase({
    @required this.bluetoothService,
  });

  @override
  Future<Either<BondBtDeviceFailure, void>> call(
    BtDeviceEntity btDevice,
  ) =>
      bluetoothService.bondBtDevice(
        btDevice: btDevice,
      );
}
