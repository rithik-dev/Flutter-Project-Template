import 'dart:developer' as devtools show log;

/// log
void log<T>({
  dynamic msg,
  dynamic error,
  String? screenId,
  StackTrace? stackTrace,
}) {
  devtools.log(
    msg.toString(),
    error: error,
    name: screenId ?? T.toString(),
    stackTrace: stackTrace,
  );
}

mixin Logger<T> {
  /// Logs a message
  void logMsg(dynamic msg) {
    log<T>(msg: msg.toString());
  }

  /// Logs an error
  void logErr(
    dynamic error, {
    StackTrace? stackTrace,
  }) {
    log<T>(
      msg: error,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
