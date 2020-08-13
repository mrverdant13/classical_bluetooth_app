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
    return BlocProvider(
      create: (context) => getIt<BtBondingCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
          body: BlocListener<BtBondingCubit, BtBondingState>(
            listener: (context, btConnectionState) {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    btConnectionState.when(
                      bonded: () => 'Emparejado con el dispositivo!',
                      bonding: () => 'Emparejando...',
                      unbonded: () => 'Desemparejado',
                      failure: () => 'Hubo un error al emparejar',
                    ),
                  ),
                ),
              );
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
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
                            ],
                          ),
                        ),
                        RaisedButton(
                          color: Colors.blue.shade700,
                          onPressed: () {
                            context.bloc<BtBondingCubit>().connect(
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
