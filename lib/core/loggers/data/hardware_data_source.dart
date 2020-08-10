import 'package:logger/logger.dart';

final Logger kHardwareDataSourceLogger = Logger(
  level: Level.verbose,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
