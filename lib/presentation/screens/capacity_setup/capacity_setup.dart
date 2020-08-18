import 'package:auto_route/auto_route.dart';
import 'package:classical_bluetooth_app/core/other_helpers/no_action_functions.dart';
import 'package:classical_bluetooth_app/core/presentation/routing/router.gr.dart';
import 'package:classical_bluetooth_app/domain/entities/bluetooth_state/bluetooth_state_entity.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_bonding_state/bt_bonding_state.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_connection_state/bt_connection_state.dart';
import 'package:classical_bluetooth_app/domain/entities/bt_device/bt_device_entity.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/bt_bonding_cubit/bt_bonding_cubit.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/bt_connection_cubit/bt_connection_cubit.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/received_data_from_bt_device_cubit/received_data_from_bt_device_cubit.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/send_data_to_bt_device_cubit/send_data_to_bt_device_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapacitySetupScreen extends StatelessWidget {
  final BtDeviceEntity btDevice;

  const CapacitySetupScreen({
    this.btDevice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BluetoothStateCubit, BluetoothStateEntity>(
        listener: (context, bluetoothState) {
          bluetoothState.maybeWhen(
            orElse: () => ExtendedNavigator.of(context).popUntil(
              (route) =>
                  route.settings.name == Routes.btDiscoveredDevicesScreen,
            ),
            on: NoActionWithNoArguments,
          );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  btDevice.name,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  btDevice.macAddress,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: _BondingScaffoldBody(btDevice: btDevice),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BondingScaffoldBody extends StatelessWidget {
  final BtDeviceEntity btDevice;

  const _BondingScaffoldBody({
    @required this.btDevice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BtBondingCubit, BtBondingState>(
      listener: (context, btBondingState) {
        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              btBondingState.when(
                bonded: () => 'Emparejado con el dispositivo!',
                bonding: () => 'Emparejando...',
                unbonded: () => 'Desemparejado',
                failure: () => 'Hubo un error al emparejar',
              ),
            ),
          ),
        );
      },
      builder: (context, btBondingState) {
        return btBondingState.maybeWhen(
          bonded: () => _ConnectionScaffoldBody(
            btDevice: btDevice,
          ),
          bonding: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () => Center(
            child: RaisedButton(
              color: Colors.blue.shade700,
              onPressed: () {
                context.bloc<BtBondingCubit>().bond(
                      btDevice: btDevice,
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
  final BtDeviceEntity btDevice;

  const _ConnectionScaffoldBody({
    @required this.btDevice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BtConnectionCubit, BtConnectionState>(
      listener: (context, btConnectionState) {
        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              btConnectionState.when(
                connected: () => 'Conectado al dispositivo!',
                changing: () => 'Espere un momento...',
                disconnected: () => 'Desconectado',
                failure: (message) => message ?? 'Hubo un problema al conectar',
              ),
            ),
          ),
        );
      },
      builder: (context, btConnectionState) {
        return btConnectionState.maybeWhen(
          connected: () => _CapacitySetupForm(
            btDevice: btDevice,
          ),
          changing: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () => Center(
            child: RaisedButton(
              color: Colors.blue.shade700,
              onPressed: () {
                context.bloc<BtConnectionCubit>().connect(
                      btDevice: btDevice,
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

class _CapacitySetupForm extends StatelessWidget {
  final GlobalKey<FormFieldState<String>> _kTextFormFieldKey;
  final BtDeviceEntity btDevice;

  _CapacitySetupForm({
    @required this.btDevice,
  }) : _kTextFormFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendDataToBtDeviceCubit, SendDataToBtDeviceState>(
      listener: (context, sendDataToBtDeviceState) {
        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              sendDataToBtDeviceState.when(
                idle: () => '',
                sending: () => 'Configurando...',
                sent: () {
                  context
                      .bloc<ReceivedDataFromBtDeviceCubit>()
                      .subscribeToReceivedDataFromBtDevice(
                        btDevice: btDevice,
                      );
                  ExtendedNavigator.of(context).push(
                    Routes.attendanceScreen,
                    arguments: AttendanceScreenArguments(
                      btDevice: btDevice,
                      maxCapacity:
                          int.tryParse(_kTextFormFieldKey.currentState.value) ??
                              0,
                    ),
                  );
                  return 'Aforo configurado!';
                },
                failure: (message, isConnectionError) {
                  if (isConnectionError) {
                    context.bloc<BtConnectionCubit>().disconnect(
                          btDevice: btDevice,
                        );
                  }
                  return message ?? 'Hubo un problema al configurar el aforo';
                },
              ),
            ),
          ),
        );
      },
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Aforo (capacidad máxima)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            key: _kTextFormFieldKey,
          ),
          Row(
            children: [
              Expanded(
                child: RaisedButton(
                  color: Colors.red.shade700,
                  onPressed: () {
                    context.bloc<BtConnectionCubit>().disconnect(
                          btDevice: btDevice,
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
                    final _valueToBeSent =
                        _kTextFormFieldKey.currentState.value ?? '';
                    context.bloc<SendDataToBtDeviceCubit>().sendDataToBtDevice(
                          btDevice: btDevice,
                          dataString: _valueToBeSent,
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
      ),
    );
  }
}
