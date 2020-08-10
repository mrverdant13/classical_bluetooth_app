import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';
import '../../ui_logic_holders/discovered_bt_devices_cubit/discovered_bt_devices_cubit.dart';

class BluetoothStatusScreen extends StatelessWidget {
  const BluetoothStatusScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<BluetoothStateCubit, BluetoothStateState>(
              builder: (context, bluetoothState) => bluetoothState.when(
                failure: (message) => Center(
                  child: Text(message),
                ),
                obtained: (bluetoothState) => Center(
                    child: Text(
                  bluetoothState.toString(),
                )),
                obtaining: () => const Center(
                  child: Text('Cargando...'),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<DiscoveredBtDevicesCubit,
                  DiscoveredBtDevicesState>(
                builder: (context, discoveredBtDevicesState) =>
                    discoveredBtDevicesState.when(
                  failure: (message) => Center(
                    child: Text(message),
                  ),
                  loaded: (discoveredBtDevices) => ListView(
                    children: discoveredBtDevices
                        .map(
                          (discoveredBtDevice) => ListTile(
                            title: Text(discoveredBtDevice.name ?? 'N/A'),
                            subtitle: Text(discoveredBtDevice.macAddress ??
                                '00:00:00:00:00:00'),
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.bloc<DiscoveredBtDevicesCubit>().subscribeToBtDevices(),
        child: const Icon(Icons.sync),
      ),
    );
  }
}
