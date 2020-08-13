import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/types/future_use_case.dart';
import '../../entities/bt_device/bt_device_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class ConnectToBtDeviceUseCase
    extends FutureUseCase<ConnectToBtDeviceFailure, void, BtDeviceEntity> {
  final BluetoothServiceDec bluetoothService;

  const ConnectToBtDeviceUseCase({
    @required this.bluetoothService,
  });

  @override
  Future<Either<ConnectToBtDeviceFailure, void>> call(
    BtDeviceEntity btDevice,
  ) =>
      bluetoothService.connectToBtDevice(
        btDevice: btDevice,
      );
}
