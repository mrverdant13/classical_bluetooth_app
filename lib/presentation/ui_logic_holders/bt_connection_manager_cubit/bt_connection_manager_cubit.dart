import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../domain/use_cases/connect_to_bt_device/connect_to_bt_device.dart';
import '../../../domain/use_cases/disconnect_from_bt_device/disconnect_from_bt_device.dart';

part 'bt_connection_manager_cubit.freezed.dart';
part 'bt_connection_manager_state.dart';

@Injectable()
class BtConnectionManagerCubit extends Cubit<BtConnectionManagerState> {
  final ConnectToBtDeviceUseCase connectToBtDeviceUseCase;
  final DisconnectFromBtDeviceUseCase disconnectFromBtDeviceUseCase;

  BtConnectionManagerCubit({
    @required this.connectToBtDeviceUseCase,
    @required this.disconnectFromBtDeviceUseCase,
  }) : super(
          const BtConnectionManagerState.idle(),
        );

  Future<void> connect({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtConnectionManagerState.message(
        'Estableciendo conexión...',
      ),
    );

    final _failureOrVoid = await connectToBtDeviceUseCase(
      btDevice,
    );

    emit(
      _failureOrVoid.fold(
        (failure) => BtConnectionManagerState.message(
          failure.when(
            notBonded: () => 'El dispositivo no está emparejado.',
            unexpected: () => 'No se pudo establecer la conexión',
          ),
        ),
        (_) => const BtConnectionManagerState.idle(),
      ),
    );
  }

  Future<void> disconnect({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtConnectionManagerState.message('Desconectando...'),
    );

    final _failureOrVoid = await disconnectFromBtDeviceUseCase(
      btDevice,
    );

    emit(
      _failureOrVoid.fold(
        (failure) => BtConnectionManagerState.message(
          failure.when(
            unexpected: () => 'Hubo un problema inesperado',
          ),
        ),
        (_) => const BtConnectionManagerState.idle(),
      ),
    );
  }
}
