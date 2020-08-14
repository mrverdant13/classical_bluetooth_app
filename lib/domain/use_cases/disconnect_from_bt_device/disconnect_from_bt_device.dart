import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/types/future_use_case.dart';
import '../../entities/bt_device/bt_device_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class DisconnectFromBtDeviceUseCase
    extends FutureUseCase<DisconnectFromBtDeviceFailure, void, BtDeviceEntity> {
  final BluetoothServiceDec bluetoothService;

  const DisconnectFromBtDeviceUseCase({
    @required this.bluetoothService,
  });

  @override
  Future<Either<DisconnectFromBtDeviceFailure, void>> call(
    BtDeviceEntity btDevice,
  ) =>
      bluetoothService.disconnectFromBtDevice(
        btDevice: btDevice,
      );
}
