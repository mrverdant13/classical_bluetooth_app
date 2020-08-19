import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/injection/injection.dart';
import 'core/presentation/routing/router.gr.dart' as router;
import 'presentation/ui_logic_holders/bluetooth_state_cubit/bluetooth_state_cubit.dart';
import 'presentation/ui_logic_holders/bt_bonding_cubit/bt_bonding_cubit.dart';
import 'presentation/ui_logic_holders/bt_connection_cubit/bt_connection_cubit.dart';
import 'presentation/ui_logic_holders/discovered_bt_devices_cubit/discovered_bt_devices_cubit.dart';
import 'presentation/ui_logic_holders/jay_counter_current_setup_change_notifier/jay_counter_current_setup_change_notifier.dart';
import 'presentation/ui_logic_holders/jay_counter_setup_form_bloc/jay_counter_setup_form_bloc.dart';
import 'presentation/ui_logic_holders/received_data_from_bt_device_cubit/received_data_from_bt_device_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ! BLOCs
        BlocProvider<BluetoothStateCubit>(
          create: (_) =>
              getIt<BluetoothStateCubit>()..subscribeToBluetoothState(),
        ),
        BlocProvider<DiscoveredBtDevicesCubit>(
          create: (context) => getIt<DiscoveredBtDevicesCubit>(),
        ),
        BlocProvider<BtBondingCubit>(
          create: (context) => getIt<BtBondingCubit>(),
        ),
        BlocProvider<BtConnectionCubit>(
          create: (context) => getIt<BtConnectionCubit>(),
        ),
        BlocProvider<JayCounterSetupFormBloc>(
          create: (context) => getIt<JayCounterSetupFormBloc>(),
        ),
        BlocProvider<ReceivedDataFromBtDeviceCubit>(
          create: (context) => getIt<ReceivedDataFromBtDeviceCubit>(),
        ),
        // ! CHANGE NOTIFIERS
        ChangeNotifierProvider<JayCounterCurrentSetupChangeNotifier>(
          create: (context) => getIt<JayCounterCurrentSetupChangeNotifier>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        builder: ExtendedNavigator<router.Router>(
          router: router.Router(),
        ),
        theme: ThemeData(
          fontFamily: GoogleFonts.alata().fontFamily,
        ),
      ),
    );
  }
}
