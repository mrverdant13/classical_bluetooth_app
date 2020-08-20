import 'package:freezed_annotation/freezed_annotation.dart';

part 'bt_hardware_state_entity.freezed.dart';

@freezed
abstract class BtHardwareStateEntity with _$BtHardwareStateEntity {
  const factory BtHardwareStateEntity.changing() =
      _BtHardwareStateEntityEntityChanging;
  const factory BtHardwareStateEntity.failure({
    @required String message,
  }) = _BtHardwareStateEntityEntityFailure;
  const factory BtHardwareStateEntity.off() = _BtHardwareStateEntityEntityOff;
  const factory BtHardwareStateEntity.on() = _BtHardwareStateEntityEntityOn;
}
