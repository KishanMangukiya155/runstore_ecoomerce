import 'package:runstore_ecoomerce/libraries.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  RxBool obscureText = true.obs;
  final registerFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  Future<void> userSignUp() async {
    try {
      //  form validations
      if (!registerFormKey.currentState!.validate()) return;

      //  Create user in Firebase
      final authRepository = Get.find<AuthRepository>();
      await authRepository.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      //  Save user details in Firebase FireStore
      final userRepository = Get.find<UserRepository>();
      await userRepository.saveUserInFireStore(
        fullName: fullNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        imageUrl: "",
      );

      //  Show success message
      CustomSnackBars.successSnackBar(message: "User Created");

      Get.offAll(() => RootScreen());
    } catch (e) {
      CustomSnackBars.errorSnackBar(message: e.toString());
    }
  }
}
