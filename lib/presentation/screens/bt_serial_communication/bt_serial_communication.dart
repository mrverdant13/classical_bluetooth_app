import 'package:classical_bluetooth_app/presentation/ui_logic_holders/received_data_from_bt_device_cubit/received_data_from_bt_device_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:classical_bluetooth_app/presentation/ui_logic_holders/send_data_to_bt_device_cubit/send_data_to_bt_device_cubit.dart';

import '../../../core/injection/injection.dart';
import '../../../domain/entities/bt_bonding_state/bt_bonding_state.dart';
import '../../../domain/entities/bt_connection_state/bt_connection_state.dart';
import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../ui_logic_holders/bt_bonding_cubit/bt_bonding_cubit.dart';
import '../../ui_logic_holders/bt_connection_cubit/bt_connection_cubit.dart';

class BtSerialCommunicationScreen extends StatelessWidget {
  final BtDeviceEntity btDevice;
  final _kTextFormFieldKey = GlobalKey<FormFieldState<String>>();

  BtSerialCommunicationScreen({
    @required this.btDevice,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BtBondingCubit>(
          create: (context) => getIt<BtBondingCubit>(),
        ),
        BlocProvider<BtConnectionCubit>(
          create: (context) => getIt<BtConnectionCubit>(),
        ),
        BlocProvider<SendDataToBtDeviceCubit>(
          create: (context) => getIt<SendDataToBtDeviceCubit>(),
        ),
        BlocProvider<ReceivedDataFromBtDeviceCubit>(
          create: (context) => getIt<ReceivedDataFromBtDeviceCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          body: _CustomMultiBlocListener(
            btDevice: btDevice,
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
                      child: BlocBuilder<BtBondingCubit, BtBondingState>(
                        builder: (context, btBondingState) {
                          return btBondingState.maybeWhen(
                            bonded: () => BlocBuilder<BtConnectionCubit,
                                BtConnectionState>(
                              builder: (context, btConnectionState) {
                                return btConnectionState.maybeWhen(
                                  connected: () => Column(
                                    children: [
                                      Expanded(
                                        child: BlocBuilder<
                                            ReceivedDataFromBtDeviceCubit,
                                            ReceivedDataFromBtDeviceState>(
                                          builder: (context,
                                              receivedDataFromBtDeviceState) {
                                            return receivedDataFromBtDeviceState
                                                .when(
                                              failure: () => const Center(
                                                child: Text(
                                                  'Hubo un error al recibir datos',
                                                ),
                                              ),
                                              idle: () => const Center(
                                                child: Text(
                                                  'A la espera de datos',
                                                ),
                                              ),
                                              received: (dataString) =>
                                                  TextFormField(
                                                scrollPhysics:
                                                    const BouncingScrollPhysics(),
                                                textAlignVertical:
                                                    TextAlignVertical.top,
                                                decoration: InputDecoration(
                                                  hintText: dataString,
                                                  border:
                                                      const OutlineInputBorder(),
                                                ),
                                                enabled: false,
                                                expands: true,
                                                maxLines: null,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Expanded(
                                        child: TextFormField(
                                          scrollPhysics:
                                              const BouncingScrollPhysics(),
                                          textAlignVertical:
                                              TextAlignVertical.top,
                                          decoration: const InputDecoration(
                                            hintText: 'Texto a ser enviado',
                                            border: OutlineInputBorder(),
                                          ),
                                          key: _kTextFormFieldKey,
                                          expands: true,
                                          maxLines: null,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RaisedButton(
                                              color: Colors.red.shade700,
                                              onPressed: () {
                                                context
                                                    .bloc<BtConnectionCubit>()
                                                    .disconnect(
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
                                                    _kTextFormFieldKey
                                                            .currentState
                                                            .value ??
                                                        '';
                                                _kTextFormFieldKey.currentState
                                                    .reset();
                                                context
                                                    .bloc<
                                                        SendDataToBtDeviceCubit>()
                                                    .sendDataToBtDevice(
                                                      btDevice: btDevice,
                                                      dataString:
                                                          _valueToBeSent,
                                                    );
                                              },
                                              child: const Text(
                                                'ENVIAR',
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
                                  changing: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  orElse: () => Center(
                                    child: RaisedButton(
                                      color: Colors.blue.shade700,
                                      onPressed: () {
                                        context
                                            .bloc<BtConnectionCubit>()
                                            .connect(
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomMultiBlocListener extends StatelessWidget {
  final Widget child;
  final BtDeviceEntity btDevice;

  const _CustomMultiBlocListener({
    @required this.btDevice,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BtBondingCubit, BtBondingState>(
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
        ),
        BlocListener<BtConnectionCubit, BtConnectionState>(
          listener: (context, btConnectionState) {
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  btConnectionState.when(
                    connected: () {
                      context
                          .bloc<ReceivedDataFromBtDeviceCubit>()
                          .subscribeToReceivedDataFromBtDevice(
                            btDevice: btDevice,
                          );
                      return 'Conectado al dispositivo!';
                    },
                    changing: () => 'Espere un momento...',
                    disconnected: () => 'Desconectado',
                    failure: (message) =>
                        message ?? 'Hubo un problema al conectar',
                  ),
                ),
              ),
            );
          },
        ),
        BlocListener<SendDataToBtDeviceCubit, SendDataToBtDeviceState>(
          listener: (context, sendDataToBtDeviceState) {
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  sendDataToBtDeviceState.when(
                    idle: () => '',
                    sending: () => 'Enviando...',
                    sent: () => 'Enviado!',
                    failure: (message, isConnectionError) {
                      if (isConnectionError) {
                        context.bloc<BtConnectionCubit>().disconnect(
                              btDevice: btDevice,
                            );
                      }
                      return message ?? 'Hubo un problema al conectar';
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
