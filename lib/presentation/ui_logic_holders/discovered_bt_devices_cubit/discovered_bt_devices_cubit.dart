import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classical_bluetooth_app/core/loggers/presentation/ui_logic_holder.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:classical_bluetooth_app/core/use_cases/parameter_types/no_parameters.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_device/bt_device_entity.dart';
import 'package:classical_bluetooth_app/domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import 'package:classical_bluetooth_app/domain/use_cases/watch_available_bt_devices/watch_available_bt_devices.dart';

part 'discovered_bt_devices_cubit.freezed.dart';
part 'discovered_bt_devices_state.dart';

@Injectable()
class DiscoveredBtDevicesCubit extends Cubit<DiscoveredBtDevicesState> {
  final WatchAvailableBtDevicesUseCase watchAvailableBtDevicesUseCase;

  final Set<BtDeviceEntity> _discoveredBtDevices = {};

  StreamSubscription<Either<WatchBtDevicesFailure, BtDeviceEntity>>
      _failureOrBtDeviceStreamSubscription;

  DiscoveredBtDevicesCubit({
    @required this.watchAvailableBtDevicesUseCase,
  }) : super(
          const DiscoveredBtDevicesState.loaded(
            discoveredBtDevices: {},
          ),
        );

  Future<void> subscribeToBtDevices() async {
    _discoveredBtDevices.clear();

    emit(
      DiscoveredBtDevicesState.loaded(
        discoveredBtDevices: _discoveredBtDevices.toSet(),
      ),
    );

    await _failureOrBtDeviceStreamSubscription?.cancel();

    _failureOrBtDeviceStreamSubscription = watchAvailableBtDevicesUseCase(
      const NoUseCaseParameters(),
    ).listen(
      (failureOrBtDevice) => _updateDiscoveredBtDevices(
        failureOrBtDevice: failureOrBtDevice,
      ),
    );
  }

  void _updateDiscoveredBtDevices({
    @required Either<WatchBtDevicesFailure, BtDeviceEntity> failureOrBtDevice,
  }) =>
      emit(
        failureOrBtDevice.fold(
          (failure) {
            _discoveredBtDevices.clear();
            return failure.when(
              unexpected: () => const DiscoveredBtDevicesState.failure(
                message: 'Hubo un problema inesperado',
              ),
            );
          },
          (btDevice) {
            if (_discoveredBtDevices.add(
              btDevice,
            )) {
              kUiLogicHolderLogger.i(btDevice);
            }
            return DiscoveredBtDevicesState.loaded(
              discoveredBtDevices: _discoveredBtDevices.toSet(),
            );
          },
        ),
      );

  @override
  Future<void> close() async {
    await _failureOrBtDeviceStreamSubscription?.cancel();
    return super.close();
  }
}
