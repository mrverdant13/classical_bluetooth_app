import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/parameter_types/no_parameters.dart';
import '../../../core/use_cases/types/stream_use_case.dart';
import '../../entities/bt_device/bt_device_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class WatchAvailableBtDevicesUseCase extends StreamUseCase<
    WatchBtDevicesFailure, BtDeviceEntity, NoUseCaseParameters> {
  final BluetoothServiceDec bluetoothService;

  const WatchAvailableBtDevicesUseCase({
    @required this.bluetoothService,
  });

  @override
  Stream<Either<WatchBtDevicesFailure, BtDeviceEntity>> call(
    NoUseCaseParameters parameters,
  ) =>
      bluetoothService.watchBtDevices();
}
