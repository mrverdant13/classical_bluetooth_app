import 'package:auto_route/auto_route.dart';
import 'package:classical_bluetooth_app/core/other_helpers/no_action_functions.dart';
import 'package:classical_bluetooth_app/core/presentation/routing/router.gr.dart';
import 'package:classical_bluetooth_app/domain/entities/bluetooth_state/bluetooth_state_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';
import '../../ui_logic_holders/discovered_bt_devices_cubit/discovered_bt_devices_cubit.dart';

class BtDiscoveredDevicesScreen extends StatelessWidget {
  const BtDiscoveredDevicesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _BtStateIndicator(),
            Expanded(
              child: _DiscoveredBtDevicesListView(),
            ),
          ],
        ),
      ),
      floatingActionButton:
          BlocConsumer<BluetoothStateCubit, BluetoothStateEntity>(
        listener: (context, bluetoothState) => bluetoothState.maybeWhen(
          on: () =>
              context.bloc<DiscoveredBtDevicesCubit>().discoverBtDevices(),
          orElse: NoActionWithNoArguments,
        ),
        builder: (context, bluetoothState) => bluetoothState.maybeWhen(
          on: () => FloatingActionButton(
            onPressed: () {
              context.bloc<DiscoveredBtDevicesCubit>().discoverBtDevices();
            },
            backgroundColor: Colors.blue.shade700,
            child: const Icon(Icons.sync),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _DiscoveredBtDevicesListView extends StatelessWidget {
  const _DiscoveredBtDevicesListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothStateCubit, BluetoothStateEntity>(
      builder: (context, bluetoothState) => bluetoothState.maybeWhen(
        orElse: () => const Center(
          child: Text('Hubo un problema inesperado'),
        ),
        off: () => const Center(
          child: Text('Es necesario que active su Bluetooth'),
        ),
        changing: () => const Center(
          child: CircularProgressIndicator(),
        ),
        on: () =>
            BlocBuilder<DiscoveredBtDevicesCubit, DiscoveredBtDevicesState>(
          builder: (context, discoveredBtDevicesState) =>
              discoveredBtDevicesState.when(
            failure: (message) => Center(
              child: Text(message),
            ),
            loaded: (discoveredBtDevices) => ListView(
              children: discoveredBtDevices
                  .map(
                    (discoveredBtDevice) => ListTile(
                      title: Text(discoveredBtDevice.name),
                      subtitle: Text(discoveredBtDevice.macAddress),
                      onTap: () {
                        ExtendedNavigator.of(context).push(
                          Routes.btSerialCommunicationScreen,
                          arguments: BtSerialCommunicationScreenArguments(
                            btDevice: discoveredBtDevice,
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _BtStateIndicator extends StatelessWidget {
  const _BtStateIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothStateCubit, BluetoothStateEntity>(
      builder: (context, bluetoothStateState) => Container(
        color: bluetoothStateState.when(
          changing: () => Colors.yellow.shade700,
          error: () => Colors.red,
          off: () => Colors.grey.shade600,
          on: () => Colors.blue.shade700,
          unknown: () => Colors.grey.shade600,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Text(
          bluetoothStateState.when(
            changing: () => 'Cargando...',
            error: () => 'Error inesperado',
            off: () => 'BT apagado',
            on: () => 'BT encendido',
            unknown: () => 'Estado desconocido',
          ),
          style: _style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static const _style = TextStyle(
    fontSize: 25.0,
    color: Colors.white,
  );
}
