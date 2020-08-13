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

@freezed
abstract class StopDiscoveryException with _$StopDiscoveryException {
  const factory StopDiscoveryException.unexpected() =
      _StopDiscoveryExceptionUnexpected;
}

@freezed
abstract class BondBtDeviceException with _$BondBtDeviceException {
  const factory BondBtDeviceException.unexpected() =
      _BondBtDeviceExceptionUnexpected;
}

@freezed
abstract class ConnectToBtDeviceException with _$ConnectToBtDeviceException {
  const factory ConnectToBtDeviceException.notPaired() =
      _ConnectToBtDeviceExceptionNotPaired;
  const factory ConnectToBtDeviceException.unexpected() =
      _ConnectToBtDeviceExceptionUnexpected;
}

abstract class BluetoothHardwareDataSourceDec {
  const BluetoothHardwareDataSourceDec();

  Future<void> bondBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Future<void> connectToBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Stream<BluetoothStateEntity> stateStream();
  Stream<BtDeviceEntity> discoveredDeviceStream();
  Future<void> stopDiscovery();
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
    return bluetoothSerial.startDiscovery().map(
      (bluetoothDiscoveryResult) {
        return BtDeviceModel.fromBluetoothDevice(
          bluetoothDiscoveryResult.device,
        );
      },
    ).handleError(
      // HACK: Error mapping.
      (e) {
        kHardwareDataSourceLogger.e(e.runtimeType);
        throw const DiscoveredDeviceStreamException.unexpected();
      },
    );
  }

  @override
  Future<void> stopDiscovery() async {
    try {
      await bluetoothSerial.cancelDiscovery();
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const StopDiscoveryException.unexpected();
    }
  }

  @override
  Future<void> bondBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    try {
      if ((await bluetoothSerial.getBondStateForAddress(
            btDevice.macAddress,
          )) !=
          BluetoothBondState.bonded) {
        await bluetoothSerial.bondDeviceAtAddress(
          btDevice.macAddress,
        );
      }
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const BondBtDeviceException.unexpected();
    }
  }

  @override
  Future<void> connectToBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    BluetoothDevice _bluetoothDevice;
    try {
      final bondedDevices = await bluetoothSerial.getBondedDevices();
      _bluetoothDevice = bondedDevices.firstWhere(
        (bondedDevice) => bondedDevice.address == btDevice.macAddress,
      );
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const ConnectToBtDeviceException.notPaired();
    }
    try {
      if (!_bluetoothDevice.isConnected) {
        await BluetoothConnection.toAddress(
          btDevice.macAddress,
        );
      }
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const ConnectToBtDeviceException.unexpected();
    }
  }
}
