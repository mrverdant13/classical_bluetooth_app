import 'package:logger/logger.dart';

final Logger kUiLogicHolderLogger = Logger(
  level: Level.verbose,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
