import 'package:auto_route/auto_route.dart';
import 'package:classical_bluetooth_app/core/loggers/presentation/widget.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/bt_connection_watcher_cubit_cubit/bt_connection_watcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/other_helpers/no_action_functions.dart';
import '../../../core/presentation/routing/router.gr.dart';
import '../../../domain/entities/bt_bonding_state/bt_bonding_state_entity.dart';
import '../../../domain/entities/bt_connection_state/bt_connection_state_entity.dart';
import '../../../domain/entities/bt_hardware_state/bt_hardware_state_entity.dart';
import '../../ui_logic_holders/bt_bonding_cubit/bt_bonding_cubit.dart';
import '../../ui_logic_holders/bt_connection_manager_cubit/bt_connection_manager_cubit.dart';
import '../../ui_logic_holders/bt_hardware_state_cubit/bt_hardware_state_cubit.dart';
import '../../ui_logic_holders/jay_counter_current_setup_change_notifier/jay_counter_current_setup_change_notifier.dart';
import '../../ui_logic_holders/jay_counter_setup_form_bloc/jay_counter_setup_form_bloc.dart';
import '../../ui_logic_holders/received_data_from_bt_device_cubit/received_data_from_bt_device_cubit.dart';

class JayCounterSetupScreen extends StatelessWidget {
  const JayCounterSetupScreen();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<BtConnectionManagerCubit>().disconnect(
              btDevice:
                  context.read<JayCounterCurrentSetupChangeNotifier>().btDevice,
            );
        return true;
      },
      child: Scaffold(
        body: _AllListeners(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context
                        .watch<JayCounterCurrentSetupChangeNotifier>()
                        .btDevice
                        .name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    context
                        .watch<JayCounterCurrentSetupChangeNotifier>()
                        .btDevice
                        .macAddress,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 10.0),
                  const Expanded(
                    child: _BondingScaffoldBody(),
                  ),
                ],
              ),
            ),
          ),
        ),
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
          listener: (context, bluetoothState) {
            bluetoothState.maybeWhen(
              orElse: () => ExtendedNavigator.of(context).popUntil(
                (route) =>
                    route.settings.name == Routes.btDiscoveredDevicesScreen,
              ),
              on: NoActionWithNoArguments,
            );
          },
        ),
        BlocListener<BtBondingCubit, BtBondingStateEntity>(
          listener: (context, btBondingState) => _showSnackBar(
            context,
            btBondingState.when(
              bonded: () => 'Emparejado con el dispositivo!',
              bonding: () => 'Emparejando...',
              unbonded: () => 'Desemparejado del dispositivo',
              failure: (message) => message,
            ),
          ),
        ),
        BlocListener<BtConnectionManagerCubit, BtConnectionManagerState>(
          listener: (context, btConnectionState) => btConnectionState.maybeWhen(
            message: (message) => _showSnackBar(
              context,
              message,
            ),
            orElse: NoActionWithNoArguments,
          ),
        ),
        BlocListener<BtConnectionWatcherCubit, BtConnectionStateEntity>(
          listenWhen: (previousBtConnectionStateEntity,
              currentBtConnectionStateEntity) {
            return previousBtConnectionStateEntity.maybeWhen(
              connected: () => currentBtConnectionStateEntity.maybeWhen(
                disconnected: () => true,
                orElse: () => false,
              ),
              orElse: () => false,
            );
          },
          listener: (context, btConnectionState) {
            btConnectionState.maybeWhen(
              disconnected: () {
                ExtendedNavigator.of(context).popUntil(
                  (route) =>
                      route.settings.name == Routes.btDiscoveredDevicesScreen,
                );
              },
              orElse: NoActionWithNoArguments,
            );
          },
        ),
        FormBlocListener<JayCounterSetupFormBloc, String, String>(
          onFailure: (context, formBlocFailure) => _showSnackBar(
            context,
            formBlocFailure.failureResponse,
          ),
          onSuccess: (context, state) {
            context
                .bloc<ReceivedDataFromBtDeviceCubit>()
                .subscribeToReceivedDataFromBtDevice(
                  btDevice: context
                      .read<JayCounterCurrentSetupChangeNotifier>()
                      .btDevice,
                );
            context.read<JayCounterCurrentSetupChangeNotifier>().maxCapacity =
                context
                    .bloc<JayCounterSetupFormBloc>()
                    .maxCapacityTextFieldBloc
                    .valueToInt;
            ExtendedNavigator.of(context).push(
              Routes.numberOfPeopleScreen,
            );
          },
        ),
      ],
      child: child,
    );
  }
}

class _BondingScaffoldBody extends StatelessWidget {
  const _BondingScaffoldBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtBondingCubit, BtBondingStateEntity>(
      builder: (context, btBondingState) {
        return btBondingState.maybeWhen(
          bonded: () => const _ConnectionScaffoldBody(),
          bonding: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () => Center(
            child: RaisedButton(
              color: Colors.blue.shade700,
              onPressed: () {
                context.bloc<BtBondingCubit>().bond(
                      btDevice: context
                          .read<JayCounterCurrentSetupChangeNotifier>()
                          .btDevice,
                    );
              },
              child: const Text(
                'EMPAREJAR',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ConnectionScaffoldBody extends StatelessWidget {
  const _ConnectionScaffoldBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtConnectionWatcherCubit, BtConnectionStateEntity>(
      builder: (context, btConnectionState) {
        kWidgetLogger.i(btConnectionState);
        return btConnectionState.maybeWhen(
          connected: () => const _JayCounterSetupForm(),
          changing: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () => Center(
            child: RaisedButton(
              color: Colors.blue.shade700,
              onPressed: () {
                context.bloc<BtConnectionManagerCubit>().connect(
                      btDevice: context
                          .read<JayCounterCurrentSetupChangeNotifier>()
                          .btDevice,
                    );
                context
                    .bloc<BtConnectionWatcherCubit>()
                    .subscribeToBtConnectionState(
                      btDevice: context
                          .read<JayCounterCurrentSetupChangeNotifier>()
                          .btDevice,
                    );
              },
              child: const Text(
                'CONECTAR',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _JayCounterSetupForm extends StatelessWidget {
  const _JayCounterSetupForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldBlocBuilder(
          textFieldBloc: context
              .bloc<JayCounterSetupFormBloc>()
              .currentCapacityTextFieldBloc,
          decoration: const InputDecoration(
            labelText: 'Personas presentes: ',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        TextFieldBlocBuilder(
          textFieldBloc:
              context.bloc<JayCounterSetupFormBloc>().maxCapacityTextFieldBloc,
          decoration: const InputDecoration(
            labelText: 'Aforo (capacidad máxima): ',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                color: Colors.red.shade700,
                onPressed: () {
                  context.bloc<BtConnectionManagerCubit>().disconnect(
                        btDevice: context
                            .read<JayCounterCurrentSetupChangeNotifier>()
                            .btDevice,
                      );
                },
                child: const Text(
                  'DESCONECTAR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: RaisedButton(
                color: Colors.blue.shade700,
                onPressed: () {
                  context.bloc<JayCounterSetupFormBloc>().submit(
                        btDevice: context
                            .read<JayCounterCurrentSetupChangeNotifier>()
                            .btDevice,
                      );
                },
                child: const Text(
                  'CONFIGURAR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void _showSnackBar(
  BuildContext context,
  String message,
) {
  Scaffold.of(context).removeCurrentSnackBar();
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
