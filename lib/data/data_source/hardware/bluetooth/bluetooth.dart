import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/loggers/data/hardware_data_source.dart';
import '../../../../domain/entities/bluetooth_state/bluetooth_state_entity.dart';
import '../../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../models/bluetooth_state/bluetooth_state_model.dart';
import '../../../models/bt_device/bt_device_model.dart';

part 'bluetooth.freezed.dart';

@freezed
abstract class StateStreamException with _$StateStreamException {
  const factory StateStreamException.unexpected() =
      _StateStreamExceptionUnexpected;
}

@freezed
abstract class DiscoveredDeviceStreamException
    with _$DiscoveredDeviceStreamException {
  const factory DiscoveredDeviceStreamException.unexpected() =
      _DiscoveredDeviceStreamExceptionUnexpected;
}

abstract class BluetoothHardwareDataSourceDec {
  const BluetoothHardwareDataSourceDec();

  Stream<BluetoothStateEntity> stateStream();
  Stream<BtDeviceEntity> discoveredDeviceStream();
}

@LazySingleton(as: BluetoothHardwareDataSourceDec)
class BluetoothHardwareDataSourceImp extends BluetoothHardwareDataSourceDec {
  final FlutterBluetoothSerial bluetoothSerial;

  const BluetoothHardwareDataSourceImp({
    @required this.bluetoothSerial,
  });

  @override
  Stream<BluetoothStateEntity> stateStream() async* {
    try {
      yield BluetoothStateModel.fromBluetoothState(
        await bluetoothSerial.state,
      );
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const StateStreamException.unexpected();
    }

    yield* bluetoothSerial
        .onStateChanged()
        .map(
          (bluetoothState) => BluetoothStateModel.fromBluetoothState(
            bluetoothState,
          ),
        )
        .handleError(
      // HACK: Error mapping.
      (e) {
        kHardwareDataSourceLogger.e(e.runtimeType);
        throw const StateStreamException.unexpected();
      },
    );
  }

  @override
  Stream<BtDeviceEntity> discoveredDeviceStream() {
    return bluetoothSerial
        .startDiscovery()
        .map(
          // (bluetoothDiscoveryResult) => const BtDeviceEntity(
          //   macAddress: 'mac',
          //   name: 'name',
          // ),
          (bluetoothDiscoveryResult) => BtDeviceModel.fromBluetoothDevice(
            bluetoothDiscoveryResult.device,
          ),
        )
        .handleError(
      // HACK: Error mapping.
      (e) {
        kHardwareDataSourceLogger.e(e.runtimeType);
        throw const DiscoveredDeviceStreamException.unexpected();
      },
    );
  }
}
