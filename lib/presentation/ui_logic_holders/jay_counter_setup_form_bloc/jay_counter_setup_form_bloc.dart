import 'package:classical_bluetooth_app/domain/entities/bt_device/bt_device_entity.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/send_data_to_bt_device/send_data_to_bt_device.dart';

String _integerValidator(String textFieldValue) {
  return int.tryParse(textFieldValue) == null
      ? 'El valor ingresado debe ser un número entero'
      : null;
}

String _notEmptyValidator(String textFieldValue) {
  return (textFieldValue == null || textFieldValue.isEmpty)
      ? 'Este campo es necesario'
      : null;
}

@Injectable()
class JayCounterSetupFormBloc extends FormBloc<String, String> {
  final SendDataToBtDeviceUseCase sendDataToBtDeviceUseCase;

  final maxCapacityTextFieldBloc = TextFieldBloc<void>(
    validators: [
      _integerValidator,
      _notEmptyValidator,
    ],
  );

  final currentCapacityTextFieldBloc = TextFieldBloc<BtDeviceEntity>(
    validators: [
      _integerValidator,
      _notEmptyValidator,
    ],
  );

  JayCounterSetupFormBloc({
    @required this.sendDataToBtDeviceUseCase,
  }) {
    addFieldBlocs(
      fieldBlocs: [
        maxCapacityTextFieldBloc,
        currentCapacityTextFieldBloc,
      ],
    );
  }

  @override
  void submit({
    @required BtDeviceEntity btDevice,
  }) {
    currentCapacityTextFieldBloc.updateExtraData(
      btDevice,
    );
    super.submit();
  }

  @override
  Future<void> onSubmitting() async {
    final failureOrVoid = await sendDataToBtDeviceUseCase(
      SendDataToBtDeviceUseCaseParameters(
        btDevice: currentCapacityTextFieldBloc.state.extraData,
        dataString: currentCapacityTextFieldBloc.valueToInt.toString(),
      ),
    );

    failureOrVoid.fold(
      (failure) => emitFailure(
        failureResponse: failure.when(
          notConnected: () => 'El dispositivo no está conectado',
          unexpected: () => 'Hubo un problema inesperado',
        ),
      ),
      (_) => emitSuccess(
        successResponse: 'Valores configurados!',
        canSubmitAgain: true,
      ),
    );
  }
}
