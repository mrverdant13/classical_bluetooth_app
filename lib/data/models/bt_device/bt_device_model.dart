import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';

extension BtDeviceModel on BtDeviceEntity {
  static BtDeviceEntity fromBluetoothDevice(BluetoothDevice bluetoothDevice) =>
      BtDeviceEntity(
        name: bluetoothDevice.name ?? 'No name',
        macAddress: bluetoothDevice.address,
      );
}
