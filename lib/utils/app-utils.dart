import 'dart:io';

class AppUtils {
  static void pauseApp({String message = "\n\npress enter to proceed..."}) {
    print(message);
    stdin.readLineSync();
  }

  static void clearConsole() {
    print("\x1B[2J\x1B[0;0H");
  }
}
