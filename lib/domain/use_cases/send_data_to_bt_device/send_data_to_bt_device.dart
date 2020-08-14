import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/use_cases/types/future_use_case.dart';
import '../../entities/bt_device/bt_device_entity.dart';
import '../../facades_declaration/bluetooth_service/bluetooth_service.dart';

part 'send_data_to_bt_device.freezed.dart';

@LazySingleton()
class SendDataToBtDeviceUseCase extends FutureUseCase<SendDataToBtDeviceFailure,
    void, SendDataToBtDeviceUseCaseParameters> {
  final BluetoothServiceDec bluetoothService;

  const SendDataToBtDeviceUseCase({
    @required this.bluetoothService,
  });

  @override
  Future<Either<SendDataToBtDeviceFailure, void>> call(
    SendDataToBtDeviceUseCaseParameters parameters,
  ) =>
      bluetoothService.sendDataToBtDevice(
        btDevice: parameters.btDevice,
        dataString: parameters.dataString,
      );
}

@freezed
abstract class SendDataToBtDeviceUseCaseParameters
    with _$SendDataToBtDeviceUseCaseParameters {
  const factory SendDataToBtDeviceUseCaseParameters({
    @required BtDeviceEntity btDevice,
    @required String dataString,
  }) = _SendDataToBtDeviceUseCaseParameters;
}
