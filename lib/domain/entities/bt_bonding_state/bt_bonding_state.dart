import 'package:freezed_annotation/freezed_annotation.dart';

part 'bt_bonding_state.freezed.dart';

@freezed
abstract class BtBondingState with _$BtBondingState {
  const factory BtBondingState.bonded() = _BtBondingStateConnected;
  const factory BtBondingState.bonding() = _BtBondingStateConnecting;
  const factory BtBondingState.unbonded() = _BtBondingStateDisconnected;
  const factory BtBondingState.failure() = _BtBondingStateFailure;
}
