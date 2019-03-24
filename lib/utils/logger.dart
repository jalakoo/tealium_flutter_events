enum LoggerMode { none, error, warning, verbose }

Logger log = Logger();

class Logger {
  LoggerMode mode = LoggerMode.verbose;

  void error(String message) {
    if (currentModeValue() >= LoggerMode.error.index) {
      print("LOG ERROR: " + message);
    }
  }

  void verbose(String message) {
    if (currentModeValue() >= LoggerMode.verbose.index) {
      print("LOG VERBOSE: " + message);
    }
  }

  void warning(String message) {
    if (currentModeValue() >= LoggerMode.warning.index) {
      print("LOG WARNING: " + message);
    }
  }

  int currentModeValue() {
    return mode.index;
  }
}
