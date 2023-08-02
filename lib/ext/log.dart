import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

extension ConsoleLoggerExtension on Object {
  Logger get _logger => Logger(
        level: kDebugMode ? Level.verbose : Level.nothing,
      );

  void logSuccess({String extra = ''}) {
    // Custom log level for error messages with stack trace
    _logger.log(
      Level.verbose,
      '${toString()}${extra.isNotEmpty ? '\t\t extra: $extra!' : ''}',
    );
  }

  void logDebug({String extra = ''}) {
    // Custom log level for error messages with stack trace
    _logger.log(
      Level.debug,
      '${toString()}${extra.isNotEmpty ? '\t\t extra: $extra!' : ''}',
    );
  }

  void logError({String extra = '', StackTrace? stackTrace}) {
    // Custom log level for error messages with stack trace
    _logger.log(
        Level.error,
        '${toString()}${extra.isNotEmpty ? '\t\t extra: $extra!' : ''}',
        this,
        stackTrace);
  }
}
