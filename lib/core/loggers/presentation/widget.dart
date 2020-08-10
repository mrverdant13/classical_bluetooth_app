import 'package:logger/logger.dart';

final Logger kWidgetLogger = Logger(
  level: Level.verbose,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
