import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';

class BluetoothStatusScreen extends StatelessWidget {
  const BluetoothStatusScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BluetoothStateCubit, BluetoothStateState>(
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
    );
  }
}
