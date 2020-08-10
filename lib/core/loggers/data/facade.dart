import 'package:logger/logger.dart';

final Logger kFacadeLogger = Logger(
  level: Level.warning,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
