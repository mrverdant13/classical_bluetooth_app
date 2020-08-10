import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../domain/entities/bluetooth_state/bluetooth_state_entity.dart';

extension BluetoothStateModel on BluetoothStateEntity {
  static BluetoothStateEntity fromBluetoothState(
      BluetoothState bluetoothState) {
    if (bluetoothState == BluetoothState.ERROR) {
      return const BluetoothStateEntity.error();
    } else if (bluetoothState == BluetoothState.STATE_BLE_ON ||
        bluetoothState == BluetoothState.STATE_ON) {
      return const BluetoothStateEntity.on();
    } else if (bluetoothState == BluetoothState.STATE_BLE_TURNING_OFF ||
        bluetoothState == BluetoothState.STATE_BLE_TURNING_ON ||
        bluetoothState == BluetoothState.STATE_TURNING_OFF ||
        bluetoothState == BluetoothState.STATE_TURNING_ON) {
      return const BluetoothStateEntity.changing();
    } else if (bluetoothState == BluetoothState.STATE_OFF) {
      return const BluetoothStateEntity.off();
    }
    return const BluetoothStateEntity.unknown();
  }
}
