import 'package:logger/logger.dart';

final Logger kUseCaseLogger = Logger(
  level: Level.warning,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
