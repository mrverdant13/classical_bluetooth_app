import 'package:bloc/bloc.dart';
import 'package:classical_bluetooth_app/domain/use_cases/disconnect_from_bt_device/disconnect_from_bt_device.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_connection_state/bt_connection_state.dart';
import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../domain/use_cases/connect_to_bt_device/connect_to_bt_device.dart';

@Injectable()
class BtConnectionCubit extends Cubit<BtConnectionState> {
  final ConnectToBtDeviceUseCase connectToBtDeviceUseCase;
  final DisconnectFromBtDeviceUseCase disconnectFromBtDeviceUseCase;

  BtConnectionCubit({
    @required this.connectToBtDeviceUseCase,
    @required this.disconnectFromBtDeviceUseCase,
  }) : super(
          const BtConnectionState.disconnected(),
        );

  Future<void> connect({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtConnectionState.changing(),
    );

    final _failureOrVoid = await connectToBtDeviceUseCase(
      btDevice,
    );

    emit(
      _failureOrVoid.fold(
        (failure) => BtConnectionState.failure(
          message: failure.when(
            notPaired: () => 'El dispositivo no está emparejado.',
            unexpected: () => 'No se pudo establecer la conexión',
          ),
        ),
        (_) => const BtConnectionState.connected(),
      ),
    );
  }

  Future<void> disconnect({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtConnectionState.changing(),
    );

    final _failureOrVoid = await disconnectFromBtDeviceUseCase(
      btDevice,
    );

    emit(
      _failureOrVoid.fold(
        (failure) => BtConnectionState.failure(
          message: failure.when(
            unexpected: () => 'Hubo un problema inesperado',
          ),
        ),
        (_) => const BtConnectionState.disconnected(),
      ),
    );
  }
}
