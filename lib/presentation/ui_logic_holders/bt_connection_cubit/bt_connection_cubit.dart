import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_connection_state/bt_connection_state.dart';
import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../domain/use_cases/connect_to_bt_device/connect_to_bt_device.dart';

@Injectable()
class BtConnectionCubit extends Cubit<BtConnectionState> {
  final ConnectToBtDeviceUseCase connectToBtDeviceUseCase;

  BtConnectionCubit({
    @required this.connectToBtDeviceUseCase,
  }) : super(
          const BtConnectionState.disconnected(),
        );

  Future<void> connect({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtConnectionState.connecting(),
    );

    final _failureOrVoid = await connectToBtDeviceUseCase(
      btDevice,
    );

    _failureOrVoid.fold(
      (failure) => emit(
        failure.when(
          notPaired: () => const BtConnectionState.failure(
            message: 'El dispositivo no está emparejado.',
          ),
          unexpected: () => const BtConnectionState.failure(
            message: 'Hubo un problema inesperado',
          ),
        ),
      ),
      (_) => emit(
        const BtConnectionState.connected(),
      ),
    );
  }
}
