import 'package:logger/logger.dart';

final Logger kPresentationLogger = Logger(
  level: Level.warning,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
