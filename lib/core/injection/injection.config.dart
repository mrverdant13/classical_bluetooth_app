// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/hardware/bluetooth/bluetooth.dart';
import '../../data/data_source/hardware/bluetooth/external/injection.dart';
import '../../domain/facades_declaration/bluetooth_service/bluetooth_service.dart';
import '../../data/facades_implementation/bluetooth_service.dart';
import '../../presentation/ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';
import '../../domain/use_cases/bond_bt_device/bond_bt_device.dart';
import '../../presentation/ui_logic_holders/bt_bonding_cubit/bt_bonding_cubit.dart';
import '../../presentation/ui_logic_holders/bt_connection_cubit/bt_connection_cubit.dart';
import '../../domain/use_cases/connect_to_bt_device/connect_to_bt_device.dart';
import '../../domain/use_cases/disconnect_from_bt_device/disconnect_from_bt_device.dart';
import '../../presentation/ui_logic_holders/discovered_bt_devices_cubit/discovered_bt_devices_cubit.dart';
import '../../presentation/ui_logic_holders/send_data_to_bt_device_cubit/send_data_to_bt_device_cubit.dart';
import '../../domain/use_cases/send_data_to_bt_device/send_data_to_bt_device.dart';
import '../../domain/use_cases/stop_bt_devices_watching/stop_bt_devices_watching.dart';
import '../../domain/use_cases/watch_available_bt_devices/watch_available_bt_devices.dart';
import '../../domain/use_cases/watch_bluetooth_state/watch_bluetooth_state.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final bluetoothSerialModule = _$BluetoothSerialModule();
  gh.lazySingleton<FlutterBluetoothSerial>(
      () => bluetoothSerialModule.bluetoothSerial);
  gh.lazySingleton<BluetoothHardwareDataSourceDec>(() =>
      BluetoothHardwareDataSourceImp(
          bluetoothSerial: get<FlutterBluetoothSerial>()));
  gh.lazySingleton<BluetoothServiceDec>(() => BluetoothServiceImp(
      bluetoothHardwareDataSource: get<BluetoothHardwareDataSourceDec>()));
  gh.lazySingleton<BondBtDeviceUseCase>(
      () => BondBtDeviceUseCase(bluetoothService: get<BluetoothServiceDec>()));
  gh.factory<BtBondingCubit>(
      () => BtBondingCubit(bondBtDeviceUseCase: get<BondBtDeviceUseCase>()));
  gh.lazySingleton<ConnectToBtDeviceUseCase>(() =>
      ConnectToBtDeviceUseCase(bluetoothService: get<BluetoothServiceDec>()));
  gh.lazySingleton<DisconnectFromBtDeviceUseCase>(() =>
      DisconnectFromBtDeviceUseCase(
          bluetoothService: get<BluetoothServiceDec>()));
  gh.lazySingleton<SendDataToBtDeviceUseCase>(() =>
      SendDataToBtDeviceUseCase(bluetoothService: get<BluetoothServiceDec>()));
  gh.lazySingleton<StopBtDevicesWatchingUseCase>(() =>
      StopBtDevicesWatchingUseCase(
          bluetoothService: get<BluetoothServiceDec>()));
  gh.lazySingleton<WatchAvailableBtDevicesUseCase>(() =>
      WatchAvailableBtDevicesUseCase(
          bluetoothService: get<BluetoothServiceDec>()));
  gh.lazySingleton<WatchBluetoothStateUseCase>(() =>
      WatchBluetoothStateUseCase(bluetoothService: get<BluetoothServiceDec>()));
  gh.factory<BluetoothStateCubit>(() => BluetoothStateCubit(
      watchBluetoothStateUseCase: get<WatchBluetoothStateUseCase>()));
  gh.factory<BtConnectionCubit>(() => BtConnectionCubit(
      connectToBtDeviceUseCase: get<ConnectToBtDeviceUseCase>(),
      disconnectFromBtDeviceUseCase: get<DisconnectFromBtDeviceUseCase>()));
  gh.factory<DiscoveredBtDevicesCubit>(() => DiscoveredBtDevicesCubit(
      watchAvailableBtDevicesUseCase: get<WatchAvailableBtDevicesUseCase>(),
      stopBtDevicesWatchingUseCase: get<StopBtDevicesWatchingUseCase>()));
  gh.factory<SendDataToBtDeviceCubit>(() => SendDataToBtDeviceCubit(
      sendDataToBtDeviceUseCase: get<SendDataToBtDeviceUseCase>()));
  return get;
}

class _$BluetoothSerialModule extends BluetoothSerialModule {}
