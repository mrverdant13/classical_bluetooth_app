import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/injection/injection.dart';
import 'core/presentation/routing/router.gr.dart' as router;
import 'presentation/ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';
import 'presentation/ui_logic_holders/discovered_bt_devices_cubit/discovered_bt_devices_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BluetoothStateCubit>(
          create: (_) =>
              getIt<BluetoothStateCubit>()..subscribeToBluetoothState(),
        ),
        BlocProvider<DiscoveredBtDevicesCubit>(
          create: (context) => getIt<DiscoveredBtDevicesCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        builder: ExtendedNavigator<router.Router>(
          router: router.Router(),
        ),
      ),
    );
  }
}
