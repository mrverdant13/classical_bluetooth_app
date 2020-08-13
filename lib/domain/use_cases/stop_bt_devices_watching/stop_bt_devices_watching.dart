import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/parameter_types/no_parameters.dart';
import '../../../core/use_cases/types/future_use_case.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

@LazySingleton()
class StopBtDevicesWatchingUseCase extends FutureUseCase<
    StopBtDevicesWatchingFailure, void, NoUseCaseParameters> {
  final BluetoothServiceDec bluetoothService;

  const StopBtDevicesWatchingUseCase({
    @required this.bluetoothService,
  });

  @override
  Future<Either<StopBtDevicesWatchingFailure, void>> call(
    NoUseCaseParameters parameters,
  ) =>
      bluetoothService.stopBtDevicesWatching();
}
