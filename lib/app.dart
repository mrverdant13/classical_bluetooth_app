import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'core/presentation/routing/router.gr.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      builder: ExtendedNavigator<router.Router>(
        router: router.Router(),
      ),
    );
  }
}
