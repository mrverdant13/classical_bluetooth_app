part of 'bluetooth_state_cubit.dart';

@freezed
abstract class BluetoothStateState with _$BluetoothStateState {
  const factory BluetoothStateState.failure({
    @required String message,
  }) = _BluetoothStateStateFailure;
  const factory BluetoothStateState.obtained({
    @required BluetoothStateEntity bluetoothState,
  }) = _BluetoothStateStateObtained;
  const factory BluetoothStateState.obtaining() = _BluetoothStateStateObtaining;
}
