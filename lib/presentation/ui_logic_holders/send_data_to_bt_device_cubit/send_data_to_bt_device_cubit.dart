import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../domain/use_cases/send_data_to_bt_device/send_data_to_bt_device.dart';

part 'send_data_to_bt_device_cubit.freezed.dart';
part 'send_data_to_bt_device_state.dart';

@Injectable()
class SendDataToBtDeviceCubit extends Cubit<SendDataToBtDeviceState> {
  final SendDataToBtDeviceUseCase sendDataToBtDeviceUseCase;

  SendDataToBtDeviceCubit({
    @required this.sendDataToBtDeviceUseCase,
  }) : super(
          const SendDataToBtDeviceState.idle(),
        );

  Future<void> sendDataToBtDevice({
    @required BtDeviceEntity btDevice,
    @required String dataString,
  }) async {
    emit(
      const SendDataToBtDeviceState.sending(),
    );

    final _failureOrVoid = await sendDataToBtDeviceUseCase(
      SendDataToBtDeviceUseCaseParameters(
        btDevice: btDevice,
        dataString: dataString,
      ),
    );

    emit(
      _failureOrVoid.fold(
        (failure) => SendDataToBtDeviceState.failure(
          message: failure.when(
            notConnected: () => 'El dispositivo no está conectado',
            unexpected: () => 'Hubo un problema inesperado al enviar data',
          ),
          isConnectionError: failure.maybeWhen(
            notConnected: () => true,
            orElse: () => false,
          ),
        ),
        (_) => const SendDataToBtDeviceState.sent(),
      ),
    );
  }
}
