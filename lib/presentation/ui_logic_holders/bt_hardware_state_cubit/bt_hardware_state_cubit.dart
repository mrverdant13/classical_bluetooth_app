import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/parameter_types/no_parameters.dart';
import '../../../domain/entities/bt_hardware_state/bt_hardware_state_entity.dart';
import '../../../domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import '../../../domain/use_cases/watch_bt_hardware_state/watch_bt_hardware_state.dart';

@Injectable()
class BtHardwareStateCubit extends Cubit<BtHardwareStateEntity> {
  final WatchBtHardwareStateUseCase watchBluetoothStateUseCase;

  StreamSubscription<Either<WatchBtHardwareStateFailure, BtHardwareStateEntity>>
      _failureOrBluetoothStateStreamSubscription;

  BtHardwareStateCubit({
    @required this.watchBluetoothStateUseCase,
  }) : super(
          const BtHardwareStateEntity.changing(),
        );

  Future<void> subscribeToBluetoothState() async {
    emit(
      const BtHardwareStateEntity.changing(),
    );
    await _failureOrBluetoothStateStreamSubscription?.cancel();

    _failureOrBluetoothStateStreamSubscription = watchBluetoothStateUseCase(
      const NoUseCaseParameters(),
    ).listen(
      (failureOrBluetoothState) => _updateObtainedBluetoothState(
        failureOrBluetoothState: failureOrBluetoothState,
      ),
    );
  }

  void _updateObtainedBluetoothState({
    @required
        Either<WatchBtHardwareStateFailure, BtHardwareStateEntity>
            failureOrBluetoothState,
  }) =>
      emit(
        failureOrBluetoothState.fold(
          (failure) => failure.when(
            unexpected: () => const BtHardwareStateEntity.failure(
              message: 'Hubo un problema inesperado',
            ),
          ),
          (bluetoothState) => bluetoothState,
        ),
      );

  @override
  Future<void> close() async {
    await _failureOrBluetoothStateStreamSubscription?.cancel();
    return super.close();
  }
}
