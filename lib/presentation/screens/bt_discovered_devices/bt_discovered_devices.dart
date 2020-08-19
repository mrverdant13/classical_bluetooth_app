import 'package:auto_route/auto_route.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/jay_counter_current_setup_change_notifier/jay_counter_current_setup_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/other_helpers/no_action_functions.dart';
import '../../../core/presentation/routing/router.gr.dart';
import '../../../domain/entities/bluetooth_state/bluetooth_state_entity.dart';
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
          on: () =>
              BlocBuilder<DiscoveredBtDevicesCubit, DiscoveredBtDevicesState>(
            builder: (context, discoveredBtDevicesState) =>
                discoveredBtDevicesState.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loaded: (discoveredBtDevices, discovering) =>
                  FloatingActionButton(
                onPressed: () {
                  discovering
                      ? context.bloc<DiscoveredBtDevicesCubit>().stopDiscovery()
                      : context
                          .bloc<DiscoveredBtDevicesCubit>()
                          .discoverBtDevices();
                },
                backgroundColor: Colors.blue.shade700,
                tooltip: discovering ? 'Cancelar' : 'Escanear',
                child: Icon(
                  discovering ? Icons.close : Icons.sync,
                ),
              ),
            ),
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
            loaded: (discoveredBtDevices, discovering) => Column(
              children: [
                if (discovering) const LinearProgressIndicator(),
                Expanded(
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    children: discoveredBtDevices
                        .map(
                          (discoveredBtDevice) => ListTile(
                            title: Text(discoveredBtDevice.name),
                            subtitle: Text(discoveredBtDevice.macAddress),
                            onTap: () {
                              context
                                  .read<JayCounterCurrentSetupChangeNotifier>()
                                  .btDevice = discoveredBtDevice;
                              context
                                  .bloc<DiscoveredBtDevicesCubit>()
                                  .stopDiscovery();
                              ExtendedNavigator.of(context).push(
                                Routes.jayCounterSetupScreen,
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
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
