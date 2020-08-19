// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../presentation/screens/bt_discovered_devices/bt_discovered_devices.dart';
import '../../../presentation/screens/jay_counter_setup/jay_counter_setup.dart';
import '../../../presentation/screens/number_of_people/number_of_people.dart';

class Routes {
  static const String btDiscoveredDevicesScreen = '/';
  static const String jayCounterSetupScreen = '/jay-counter-setup-screen';
  static const String numberOfPeopleScreen = '/number-of-people-screen';
  static const all = <String>{
    btDiscoveredDevicesScreen,
    jayCounterSetupScreen,
    numberOfPeopleScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.btDiscoveredDevicesScreen, page: BtDiscoveredDevicesScreen),
    RouteDef(Routes.jayCounterSetupScreen, page: JayCounterSetupScreen),
    RouteDef(Routes.numberOfPeopleScreen, page: NumberOfPeopleScreen),
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
    JayCounterSetupScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            JayCounterSetupScreen(),
        settings: data,
      );
    },
    NumberOfPeopleScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            NumberOfPeopleScreen(),
        settings: data,
      );
    },
  };
}
