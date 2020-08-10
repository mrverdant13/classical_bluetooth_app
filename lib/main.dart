import 'package:flutter/material.dart';

import 'app.dart';
import 'core/injection/injection.dart';

void main() {
  configureInjection();
  runApp(
    const MyApp(),
  );
}
