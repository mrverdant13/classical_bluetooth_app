import 'package:logger/logger.dart';

final Logger kUiLogicHolderLogger = Logger(
  level: Level.warning,
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
