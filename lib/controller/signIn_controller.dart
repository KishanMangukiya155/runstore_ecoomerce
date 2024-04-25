import 'package:runstore_ecoomerce/libraries.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();

  RxBool obscureText = true.obs;

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  // Function to sign in user
  void signInUser({required String email, required String password}) {
    final authRepository = Get.find<AuthRepository>();

    authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Function to signOut user
  void signOutUser() {
    final authRepository = Get.find<AuthRepository>();

    authRepository.signOutUser();

    Get.offAll(() => LoginScreen());
  }
}
