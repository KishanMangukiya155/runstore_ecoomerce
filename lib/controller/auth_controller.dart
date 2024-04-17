import 'package:get_storage/get_storage.dart';

import '../libraries.dart';

class AuthController extends GetxController {
  // It is used when user wants to store the login credential in
  // their phone
  RxBool isRememberMe = false.obs;

  // It is used to show or hide passwords
  RxBool obscureText = true.obs;

  // GetStorage Initialization
  final get = GetStorage();

  // controllers that are used for authentication
  // and registering new user
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumber = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  // Function to change the value of obscureText
  void changeObscureText() => obscureText(!obscureText.value);

  void validateForm() {}

  void setRememberMe() {
    if (isRememberMe.isFalse) {
      get.writeIfNull("rememberMe", true);
      get.writeIfNull("email", emailController.text);
      get.writeIfNull("password", passwordController.text);
      isRememberMe(true);
      print("Checked");
      print(
          "${emailController.text}  :  ${passwordController.text}  :  ${isRememberMe.value}");
    }
  }

  void logOut() {
    if (isRememberMe.isTrue) {
      get.remove("rememberMe");
      get.remove("email");
      get.remove("password");
      isRememberMe(false);
      print("UnChecked");
      print(
          "${emailController.text}  :  ${passwordController.text}  :  ${isRememberMe.value}");
    }

    isRememberMe(false);
  }
}
