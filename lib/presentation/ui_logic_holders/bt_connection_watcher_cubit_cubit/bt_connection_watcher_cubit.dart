import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classical_bluetooth_app/core/loggers/presentation/ui_logic_holder.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_device/bt_device_entity.dart';
import 'package:classical_bluetooth_app/domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_connection_state/bt_connection_state_entity.dart';
import '../../../domain/use_cases/watch_bt_device_connection/watch_bt_device_connection.dart';

@Injectable()
class BtConnectionWatcherCubit extends Cubit<BtConnectionStateEntity> {
  final WatchBtDeviceConnectionUseCase watchBtDeviceConnectionUseCase;

  StreamSubscription<Either<WatchBtConnectionFailure, BtConnectionStateEntity>>
      _failureOrBtConnectionStateStreamSubscription;

  BtConnectionWatcherCubit({
    @required this.watchBtDeviceConnectionUseCase,
  }) : super(
          const BtConnectionStateEntity.disconnected(),
        );

  Future<void> subscribeToBtConnectionState({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtConnectionStateEntity.changing(),
    );

    await _failureOrBtConnectionStateStreamSubscription?.cancel();
    _failureOrBtConnectionStateStreamSubscription =
        watchBtDeviceConnectionUseCase(
      btDevice,
    ).listen(
      (failureOrBtConnectionState) => _updateObtainedData(
        failureOrBtConnectionState: failureOrBtConnectionState,
      ),
    );
  }

  void _updateObtainedData({
    @required
        Either<WatchBtConnectionFailure, BtConnectionStateEntity>
            failureOrBtConnectionState,
  }) {
    emit(
      failureOrBtConnectionState.fold(
        (failure) => failure.when(
          unexpected: () => const BtConnectionStateEntity.failure(
            message: 'Hubo un problema inesperado.',
          ),
        ),
        (receivedData) => receivedData,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _failureOrBtConnectionStateStreamSubscription?.cancel();
    return super.close();
  }
}
