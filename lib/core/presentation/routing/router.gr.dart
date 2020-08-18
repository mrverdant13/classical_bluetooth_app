// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../presentation/screens/attendance/attendance.dart';
import '../../../presentation/screens/bt_discovered_devices/bt_discovered_devices.dart';
import '../../../presentation/screens/capacity_setup/capacity_setup.dart';

class Routes {
  static const String btDiscoveredDevicesScreen = '/';
  static const String capacitySetupScreen = '/capacity-setup-screen';
  static const String attendanceScreen = '/attendance-screen';
  static const all = <String>{
    btDiscoveredDevicesScreen,
    capacitySetupScreen,
    attendanceScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.btDiscoveredDevicesScreen, page: BtDiscoveredDevicesScreen),
    RouteDef(Routes.capacitySetupScreen, page: CapacitySetupScreen),
    RouteDef(Routes.attendanceScreen, page: AttendanceScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    BtDiscoveredDevicesScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BtDiscoveredDevicesScreen(),
        settings: data,
      );
    },
    CapacitySetupScreen: (data) {
      final args = data.getArgs<CapacitySetupScreenArguments>(
        orElse: () => CapacitySetupScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CapacitySetupScreen(btDevice: args.btDevice),
        settings: data,
      );
    },
    AttendanceScreen: (data) {
      final args = data.getArgs<AttendanceScreenArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AttendanceScreen(
          btDevice: args.btDevice,
          maxCapacity: args.maxCapacity,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CapacitySetupScreen arguments holder class
class CapacitySetupScreenArguments {
  final BtDeviceEntity btDevice;
  CapacitySetupScreenArguments({this.btDevice});
}

/// AttendanceScreen arguments holder class
class AttendanceScreenArguments {
  final BtDeviceEntity btDevice;
  final int maxCapacity;
  AttendanceScreenArguments(
      {@required this.btDevice, @required this.maxCapacity});
}
