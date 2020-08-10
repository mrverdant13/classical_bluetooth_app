import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BluetoothSerialModule {
  const BluetoothSerialModule();

  @LazySingleton()
  FlutterBluetoothSerial get bluetoothSerial => FlutterBluetoothSerial.instance;
}
