import 'package:classical_bluetooth_app/domain/entities/bt_device/bt_device_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class JayCounterCurrentSetupChangeNotifier extends ChangeNotifier {
  BtDeviceEntity _btDevice;
  BtDeviceEntity get btDevice => _btDevice;
  set btDevice(BtDeviceEntity btDevice) {
    _btDevice = btDevice;
    notifyListeners();
  }

  int _maxCapacity;
  int get maxCapacity => _maxCapacity;
  set maxCapacity(int maxCapacity) {
    _maxCapacity = maxCapacity;
    notifyListeners();
  }
}
