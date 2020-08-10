import 'package:logger/logger.dart';

final Logger kHardwareDataSourceLogger = Logger(
  level: Level.warning,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
