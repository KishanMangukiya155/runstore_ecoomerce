import 'package:runstore_ecoomerce/libraries.dart';

class CustomSnackBars {
  static errorSnackBar({required String message}) {
    return Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  static successSnackBar({required String message}) {
    return Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  static warningSnackBar({required String message}) {
    return Get.snackbar(
      "Warning",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.deepOrange,
    );
  }

  static appSnackBar({required String message}) {
    return Get.snackbar(
      "Message",
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: primaryColor,
    );
  }
}
