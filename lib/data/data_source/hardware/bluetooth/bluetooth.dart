import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/loggers/data/hardware_data_source.dart';
import '../../../../domain/entities/bt_connection_state/bt_connection_state_entity.dart';
import '../../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../../domain/entities/bt_hardware_state/bt_hardware_state_entity.dart';
import '../../../models/bluetooth_state/bluetooth_state_model.dart';
import '../../../models/bt_device/bt_device_model.dart';

part 'bluetooth.freezed.dart';

abstract class BluetoothHardwareDataSourceDec {
  const BluetoothHardwareDataSourceDec();

  Future<void> bondBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Stream<BtConnectionStateEntity> connectionStream({
    @required BtDeviceEntity btDevice,
  });
  Future<void> connectToBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Future<void> disconnectFromBtDevice({
    @required BtDeviceEntity btDevice,
  });
  Stream<BtDeviceEntity> discoveredDeviceStream();
  Future<void> sendDataToBtDevice({
    @required BtDeviceEntity btDevice,
    @required Uint8List data,
  });
  Stream<BtHardwareStateEntity> stateStream();
  Future<void> stopDiscovery();
  Stream<Uint8List> watchReceivedDataFromBtDevice({
    @required BtDeviceEntity btDevice,
  });
}

@LazySingleton(as: BluetoothHardwareDataSourceDec)
class BluetoothHardwareDataSourceImp extends BluetoothHardwareDataSourceDec {
  static final Map<String, BluetoothConnection> _bluetoothConnections = {};
  final FlutterBluetoothSerial bluetoothSerial;

  const BluetoothHardwareDataSourceImp({
    @required this.bluetoothSerial,
  });

  @override
  Future<void> bondBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    try {
      if ((await bluetoothSerial.getBondStateForAddress(
            btDevice.macAddress,
          )) !=
          BluetoothBondState.bonded) {
        if (!await bluetoothSerial.bondDeviceAtAddress(
          btDevice.macAddress,
        )) {
          throw const BondBtDeviceException.couldNotBond();
        }
      }
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const BondBtDeviceException.unexpected();
    }
  }

  @override
  Stream<BtConnectionStateEntity> connectionStream({
    @required BtDeviceEntity btDevice,
  }) async* {
    bool _lastIsConnected;
    bool _currentIsConnected;
    while (true) {
      try {
        _currentIsConnected = _isConnected(
          btDevice: btDevice,
        );
        // Emulates `distinct` method.
        if (_lastIsConnected != _currentIsConnected) {
          _lastIsConnected = _currentIsConnected;
          yield _currentIsConnected
              ? const BtConnectionStateEntity.connected()
              : const BtConnectionStateEntity.disconnected();
        }
        await Future.delayed(const Duration(milliseconds: 250));
      } catch (e) {
        kHardwareDataSourceLogger.e(e.runtimeType);
        yield const BtConnectionStateEntity.failure(
          message: 'Hubo un problema inesperado',
        );
      }
    }
  }

  @override
  Future<void> connectToBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    try {
      if (!await _isPaired(macAddress: btDevice.macAddress)) {
        throw const ConnectToBtDeviceException.notPaired();
      }
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const ConnectToBtDeviceException.notPaired();
    }

    try {
      if (!_isConnected(
        btDevice: btDevice,
      )) {
        _bluetoothConnections[btDevice.macAddress] =
            await BluetoothConnection.toAddress(
          btDevice.macAddress,
        );
      }
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const ConnectToBtDeviceException.unexpected();
    }
  }

  @override
  Future<void> disconnectFromBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    try {
      await _bluetoothConnections.remove(btDevice.macAddress)?.finish();
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const DisconnectFromBtDeviceException.unexpected();
    }
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
  Future<void> sendDataToBtDevice({
    @required BtDeviceEntity btDevice,
    @required Uint8List data,
  }) async {
    try {
      _bluetoothConnections[btDevice.macAddress].output.add(
            data,
          );
    }
    // HACK: `bluetoothConnection.output.add` throws StateError("Not connected!") if there is no available connection
    // ignore: avoid_catching_errors
    on StateError catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const SendDataToBtDeviceException.notConnected();
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const SendDataToBtDeviceException.unexpected();
    }
  }

  @override
  Stream<BtHardwareStateEntity> stateStream() async* {
    try {
      yield BtHardwareStateModel.fromBluetoothState(
        bluetoothState: await bluetoothSerial.state,
        throwExceptionOnError: true,
      );
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const StateStreamException.unexpected();
    }

    yield* bluetoothSerial
        .onStateChanged()
        .map(
          (bluetoothState) => BtHardwareStateModel.fromBluetoothState(
            bluetoothState: bluetoothState,
            throwExceptionOnError: true,
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
  Future<void> stopDiscovery() async {
    try {
      await bluetoothSerial.cancelDiscovery();
    } catch (e) {
      kHardwareDataSourceLogger.e(e.runtimeType);
      throw const StopDiscoveryException.unexpected();
    }
  }

  @override
  Stream<Uint8List> watchReceivedDataFromBtDevice({
    @required BtDeviceEntity btDevice,
  }) {
    return _bluetoothConnections[btDevice.macAddress].input.handleError(
      // HACK: Error mmapping.
      (e) {
        kHardwareDataSourceLogger.e(e.runtimeType);
        throw const WatchReceivedDataFromBtDeviceException.unexpected();
      },
    );
  }

  bool _isConnected({
    @required BtDeviceEntity btDevice,
  }) =>
      _bluetoothConnections.containsKey(btDevice.macAddress) &&
      _bluetoothConnections[btDevice.macAddress].isConnected;

  Future<bool> _isPaired({
    @required String macAddress,
  }) async {
    return (await bluetoothSerial.getBondStateForAddress(
          macAddress,
        )) ==
        BluetoothBondState.bonded;
  }
}

@freezed
abstract class BondBtDeviceException with _$BondBtDeviceException {
  const factory BondBtDeviceException.couldNotBond() =
      _BondBtDeviceExceptionCouldNotBond;
  const factory BondBtDeviceException.unexpected() =
      _BondBtDeviceExceptionUnexpected;
}

@freezed
abstract class ConnectionStreamException with _$ConnectionStreamException {
  const factory ConnectionStreamException.unexpected() =
      _ConnectionStreamExceptionUnexpected;
}

@freezed
abstract class ConnectToBtDeviceException with _$ConnectToBtDeviceException {
  const factory ConnectToBtDeviceException.notPaired() =
      _ConnectToBtDeviceExceptionNotPaired;
  const factory ConnectToBtDeviceException.unexpected() =
      _ConnectToBtDeviceExceptionUnexpected;
}

@freezed
abstract class DisconnectFromBtDeviceException
    with _$DisconnectFromBtDeviceException {
  const factory DisconnectFromBtDeviceException.unexpected() =
      _DisconnectFromBtDeviceExceptionUnexpected;
}

@freezed
abstract class DiscoveredDeviceStreamException
    with _$DiscoveredDeviceStreamException {
  const factory DiscoveredDeviceStreamException.unexpected() =
      _DiscoveredDeviceStreamExceptionUnexpected;
}

@freezed
abstract class SendDataToBtDeviceException with _$SendDataToBtDeviceException {
  const factory SendDataToBtDeviceException.notConnected() =
      _SendDataToBtDeviceExceptionNotConnected;
  const factory SendDataToBtDeviceException.unexpected() =
      _SendDataToBtDeviceExceptionUnexpected;
}

@freezed
abstract class StateStreamException with _$StateStreamException {
  const factory StateStreamException.unexpected() =
      _StateStreamExceptionUnexpected;
}

@freezed
abstract class StopDiscoveryException with _$StopDiscoveryException {
  const factory StopDiscoveryException.unexpected() =
      _StopDiscoveryExceptionUnexpected;
}

@freezed
abstract class WatchReceivedDataFromBtDeviceException
    with _$WatchReceivedDataFromBtDeviceException {
  const factory WatchReceivedDataFromBtDeviceException.unexpected() =
      _WatchReceivedDataFromBtDeviceExceptionUnexpected;
}
