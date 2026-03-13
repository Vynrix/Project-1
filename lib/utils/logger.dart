import 'package:flutter/foundation.dart';

class Logger {
  static const String _prefix = '🔷 Nadodi';

  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      print('$_prefix [DEBUG] $message');
      if (error != null) print('Error: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }

  static void info(String message) {
    if (kDebugMode) {
      print('$_prefix [INFO] $message');
    }
  }

  static void warning(String message, [dynamic error]) {
    if (kDebugMode) {
      print('$_prefix [WARNING] $message');
      if (error != null) print('Error: $error');
    }
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      print('$_prefix [ERROR] $message');
      if (error != null) print('Error: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }

  static void success(String message) {
    if (kDebugMode) {
      print('$_prefix [SUCCESS] ✓ $message');
    }
  }
}