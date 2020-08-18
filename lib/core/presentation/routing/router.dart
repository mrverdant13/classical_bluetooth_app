import 'package:auto_route/auto_route_annotations.dart';
import 'package:classical_bluetooth_app/presentation/screens/attendance/attendance.dart';
import 'package:classical_bluetooth_app/presentation/screens/capacity_setup/capacity_setup.dart';

import '../../../presentation/screens/bt_discovered_devices/bt_discovered_devices.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(page: BtDiscoveredDevicesScreen, initial: true),
    CustomRoute(page: CapacitySetupScreen),
    CustomRoute(page: AttendanceScreen),
  ],
)
class $Router {}
