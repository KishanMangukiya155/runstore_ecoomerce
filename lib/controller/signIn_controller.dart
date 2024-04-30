import 'package:runstore_ecoomerce/libraries.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  RxBool obscureText = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Function to sign in user
  Future<void> signInUser(
      {required String email, required String password}) async {
    try {
      // Validate form
      if (!signInFormKey.currentState!.validate()) return;

      // Sign in user in Firebase
      final authRepository = Get.find<AuthRepository>();
      await authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //  Welcome message
      CustomSnackBars.successSnackBar(message: "Welcome to RunStore");

      Get.offAll(() => RootScreen());
    } catch (e) {
      CustomSnackBars.errorSnackBar(message: e.toString());
    }
  }

  // Function to sign in with google
  Future<void> signInWithGoogle() async {
    try {
      // Sign in user with google
      final userDetails = await AuthRepository().signInWithGoogle();

      //  Save user details in Firebase FireStore
      final userRepository = Get.find<UserRepository>();
      await userRepository.saveUserInFireStore(
        fullName: userDetails.user!.displayName ?? "",
        phoneNumber: userDetails.user!.phoneNumber ?? "",
        imageUrl: userDetails.user!.photoURL ?? "",
      );

      //  Show success message
      CustomSnackBars.successSnackBar(message: "User Created");

      // Redirect the user to RootScreen
      Get.offAll(() => RootScreen());
    } catch (e) {
      CustomSnackBars.errorSnackBar(message: e.toString());
    }
  }

  // Function to reset password
  Future<void> resetPassword(String email) async {
    try {
      if (!forgotPasswordFormKey.currentState!.validate()) return;

      // Reset password link
      final authRepository = Get.find<AuthRepository>();
      await authRepository.forgotPassword(email);

      // Redirect the user to RootScreen
      Get.offAll(() => LoginScreen());

      //  Show success message
      CustomSnackBars.successSnackBar(message: "Password reset Successfully");
    } catch (e) {
      CustomSnackBars.errorSnackBar(message: e.toString());
    }
  }

  // Function to signOut user
  void signOutUser() {
    final authRepository = Get.find<AuthRepository>();

    authRepository.signOutUser();

    Get.offAll(() => LoginScreen());
  }
}
