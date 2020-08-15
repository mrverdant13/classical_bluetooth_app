import 'dart:async';

import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import '../../../domain/use_cases/watch_received_data_from_bt_device/watch_received_data_from_bt_device.dart';

part 'received_data_from_bt_device_cubit.freezed.dart';
part 'received_data_from_bt_device_state.dart';

@Injectable()
class ReceivedDataFromBtDeviceCubit
    extends Cubit<ReceivedDataFromBtDeviceState> {
  final WatchReceivedDataFromBtDeviceUseCase
      watchReceivedDataFromBtDeviceUseCase;

  StreamSubscription<Either<WatchReceivedDataFromBtDeviceFailure, Uint8List>>
      _failureOrDataStringStreamSubscription;

  ReceivedDataFromBtDeviceCubit({
    @required this.watchReceivedDataFromBtDeviceUseCase,
  }) : super(
          const ReceivedDataFromBtDeviceState.idle(),
        );

  Future<void> subscribeToReceivedDataFromBtDevice({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const ReceivedDataFromBtDeviceState.idle(),
    );
    await _failureOrDataStringStreamSubscription?.cancel();
    _failureOrDataStringStreamSubscription =
        watchReceivedDataFromBtDeviceUseCase(
      btDevice,
    ).listen(
      (failureOrDataString) => _updateObtainedData(
        failureOrReceivedData: failureOrDataString,
      ),
    );
  }

  void _updateObtainedData({
    @required
        Either<WatchReceivedDataFromBtDeviceFailure, Uint8List>
            failureOrReceivedData,
  }) {
    print(failureOrReceivedData);
    emit(
        failureOrReceivedData.fold(
          (failure) => failure.when(
            unexpected: () => const ReceivedDataFromBtDeviceState.failure(),
          ),
          (receivedData) => ReceivedDataFromBtDeviceState.received(
            dataString: String.fromCharCodes(receivedData),
          ),
        ),
      );
  }

  @override
  Future<void> close() async {
    await _failureOrDataStringStreamSubscription?.cancel();
    return super.close();
  }
}
