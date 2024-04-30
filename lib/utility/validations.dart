import 'package:runstore_ecoomerce/libraries.dart';

class Validations {
  // Validations for empty fields
  static emptyField(String fieldName, String? value) {
    if (value!.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  // Validations for email
  static validateEmail({required String email}) {
    if (email.isEmpty) {
      return "Email is required";
    }

    final regularExpression = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!regularExpression.hasMatch(email)) {
      return "Invalid Email";
    }

    return null;
  }

  // Validations for phone number
  static validatePhone({required String phoneNumber}) {
    if (phoneNumber.isEmpty) {
      return "PhoneNumber is required";
    }

    if (phoneNumber.length < 10) {
      return "Invalid PhoneNumber";
    }
    return null;
  }

  // Validations for password
  static validatePassword({required String password}) {
    if (password.isEmpty) {
      return "Password is required";
    }

    // Uppercase
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return "Password should contain at least one upper case";
    }

    // Lowercase
    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return "Password should contain at least one lower case";
    }

    // Digit
    if (!RegExp(r'(?=.*?[0-9])').hasMatch(password)) {
      return "Password should contain at least one digit";
    }

    // Special character
    if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(password)) {
      return "Password should contain at least one Special character";
    }

    // 5 characters long
    if (!RegExp(r'.{5,}').hasMatch(password)) {
      return "Password should contain at least 5 characters in length";
    }

    return null;
  }
}
