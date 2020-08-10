import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/injection/injection.dart';
import 'presentation/screens/bluetooth_status/bluetooth_status.dart';
import 'presentation/ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BluetoothStateCubit>(
            create: (_) =>
                getIt<BluetoothStateCubit>()..subscribeToBluetoothState(),
          ),
        ],
        child: const BluetoothStatusScreen(),
      ),
    );
  }
}
