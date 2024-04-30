import 'package:runstore_ecoomerce/libraries.dart';

class CustomSnackBars {
  static errorSnackBar({required String message}) {
    return Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    );
  }

  static successSnackBar({required String message}) {
    return Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    );
  }

  static warningSnackBar({required String message}) {
    return Get.snackbar(
      "Warning",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.deepOrange,
      duration: const Duration(seconds: 2),
    );
  }

  static appSnackBar({required String message}) {
    return Get.snackbar(
      "Message",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: primaryColor,
      duration: const Duration(seconds: 2),
    );
  }
}
