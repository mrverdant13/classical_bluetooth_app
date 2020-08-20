import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/types/stream_use_case.dart';
import '../../entities/bt_connection_state/bt_connection_state_entity.dart';
import '../../entities/bt_device/bt_device_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class WatchBtDeviceConnectionUseCase extends StreamUseCase<
    WatchBtConnectionFailure, BtConnectionStateEntity, BtDeviceEntity> {
  final BluetoothServiceDec bluetoothService;

  const WatchBtDeviceConnectionUseCase({
    @required this.bluetoothService,
  });

  @override
  Stream<Either<WatchBtConnectionFailure, BtConnectionStateEntity>> call(
    BtDeviceEntity btDevice,
  ) =>
      bluetoothService.watchBtConnectionState(
        btDevice: btDevice,
      );
}
