import 'package:auto_route/auto_route_annotations.dart';

import '../../../presentation/screens/bt_discovered_devices/bt_discovered_devices.dart';
import '../../../presentation/screens/bt_serial_communication/bt_serial_communication.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(page: BtDiscoveredDevicesScreen, initial: true),
    CustomRoute(page: BtSerialCommunicationScreen),
  ],
)
class $Router {}
