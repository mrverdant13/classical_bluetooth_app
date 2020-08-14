import 'dart:convert';

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
  Future<Either<BondBtDeviceFailure, void>> bondBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    try {
      await bluetoothHardwareDataSource.bondBtDevice(
        btDevice: btDevice,
      );
      return const Right(null);
    } on BondBtDeviceException catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return e.when(
        unexpected: () => const Left(
          BondBtDeviceFailure.unexpected(),
        ),
      );
    } catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return const Left(
        BondBtDeviceFailure.unexpected(),
      );
    }
  }

  @override
  Future<Either<ConnectToBtDeviceFailure, void>> connectToBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    try {
      await bluetoothHardwareDataSource.connectToBtDevice(
        btDevice: btDevice,
      );
      return const Right(null);
    } on ConnectToBtDeviceException catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return e.when(
        notPaired: () => const Left(
          ConnectToBtDeviceFailure.notPaired(),
        ),
        unexpected: () => const Left(
          ConnectToBtDeviceFailure.unexpected(),
        ),
      );
    } catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return const Left(
        ConnectToBtDeviceFailure.unexpected(),
      );
    }
  }

  @override
  Future<Either<DisconnectFromBtDeviceFailure, void>> disconnectFromBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    try {
      await bluetoothHardwareDataSource.disconnectFromBtDevice(
        btDevice: btDevice,
      );
      return const Right(null);
    } on DisconnectFromBtDeviceException catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return e.when(
        unexpected: () => const Left(
          DisconnectFromBtDeviceFailure.unexpected(),
        ),
      );
    } catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return const Left(
        DisconnectFromBtDeviceFailure.unexpected(),
      );
    }
  }

  @override
  Future<Either<SendDataToBtDeviceFailure, void>> sendDataToBtDevice({
    @required BtDeviceEntity btDevice,
    @required String dataString,
  }) async {
    try {
      await bluetoothHardwareDataSource.sendDataToBtDevice(
        btDevice: btDevice,
        data: ascii.encode(dataString),
      );
      return const Right(null);
    } on SendDataToBtDeviceException catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return e.when(
        notConnected: () => const Left(
          SendDataToBtDeviceFailure.notConnected(),
        ),
        unexpected: () => const Left(
          SendDataToBtDeviceFailure.unexpected(),
        ),
      );
    } catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return const Left(
        SendDataToBtDeviceFailure.unexpected(),
      );
    }
  }

  @override
  Future<Either<StopBtDevicesWatchingFailure, void>>
      stopBtDevicesWatching() async {
    try {
      await bluetoothHardwareDataSource.stopDiscovery();
      return const Right(null);
    } on StopDiscoveryException catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return e.when(
        unexpected: () => const Left(
          StopBtDevicesWatchingFailure.unexpected(),
        ),
      );
    } catch (e) {
      kFacadeLogger.e(e.runtimeType);
      return const Left(
        StopBtDevicesWatchingFailure.unexpected(),
      );
    }
  }

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
  Stream<Either<WatchStatusFailure, BluetoothStateEntity>> watchBtStatus() =>
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
}
