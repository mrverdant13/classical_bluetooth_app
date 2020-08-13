import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/loggers/data/facade.dart';
import '../../domain/entities/bluetooth_state/bluetooth_state_entity.dart';
import '../../domain/entities/bt_device/bt_device_entity.dart';
import '../../domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import '../data_source/hardware/bluetooth/bluetooth.dart';

@LazySingleton(as: BluetoothServiceDec)
class BluetoothServiceImp extends BluetoothServiceDec {
  final BluetoothHardwareDataSourceDec bluetoothHardwareDataSource;

  const BluetoothServiceImp({
    @required this.bluetoothHardwareDataSource,
  });

  @override
  Stream<Either<WatchStatusFailure, BluetoothStateEntity>> watchStatus() =>
      bluetoothHardwareDataSource
          .stateStream()
          .map<Either<WatchStatusFailure, BluetoothStateEntity>>(
            (bluetoothState) => Right(
              bluetoothState,
            ),
          )
          .onErrorReturnWith(
        (e) {
          kFacadeLogger.e(e.runtimeType);
          return (e is StateStreamException)
              ? e.when(
                  unexpected: () => const Left(
                    WatchStatusFailure.unexpected(),
                  ),
                )
              : const Left(
                  WatchStatusFailure.unexpected(),
                );
        },
      );

  @override
  Stream<Either<WatchBtDevicesFailure, BtDeviceEntity>> watchBtDevices() =>
      bluetoothHardwareDataSource
          .discoveredDeviceStream()
          .map<Either<WatchBtDevicesFailure, BtDeviceEntity>>(
            (bluetoothDevice) => Right(
              bluetoothDevice,
            ),
          )
          .onErrorReturnWith(
        (e) {
          kFacadeLogger.e(e.runtimeType);
          return (e is DiscoveredDeviceStreamException)
              ? e.when(
                  unexpected: () => const Left(
                    WatchBtDevicesFailure.unexpected(),
                  ),
                )
              : const Left(
                  WatchBtDevicesFailure.unexpected(),
                );
        },
      );

  @override
  Future<Either<StopBtDevicesWatchingFailure, void>>
      stopBtDevicesWatching() async {
    try {
      await bluetoothHardwareDataSource.stopDiscovery();
      return const Right(null);
    } catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return const Left(
        StopBtDevicesWatchingFailure.unexpected(),
      );
    }
  }
}
