import 'package:runstore_ecoomerce/libraries.dart';

class AppControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => OnBoardingScreenController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => ThemeController());
  }
}
