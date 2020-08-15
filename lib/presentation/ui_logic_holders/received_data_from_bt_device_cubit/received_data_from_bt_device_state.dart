part of 'received_data_from_bt_device_cubit.dart';

@freezed
abstract class ReceivedDataFromBtDeviceState
    with _$ReceivedDataFromBtDeviceState {
  const factory ReceivedDataFromBtDeviceState.failure() =
      _ReceivedDataFromBtDeviceStateFailure;
  const factory ReceivedDataFromBtDeviceState.idle() =
      _ReceivedDataFromBtDeviceStateIdle;
  const factory ReceivedDataFromBtDeviceState.received({
    @required String dataString,
  }) = _ReceivedDataFromBtDeviceStateReceived;
}
