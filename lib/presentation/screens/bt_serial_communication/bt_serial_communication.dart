import 'package:classical_bluetooth_app/domain/entities/bt_connection_state/bt_connection_state.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/bt_bonding_cubit/bt_bonding_cubit.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/bt_connection_cubit/bt_connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injection/injection.dart';
import '../../../domain/entities/bt_bonding_state/bt_bonding_state.dart';
import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../ui_logic_holders/bt_bonding_cubit/bt_bonding_cubit.dart';

class BtSerialCommunicationScreen extends StatelessWidget {
  final BtDeviceEntity btDevice;

  const BtSerialCommunicationScreen({
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
      ],
      child: Builder(
        builder: (context) => Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<BtBondingCubit, BtBondingState>(
                listener: (context, btBondingState) {
                  Scaffold.of(context).hideCurrentSnackBar();
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
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        btConnectionState.when(
                          connected: () => 'Conectado al dispositivo!',
                          connecting: () => 'Conectando...',
                          disconnected: () => 'Desconectado',
                          failure: (message) =>
                              message ?? 'Hubo un problema al conectar',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
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
                        RaisedButton(
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
                      ],
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
