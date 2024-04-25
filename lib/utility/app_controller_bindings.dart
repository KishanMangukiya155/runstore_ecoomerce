import 'package:runstore_ecoomerce/controller/signIn_controller.dart';
import 'package:runstore_ecoomerce/controller/signUp_controller.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class AppControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => CheckOutController(), fenix: true);
    Get.lazyPut(() => OnBoardingScreenController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => RootController(), fenix: true);
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.lazyPut(() => WishListController(), fenix: true);
    Get.lazyPut(() => CatalogController(), fenix: true);
    Get.lazyPut(() => BrandsController(), fenix: true);

    // Repository
    Get.lazyPut(() => AuthRepository(), fenix: true);
  }
}
