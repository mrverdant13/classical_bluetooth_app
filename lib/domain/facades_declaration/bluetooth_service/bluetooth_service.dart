import 'package:classical_bluetooth_app/domain/entities/bluetooth_state/bluetooth_state_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_service.freezed.dart';

@freezed
abstract class WatchStatusFailure with _$WatchStatusFailure {
  const factory WatchStatusFailure.unexpected() = _WatchStatusFailureUnexpected;
}

abstract class BluetoothServiceDec {
  const BluetoothServiceDec();

  Stream<Either<WatchStatusFailure, BluetoothStateEntity>> watchStatus();
}
