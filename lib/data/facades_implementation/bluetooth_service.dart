import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/bluetooth_state/bluetooth_state_entity.dart';
import '../../domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import '../data_source/hardware/bluetooth/bluetooth.dart';
import '../models/bluetooth_state/bluetooth_state_model.dart';

@LazySingleton(as: BluetoothServiceDec)
class BluetoothServiceImp extends BluetoothServiceDec {
  final BluetoothHardwareDataSourceDec bluetoothHardwareDataSource;

  const BluetoothServiceImp({
    @required this.bluetoothHardwareDataSource,
  });

  @override
  Stream<Either<WatchStatusFailure, BluetoothStateEntity>> watchStatus() =>
      bluetoothHardwareDataSource
          .stateStream()
          .map<Either<WatchStatusFailure, BluetoothStateEntity>>(
            (bluetoothState) => Right(
              BluetoothStateModel.fromBluetoothState(
                bluetoothState,
              ),
            ),
          );
}
