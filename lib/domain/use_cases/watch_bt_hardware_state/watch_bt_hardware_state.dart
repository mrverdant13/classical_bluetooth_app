import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/parameter_types/no_parameters.dart';
import '../../../core/use_cases/types/stream_use_case.dart';
import '../../entities/bt_hardware_state/bt_hardware_state_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class WatchBtHardwareStateUseCase extends StreamUseCase<WatchBtHardwareStateFailure,
    BtHardwareStateEntity, NoUseCaseParameters> {
  final BluetoothServiceDec bluetoothService;

  const WatchBtHardwareStateUseCase({
    @required this.bluetoothService,
  });

  @override
  Stream<Either<WatchBtHardwareStateFailure, BtHardwareStateEntity>> call(
    NoUseCaseParameters parameters,
  ) =>
      bluetoothService.watchBtHardwareState();
}
