import '../libraries.dart';

class AuthController extends GetxController {
  Rx<User?> currentUser = FirebaseAuth.instance.currentUser.obs;

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      currentUser.value = user;
    });
    super.onInit();
  }

  Widget? screenRedirect() {
    if (currentUser.value != null) {
      return RootScreen();
    } else {
      return LoginScreen();
    }
  }
}
