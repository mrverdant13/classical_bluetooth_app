import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

abstract class BluetoothHardwareDataSourceDec {
  const BluetoothHardwareDataSourceDec();

  Stream<BluetoothState> stateStream();
}

@LazySingleton(as: BluetoothHardwareDataSourceDec)
class BluetoothHardwareDataSourceImp extends BluetoothHardwareDataSourceDec {
  final FlutterBluetoothSerial bluetoothSerial;

  const BluetoothHardwareDataSourceImp({
    @required this.bluetoothSerial,
  });

  @override
  Stream<BluetoothState> stateStream() async* {
    yield await bluetoothSerial.state;
    yield* bluetoothSerial.onStateChanged();
  }
}
