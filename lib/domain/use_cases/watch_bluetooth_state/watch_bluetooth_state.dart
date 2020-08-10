import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/parameter_types/no_parameters.dart';
import '../../../core/use_cases/types/stream_use_case.dart';
import '../../entities/bluetooth_state/bluetooth_state_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class WatchBluetoothStateUseCase extends StreamUseCase<WatchStatusFailure,
    BluetoothStateEntity, NoUseCaseParameters> {
  final BluetoothServiceDec bluetoothService;

  const WatchBluetoothStateUseCase({
    @required this.bluetoothService,
  });

  @override
  Stream<Either<WatchStatusFailure, BluetoothStateEntity>> call(
    NoUseCaseParameters parameters,
  ) =>
      bluetoothService.watchStatus();
}
