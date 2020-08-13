import 'package:bloc/bloc.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_bonding_state/bt_bonding_state.dart';
import 'package:classical_bluetooth_app/domain/use_cases/bond_bt_device/bond_bt_device.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';

@Injectable()
class BtBondingCubit extends Cubit<BtBondingState> {
  final BondBtDeviceUseCase bondBtDeviceUseCase;

  BtDeviceEntity _btDevice;

  BtBondingCubit({
    @required this.bondBtDeviceUseCase,
  }) : super(
          const BtBondingState.unbonded(),
        );

  Future<void> connect({
    @required BtDeviceEntity btDevice,
  }) async {
    emit(
      const BtBondingState.bonding(),
    );

    final _failureOrVoid = await bondBtDeviceUseCase(
      btDevice,
    );

    _failureOrVoid.fold(
      (failure) => emit(
        failure.when(
          notFound: () => const BtBondingState.failure(),
          unexpected: () => const BtBondingState.failure(),
        ),
      ),
      (_) {
        _btDevice = btDevice;
        emit(
          const BtBondingState.bonded(),
        );
      },
    );
  }
}
