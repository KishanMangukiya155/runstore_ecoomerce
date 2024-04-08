import '../libraries.dart';

class AuthController extends GetxController {
  // controllers that are used for authentication
  // and registering new user
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumber = TextEditingController();

  RxBool obscureText = true.obs;

  void changeObscureText() {
    obscureText(!obscureText.value);
  }
}
