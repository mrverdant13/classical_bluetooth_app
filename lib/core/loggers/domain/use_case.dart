import 'package:logger/logger.dart';

final Logger kUseCaseLogger = Logger(
  level: Level.verbose,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
