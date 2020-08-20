import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_hardware_state/bt_hardware_state_entity.dart';

extension BtHardwareStateModel on BtHardwareStateEntity {
  static BtHardwareStateEntity fromBluetoothState({
    @required BluetoothState bluetoothState,
    @required bool throwExceptionOnError,
  }) {
    if (bluetoothState == BluetoothState.STATE_BLE_ON ||
        bluetoothState == BluetoothState.STATE_ON) {
      return const BtHardwareStateEntity.on();
    } else if (bluetoothState == BluetoothState.STATE_BLE_TURNING_OFF ||
        bluetoothState == BluetoothState.STATE_BLE_TURNING_ON ||
        bluetoothState == BluetoothState.STATE_TURNING_OFF ||
        bluetoothState == BluetoothState.STATE_TURNING_ON) {
      return const BtHardwareStateEntity.changing();
    } else if (bluetoothState == BluetoothState.STATE_OFF) {
      return const BtHardwareStateEntity.off();
    }
    if (throwExceptionOnError) {
      throw Exception('Unexpected BtHardwareStateEntity value');
    } else {
      return const BtHardwareStateEntity.off();
    }
  }
}
