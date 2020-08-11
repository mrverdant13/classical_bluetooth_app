// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';
import '../../../presentation/screens/bt_discovered_devices/bt_discovered_devices.dart';
import '../../../presentation/screens/bt_serial_communication/bt_serial_communication.dart';

class Routes {
  static const String btDiscoveredDevicesScreen = '/';
  static const String btSerialCommunicationScreen =
      '/bt-serial-communication-screen';
  static const all = <String>{
    btDiscoveredDevicesScreen,
    btSerialCommunicationScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.btDiscoveredDevicesScreen, page: BtDiscoveredDevicesScreen),
    RouteDef(Routes.btSerialCommunicationScreen,
        page: BtSerialCommunicationScreen),
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
    BtSerialCommunicationScreen: (data) {
      final args =
          data.getArgs<BtSerialCommunicationScreenArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BtSerialCommunicationScreen(btDevice: args.btDevice),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// BtSerialCommunicationScreen arguments holder class
class BtSerialCommunicationScreenArguments {
  final BtDeviceEntity btDevice;
  BtSerialCommunicationScreenArguments({@required this.btDevice});
}
