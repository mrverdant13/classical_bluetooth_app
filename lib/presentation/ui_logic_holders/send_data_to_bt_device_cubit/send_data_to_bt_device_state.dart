part of 'send_data_to_bt_device_cubit.dart';

@freezed
abstract class SendDataToBtDeviceState with _$SendDataToBtDeviceState {
  const factory SendDataToBtDeviceState.idle() = _SendDataToBtDeviceStateIdle;
  const factory SendDataToBtDeviceState.sending() =
      _SendDataToBtDeviceStateSending;
  const factory SendDataToBtDeviceState.sent() = _SendDataToBtDeviceStateSent;
  const factory SendDataToBtDeviceState.failure({
    @required String message,
    @required bool isConnectionError,
  }) = _SendDataToBtDeviceStateFailure;
}
