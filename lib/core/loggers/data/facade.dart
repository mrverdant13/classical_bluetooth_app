import 'package:logger/logger.dart';

final Logger kFacadeLogger = Logger(
  level: Level.verbose,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
