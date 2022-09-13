import 'dart:io';

class UserInput {
  static int receiveIntegerFromUser({
    String message = "provide a int type number",
    int? start,
    int? end,
    String errorMessage = "provide a valid int number",
  }) {
    int? number;

    while (number == null) {
      print("\n$message");
      String? userInput = stdin.readLineSync();

      if (userInput != null) {
        number = int.tryParse(userInput);

        if (number == null) {
          print(errorMessage);
        } else {
          if (start != null && number < start) {
            number = null;
            print(errorMessage);
            continue;
          }
          if (end != null && number > end) {
            number = null;
            print(errorMessage);
          }
        }
      }
    }

    return number;
  }

  static double receiveDoubleFromUser({
    String message = "provide a double type number",
    double? start,
    double? end,
    String errorMessage = "provide a double int number",
  }) {
    double? number;

    while (number == null) {
      print("\n$message");
      String? userInput = stdin.readLineSync();

      if (userInput != null) {
        number = double.tryParse(userInput);

        if (number == null) {
          print(errorMessage);
        } else {
          if (start != null && number < start) {
            number = null;
            print(errorMessage);
            continue;
          }
          if (end != null && number > end) {
            number = null;
            print(errorMessage);
          }
        }
      }
    }

    return number;
  }

  static String receiveLetterFromUser({
    String message = "provide a letter",
    String errorMessage = "provide a letter",
    List<String>? filter,
  }) {
    String? letter;

    if (filter != null) {
      filter = filter.map((element) => element.toUpperCase()).toList();
    }

    while (letter == null) {
      print("\n$message");
      String? userInput = stdin.readLineSync();

      if (userInput != null) {
        letter = userInput[0].toUpperCase();
        if (!letter.contains(RegExp(r'[A-Z]'))) {
          print(errorMessage);
          letter = null;
          continue;
        }

        if (filter != null) {
          if (!filter.contains(letter)) {
            print(errorMessage);
            letter = null;
          }
        }
      }
    }

    return letter;
  }

  static String receiveStringFromUser({
    String message = "provide a string",
    String errorMessage = "provide a string",
    List<String>? filter,
    int? length,
    List<bool Function(String value)>? validators,
  }) {
    String? string;

    if (filter != null) {
      filter = filter.map((e) => e.toUpperCase()).toList();
    }

    while (string == null) {
      print("\n$message");
      string = stdin.readLineSync();

      if (filter != null) {
        if (!filter.contains(string)) {
          string = null;
        }
      }

      if (string == null) {
        print(errorMessage);
      }

      if (validators != null && string != null) {
        for (final validator in validators) {
          final result = validator(string!);
          if (!result) {
            print(errorMessage);
            string = null;
            break;
          }
        }
      }
    }
    return string;
  }
}
