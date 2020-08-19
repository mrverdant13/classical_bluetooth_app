import 'package:auto_route/auto_route_annotations.dart';
import 'package:classical_bluetooth_app/presentation/screens/number_of_people/number_of_people.dart';
import 'package:classical_bluetooth_app/presentation/screens/jay_counter_setup/jay_counter_setup.dart';

import '../../../presentation/screens/bt_discovered_devices/bt_discovered_devices.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(page: BtDiscoveredDevicesScreen, initial: true),
    CustomRoute(page: JayCounterSetupScreen),
    CustomRoute(page: NumberOfPeopleScreen),
  ],
)
class $Router {}
