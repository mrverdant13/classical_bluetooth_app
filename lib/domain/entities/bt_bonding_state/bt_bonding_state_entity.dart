import 'package:freezed_annotation/freezed_annotation.dart';

part 'bt_bonding_state_entity.freezed.dart';

@freezed
abstract class BtBondingStateEntity with _$BtBondingStateEntity {
  const factory BtBondingStateEntity.bonded() = _BtBondingStateEntityConnected;
  const factory BtBondingStateEntity.bonding() =
      _BtBondingStateEntityConnecting;
  const factory BtBondingStateEntity.failure({
    @required String message,
  }) = _BtBondingStateEntityFailure;
  const factory BtBondingStateEntity.unbonded() =
      _BtBondingStateEntityDisconnected;
}
