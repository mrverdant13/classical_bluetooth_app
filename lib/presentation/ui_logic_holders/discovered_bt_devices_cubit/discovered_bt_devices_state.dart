part of 'discovered_bt_devices_cubit.dart';

@freezed
abstract class DiscoveredBtDevicesState with _$DiscoveredBtDevicesState {
  const factory DiscoveredBtDevicesState.failure({
    @required String message,
  }) = DiscoveredBtDevicesStateFailure;
  const factory DiscoveredBtDevicesState.loaded({
    @required Set<BtDeviceEntity> discoveredBtDevices,
    @required bool discovering,
  }) = DiscoveredBtDevicesStateLoaded;
}
