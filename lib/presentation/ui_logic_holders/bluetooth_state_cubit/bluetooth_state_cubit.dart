import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classical_bluetooth_app/core/use_cases/parameter_types/no_parameters.dart';
import 'package:classical_bluetooth_app/domain/entities/bluetooth_state/bluetooth_state_entity.dart';
import 'package:classical_bluetooth_app/domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import 'package:classical_bluetooth_app/domain/use_cases/watch_bluetooth_state/watch_bluetooth_state.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bluetooth_state_cubit.freezed.dart';
part 'bluetooth_state_state.dart';

@Injectable()
class BluetoothStateCubit extends Cubit<BluetoothStateState> {
  final WatchBluetoothStateUseCase watchBluetoothStateUseCase;

  StreamSubscription<Either<WatchStatusFailure, BluetoothStateEntity>>
      _failureOrBluetoothStateStreamSubscription;

  BluetoothStateCubit({
    @required this.watchBluetoothStateUseCase,
  }) : super(
          const BluetoothStateState.obtaining(),
        );

  Future<void> subscribeToBluetoothState() async {
    emit(
      const BluetoothStateState.obtaining(),
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
        Either<WatchStatusFailure, BluetoothStateEntity>
            failureOrBluetoothState,
  }) =>
      emit(
        failureOrBluetoothState.fold(
          (failure) => failure.when(
            unexpected: () => const BluetoothStateState.failure(
              message: 'Hubo un problema inesperado',
            ),
          ),
          (bluetoothState) => BluetoothStateState.obtained(
            bluetoothState: bluetoothState,
          ),
        ),
      );

  @override
  Future<void> close() async {
    await _failureOrBluetoothStateStreamSubscription?.cancel();
    return super.close();
  }
}
