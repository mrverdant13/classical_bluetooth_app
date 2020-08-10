import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_state_entity.freezed.dart';

@freezed
abstract class BluetoothStateEntity with _$BluetoothStateEntity {
  const factory BluetoothStateEntity.changing() = _BluetoothStateEntityChanging;
  const factory BluetoothStateEntity.error() = _BluetoothStateEntityError;
  const factory BluetoothStateEntity.off() = _BluetoothStateEntityOff;
  const factory BluetoothStateEntity.on() = _BluetoothStateEntityOn;
  const factory BluetoothStateEntity.unknown() = _BluetoothStateEntityUnknown;
}
