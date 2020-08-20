import 'package:bloc/bloc.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_bonding_state/bt_bonding_state_entity.dart';
import 'package:classical_bluetooth_app/domain/use_cases/bond_bt_device/bond_bt_device.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';

@Injectable()
class BtBondingCubit extends Cubit<BtBondingStateEntity> {
  final BondBtDeviceUseCase bondBtDeviceUseCase;

  BtBondingCubit({
    @required this.bondBtDeviceUseCase,
  }) : super(
          const BtBondingStateEntity.unbonded(),
        );

  Future<void> bond({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtBondingStateEntity.bonding(),
    );

    final _failureOrVoid = await bondBtDeviceUseCase(
      btDevice,
    );

    _failureOrVoid.fold(
      (failure) => emit(
        failure.when(
          unexpected: () => const BtBondingStateEntity.failure(
            message: 'Hubo un problema inesperado',
          ),
          couldNotBond: () => const BtBondingStateEntity.failure(
            message: 'No se pudo emparejar al dispositivo',
          ),
        ),
      ),
      (_) {
        emit(
          const BtBondingStateEntity.bonded(),
        );
      },
    );
  }
}
