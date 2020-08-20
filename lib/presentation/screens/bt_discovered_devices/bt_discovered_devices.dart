import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/other_helpers/no_action_functions.dart';
import '../../../core/presentation/routing/router.gr.dart';
import '../../../domain/entities/bt_hardware_state/bt_hardware_state_entity.dart';
import '../../ui_logic_holders/bt_hardware_state_cubit/bt_hardware_state_cubit.dart';
import '../../ui_logic_holders/discovered_bt_devices_cubit/discovered_bt_devices_cubit.dart';
import '../../ui_logic_holders/jay_counter_current_setup_change_notifier/jay_counter_current_setup_change_notifier.dart';

class BtDiscoveredDevicesScreen extends StatelessWidget {
  const BtDiscoveredDevicesScreen();

  @override
  Widget build(BuildContext context) {
    return const _AllListeners(
      child: Scaffold(
        appBar: _BtStateAppBarIndicator(),
        body: SafeArea(
          child: _DiscoveredBtDevicesListView(),
        ),
        floatingActionButton: _DiscoveryDevicesFab(),
      ),
    );
  }
}

class _AllListeners extends StatelessWidget {
  final Widget child;

  const _AllListeners({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BtHardwareStateCubit, BtHardwareStateEntity>(
          listener: (context, bluetoothState) => bluetoothState.maybeWhen(
            on: () =>
                context.bloc<DiscoveredBtDevicesCubit>().discoverBtDevices(),
            orElse: NoActionWithNoArguments,
          ),
        ),
      ],
      child: child,
    );
  }
}

class _BtStateAppBarIndicator extends StatelessWidget
    implements PreferredSizeWidget {
  const _BtStateAppBarIndicator();

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtHardwareStateCubit, BtHardwareStateEntity>(
      builder: (context, bluetoothState) => AppBar(
        title: Text(
          bluetoothState.when(
            changing: () => 'Cargando...',
            failure: (message) => message,
            off: () => 'BT apagado',
            on: () => 'BT encendido',
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: bluetoothState.when(
          changing: () => Colors.yellow.shade700,
          failure: (_) => Colors.red,
          off: () => Colors.grey.shade600,
          on: () => Colors.blue.shade700,
        ),
      ),
    );
  }
}

class _DiscoveredBtDevicesListView extends StatelessWidget {
  const _DiscoveredBtDevicesListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtHardwareStateCubit, BtHardwareStateEntity>(
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
                            onTap: () async {
                              context
                                  .read<JayCounterCurrentSetupChangeNotifier>()
                                  .btDevice = discoveredBtDevice;
                              context
                                  .bloc<DiscoveredBtDevicesCubit>()
                                  .stopDiscovery();
                              await ExtendedNavigator.of(context).push(
                                Routes.jayCounterSetupScreen,
                              );
                              context
                                  .bloc<DiscoveredBtDevicesCubit>()
                                  .discoverBtDevices();
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

class _DiscoveryDevicesFab extends StatelessWidget {
  const _DiscoveryDevicesFab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtHardwareStateCubit, BtHardwareStateEntity>(
      builder: (context, bluetoothState) => bluetoothState.maybeWhen(
        on: () =>
            BlocBuilder<DiscoveredBtDevicesCubit, DiscoveredBtDevicesState>(
          builder: (context, discoveredBtDevicesState) =>
              discoveredBtDevicesState.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loaded: (discoveredBtDevices, discovering) => FloatingActionButton(
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
    );
  }
}
